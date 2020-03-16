import js.lib.Promise;
import react.ReactUtil;
import haxe.macro.Expr.Catch;
import store.DataStore;
import haxe.Constraints.Function;
import haxe.Timer;
import haxe.Serializer;
import haxe.Unserializer;
import haxe.ds.List;
import js.html.DivElement;

import haxe.Json;
import haxe.io.Bytes;
import history.BrowserHistory;
import history.History;
import history.Location;
import history.TransitionManager;
import js.Browser;

import me.cunity.debug.Out;
import view.UiView;
import action.AppAction;
import action.ConfigAction;
import action.DataAction;
import action.LocationAction;
import action.StatusAction;
import action.UserAction;
import action.async.UserAccess;
import state.AppState;
import state.CState;
import state.ConfigState;
import state.FormState;
import store.AppStore;
import store.ConfigStore;
import store.LocationStore;
import store.StatusStore;
import store.UserStore;
import react.React;
import react.ReactComponent.ReactComponentOf;
import react.ReactMacro.jsx;
import react.ReactRef;
import react.intl.ReactIntl;
import react.intl.comp.IntlProvider;
import redux.react.Provider;
import redux.Redux;
import redux.Store;
import redux.StoreBuilder.*;
import redux.thunk.Thunk;
import redux.thunk.ThunkMiddleware;
//import view.shared.io.FormApi;
//import view.shared.FormBuilder;

using Lambda;
using StringTools;

typedef AppProps =
{
	?waiting:Bool
}

class App  extends ReactComponentOf<AppProps, AppState>
{
	//static var fa = require('./node_modules/font-awesome/css/font-awesome.min.css');
	public static var _app:App;
  	static var STYLES = Webpack.require('App.scss');
 
	public static var browserHistory:History;
	
	public static var store:Store<AppState>;
	public static var devIP = Webpack.require('../webpack.local.js').ip;
	public static var config:ConfigState = Webpack.require('../../httpdocs/config.js').config;
	//public static var flatpickr:Function = Webpack.require('flatpickr');
	//public static var German = js.Lib.require('flatpickr/dist/l10n/de.js');
	//static var flat = js.Lib.require('flatpickr/dist/flatpickr.min.css');
	//static var rvirt = js.Lib.require('react-virtualized/styles.css');	
	//static var flat = js.Lib.require('flatpickr/dist/themes/light.css');	
	public static var sprintf:Function = Webpack.require('sprintf-js').sprintf;
	//public static var useBrowserContextCommunication:Dynamic = Webpack.require('react-window-communication-hook');
	//public static var useState:Dynamic = Webpack.require('react').useState;
	public static var modalBox:ReactRef<DivElement> = React.createRef();
	public static var onResizeComponents:List<Dynamic> = new List();
	public static var maxLoginAttempts:Int = 3;
	public static var defaultUrl = '/Data/Contacts/List/get';

	var globalState:Map<String,Dynamic>;
	var tul:TUnlisten;

	private function initStore(history:History):Store<AppState>
	{
		var userStore = new UserStore();
		trace(Reflect.fields(userStore));
		var appWare = new AppStore(userStore);
		var locationStore =  new LocationStore(history);

		var rootReducer = Redux.combineReducers(
		{
			//app:mapReducer(AppAction, appWare),
			config: mapReducer(ConfigAction, new ConfigStore(config)),
			dataStore: mapReducer(DataAction, new DataStore()),
			//locationStore: mapReducer(LocationAction,locationStore),
			status: mapReducer(StatusAction, new StatusStore()),
			userState: mapReducer(UserAction, userStore)
		});
		//var dataStore:DataAccessState = loadFromLocalStorage();
		//trace(dataStore);		
		trace(rootReducer); 
		//return createStore(rootReducer, {dataStore:loadFromLocalStorage()},  
		return createStore(rootReducer, null,  
		Redux.applyMiddleware(
			mapMiddleware(Thunk, new ThunkMiddleware()),
			mapMiddleware(AppAction, appWare),
			mapMiddleware(LocationAction, locationStore),
			mapMiddleware(UserAction, userStore)
			)
		);
	}

	private function loadFromLocalStorage():state.DataAccessState {
		try{
			var sState = Browser.getLocalStorage().getItem('state');
			if(sState == null)
				return {};
			return Unserializer.run(sState);
		} catch(e:Dynamic){
			trace(e);
			return {};
		}

	}

	private function saveToLocalStorage(){
		try{
			//trace('storing ${state.dataStore} locally');
			Browser.getLocalStorage().setItem('state', Serializer.run(store.getState().dataStore));
			//trace( Unserializer.run(Browser.getLocalStorage().getItem('state')));
		}catch(e:Dynamic){
			trace(e);
		}
	}

