package view;

import comments.StringTransform;
import haxe.Timer;
import history.History;
import history.BrowserHistory;
import me.cunity.debug.Out;
import state.AppState;
import state.UserState;
import react.Fragment;
import react.ReactComponent.ReactFragment;
import react.React;
import react.ReactComponent;
import react.ReactComponent.*;
import react.ReactMacro.jsx;
import react.React.ReactChildren;
import react.ReactPropTypes;
import react.ReactRef;
import redux.react.ReactRedux.connect;
import redux.Store;
import redux.Redux;
//import router.RouteComponentProps;


//import action.AppAction;
import state.AppState;
import App;
//import view.relationsBox;
//import view.AccountingBox;
//import view.ReportsBox;

/**
 * ...
 * @author axel@cunity.me
 */

/*typedef  NavLinks =
{
	id:Int,
	component:ReactComponent,
	label:String,
	url:String
}*/

typedef UIProps =
{
	?store:Store<AppState>,
	?userState:UserState
}

typedef UIState =
{
	?hasError:Bool,
	?rFlag:Int
}

@:connect
class UiView extends ReactComponentOf<UIProps, UIState>
{
	var browserHistory:History;
	var dispatchInitial:Dispatch;
	var mounted:Bool;
	//static var _me:UiView;

	static function mapStateToProps(aState:AppState):UIProps
	{		
		//trace(aState.user.id);
		trace(Reflect.fields(aState));
		return {
			userState:aState.userState
		};
	}
	
	public function new(props:Dynamic) {
		trace(Reflect.fields(props));
        super(props);
		state = {hasError:false};
		browserHistory = BrowserHistory.create({basename:"/"});
		//ApplicationStore.startHistoryListener(App.store, browserHistory);
		//trace(this.props.userState.state.last_name);
		mounted = false;
		//_me = this;
		App.modalBox = React.createRef();
    }

	override function componentDidCatch(error, info) {
		// Display fallback UI
		if(mounted)
		this.setState({ hasError: true });
		// You can also log the error to an error reporting service
		//logErrorToMyStore(error, info);
		trace(error);
	}

    override function componentDidMount() {
		mounted = true;
    }

	override function componentDidUpdate(prevProps:Dynamic, prevState:Dynamic)//,snapshot:Dynamic
	{
		//trace(prevState);
		//trace(prevProps);
		//trace(App.firstLoad); 
		//App.firstLoad = false;
	}

	var tabList:Array<Dynamic> = [];
	/*	{ 'key': 1, 'component': DashBoard, 'label': 'DashBoard', 'url': '/DashBoard' },
		{ 'key': 2, 'component': Data, 'label': 'Data', 'url': '/Data' },
		{ 'key': 3, 'component': QC, 'label': 'QC', 'url': '/qc' },
		{ 'key': 4, 'component': Accounting, 'label': 'Buchhaltung', 'url': '/accounting' },
		{ 'key': 5, 'component': Reports, 'label': 'Berichte', 'url': '/reports' },
	];*/

	/*function createRoutes()
	{
		var routes:Array<Dynamic> = tabList.map(
		function(el) {
			return jsx('
			<Route path=${el.url} component=${el.component}/>
			');
		});
		return routes;
	}*/

	override function render()
	{
		if(props.userState.dbUser !=null)
		trace(props.userState.dbUser.id);
		if (state.hasError || props.userState.dbUser == null) {
		  return jsx('<h1>Something went wrong.</h1>');
		}

			trace('waiting hero');
			return jsx('
			<section className="hero is-alt is-fullheight">
			  <div className="hero-body">
			  <div className="loader"  style=${{width:'7rem', height:'7rem', margin:'auto', borderWidth:'0.58rem'}}/>
			  </div>
			</section>
			');		
		
	}
	
}