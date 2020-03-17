package view;
import react.router.RouterMatch;
import view.shared.io.User;

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
import react.router.NavLink;
import react.router.Redirect;
import react.router.Route;
//import react.addon.router.Route;
//import react.router.Switch;
import react.router.Router;
//import react.addon.router.BrowserRouter;
//import react.router.Route.RouteComponentProps;
import react.router.Route.RouteRenderProps;
import react.router.bundle.Bundle;

import bulma_components.Tabs;

//import action.AppAction;
import state.AppState;
import App;
//import view.relationsBox;
import view.DashBoard;
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
		browserHistory = App.store.getState().locationStore.history;// BrowserHistory.create({basename:"/"});
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
		if (props.userState.waiting)
		{
			trace('waiting hero');
			return jsx('
			<section className="hero is-alt is-fullheight">
			  <div className="hero-body">
			  <div className="loader"  style=${{width:'7rem', height:'7rem', margin:'auto', borderWidth:'0.58rem'}}/>
			  </div>
			</section>
			');		
		}
		
		trace('${props.userState.dbUser.jwt} ${props.userState.dbUser.online}');
		if(props.userState.dbUser.jwt == null || props.userState.dbUser.jwt == '' || !props.userState.dbUser.online || props.userState.dbUser.change_pass_required)//
		{
			// WE NEED TO LOGIN FIRST
			trace(props.userState.dbUser);
			//return null;
			return jsx('<$LoginForm userState=${props.userState}/>');
		}
		else
		{			
			trace(browserHistory.location.pathname);
			trace(App.store.getState().locationStore.history.location.pathname);
			//trace(App.store.getState());
			trace(App.store.getState().locationStore.history == browserHistory);
			if(browserHistory.location.pathname!=App.store.getState().locationStore.redirectAfterLogin)
			{
				trace('Redirect to: ${App.store.getState().locationStore.redirectAfterLogin}');
				 browserHistory.push(App.store.getState().locationStore.redirectAfterLogin);
				 setState({rFlag:state.rFlag+1});
			/*	return jsx('<$Router history=${browserHistory} >
					<Redirect to=${App.store.getState().locationStore.redirectAfterLogin}/>
				</$Router>'
				); */
			}
			return
			#if debug 
				jsx('
			<$Router history={browserHistory} >
			<>
				<div className="modal" ref=${App.modalBox}/>
				<div className="topNav">
					<$Route path="/DashBoard" {...props} component=${NavTabs}/>
					<$Route path="/Data" {...props} component=${NavTabs}/>
					<$Route path="/Accounting" {...props} component=${NavTabs}/>					
					<$Route path="/Reports" {...props} component=${NavTabs}/>
				</div>
				
				<div className="tabComponent" id="development">
					<$Route path="/"  render={renderRedirect} exact={true}/>									
					<$Route path="/DashBoard*" component=${DashBoard}/>
					<$Route path="/Data" component=${Data}/>
					<$Route path="/Accounting" component=${Accounting}/>					
					<$Route path="/Reports" component=${Reports}/>
				</div>
			</>
			</$Router>
			');
			#else 
				jsx('
			<$Router history={browserHistory} >
			<>
				<div className="modal" ref=${App.modalBox}/>
				<div className="topNav">
					<$Route path="/DashBoard" {...props} component=${NavTabs}/>
					<$Route path="/Data" {...props} component=${NavTabs}/>
					<$Route path="/Accounting" {...props} component=${NavTabs}/>
					<$Route path="/Reports" {...props} component=${NavTabs}/>
				</div>
				<div className="tabComponent">
					<$Route path="/"  render={renderRedirect} exact={true}/>									
					<$Route path="/DashBoard*" component=${Bundle.load(DashBoard)}/>
					<$Route path="/Data" component=${Bundle.load(Data)}/>
					<$Route path="/Accounting" component=${Bundle.load(Accounting)}/>					
					<$Route path="/Reports" component=${Bundle.load(Reports)}/>
				</div>				
			</>
			</$Router>
			');		
			#end
		}
	/**
	 * #debug
	 * <$Route path="/Qc" {...props} component=${NavTabs}/>
	 * 
	 * #production
	 * <$Route path="/Qc" component=${Bundle.load(QC)}/>
	 */
	}
	
	function renderRedirect(?p:Dynamic)
	{
		trace(App.store.getState().locationStore.redirectAfterLogin);
		//return null;
		return jsx('<RedirectBox to=${p==null?App.store.getState().locationStore.redirectAfterLogin:p.to}/>');
	}
}