	static function startHistoryListener(store:Store<AppState>, history:History):TUnlisten
	{
		//trace(history);
		store.dispatch(Location(InitHistory(history/*,
		{
			pathname:store.getState().locationStore.redirectAfterLogin,
			search:'',
			hash:'',
			key:'',
			state:{}
		}*/)));
	
		return history.listen( function(location:Location, action:history.Action){
			trace(location.pathname);			
			store.dispatch(Status(Update({text:location.pathname})));
			store.dispatch(LocationChange(location));
		});
	}	

  	public function new(?props:AppProps) 
	{
		super(props);
		//globalState = new Map();
		untyped flatpickr.localize(German);
		//ReactIntl.addLocaleData({locale:'de'});
		_app = this;
		var ti:Timer = null;
		store = initStore(BrowserHistory.create({basename:"/", getUserConfirmation:CState.confirmTransition}));
		state = store.getState();
		trace(Reflect.fields(state));
		//trace(state);
		tul = startHistoryListener(store, state.locationStore.history);
		//store.subscribe(saveToLocalStorage);
		//var uBCC:Dynamic = react.WinCom.useBrowserContextCommunication('appGlobal');


		Browser.window.onresize = function()
		{
			if(ti!=null)
				ti.stop();
			ti = Timer.delay(function ()
			{
				if(onResizeComponents.isEmpty())
					return;
				var cpi:Iterator<Dynamic>=onResizeComponents.iterator();
				while (cpi.hasNext())
				{
					cpi.next().layOut();
				}
			},250);
		}
		//trace(store);
		trace(state.userState);
		//CState.init(store);		
		if (!(state.userState.dbUser.id == null || state.userState.dbUser.jwt == ''))
		{			
			var p:Promise<DbData> = load();
			p.then(function(dbData:DbData){ 
				trace(dbData.dataErrors.keys().hasNext());
				if(!dbData.dataErrors.empty() && dbData.dataErrors.exists('jwtError')){
					
					store.dispatch(LoginExpired({waiting: false, loginTask: Login}));
				}
				else{

					state.userState.dbUser.online = true;
					store.dispatch(LoginComplete({waiting:false}));					
				}
			});
		}
		else
		{// WE HAVE EITHER NO VALID JWT OR id
			trace('LOGIN required');
			store.dispatch(
				User(
					UserAction.LoginRequired(
						ReactUtil.copy( state.userState, {waiting:false}))));
		}

		//trace(state.userState.jwt);
		
		//state.history.listen(CState.historyChange);
		trace(Reflect.fields(state));
	}
	
	function load():Promise<DbData> {
		return cast store.dispatch(
			action.async.UserAccess.verify());
	}

	public function gGet(key:String):Dynamic
	{
		trace(key);
		return globalState.get(key);
	} 

	public function gSet(key:String,val:Dynamic):Void 
	{
		globalState.set(key,val);
	}

	override function componentDidMount()
	{
		//trace(state.history);
		trace('yeah');
	}

	override function   componentDidCatch(error, info) 
	{
		trace(error);
	}
	
	override function componentDidUpdate(prevProps:Dynamic, prevState:Dynamic)
	{
		trace('...'); 
		//firstLoad = false;
	}

	override function componentWillUnmount() 
	{
		tul();
	}
	// Use trace from props
	public static function edump(el:Dynamic){Out.dumpObject(el); return 'OK'; };

  	override function render() {
		trace(state.userState);
		//trace(state.history.location.pathname);	store={store}	<UiView/>	<div>more soon...</div>
        return jsx('
			<$Provider store={store}>
				<$IntlProvider locale="de">
					<$UiView/>
				</$IntlProvider>
			</$Provider>
        ');
  	}

	public static function 	await(delay:Int, check:Void->Dynamic, cb:Function):Timer
	{
		
		var ti:Timer = null;
		ti = Timer.delay(function ()
		{			
			switch (check()){
				case -1:
					ti.stop;
				case true:
					cb();		
				default: 
					await(delay, check, cb);
			}
		},delay);

		return  ti;
	} 

	public static function initEState(init:Dynamic, ?comp:Dynamic)
	{
		var fS:FormState =
		{
			clean: true,
			formApi:new FormApi(comp, init.sideMenu),
			formBuilder:new FormBuilder(comp),
			hasError: false,
			mounted: false,
			sideMenu: init==null? {}:init.sideMenu
		};
		if(init != null)
		{
			for(f in Reflect.fields(init))
			{
				Reflect.setField(fS, f, Reflect.field(init, f));
			}
		}
		return fS;
	}

	public static function jsxDump(el:Dynamic):String
	{
		Out.dumpObject(el);
		return 'OK';
	}

	public static function queryString2(params:Dynamic)
	{
		var query = Reflect.fields(params)
			.map(function(k){
				 if (Std.is(Reflect.field(params, k), Array))
				 {
					return Reflect.field(params, k)
					  .map(function(val){
						  k.urlEncode() + '[]=' + val.urlEncode();
					  })
					  .join('&');
				}
			 return k.urlEncode() + '=' + StringTools.urlEncode(Reflect.field(params, k));
		})
		.join('&');
		trace(query);
		return query;
	}

}
