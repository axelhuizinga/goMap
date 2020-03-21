package view;

import google.maps.MouseEvent;
import google.maps.Polyline;
import js.Browser;
import js.html.SelectElement;
import action.DrawingMapAction;
import js.html.Event;
import haxe.Timer;
import js.html.audio.WaveShaperOptions;
import action.UserAction;
import react.ReactComponent.ReactFragment;
import react.ReactType;
import js.html.Image;
import js.html.InputElement;
import js.html.InputEvent;
import js.html.XMLHttpRequest;
import state.AppState;
import state.DrawingMapState;
import state.UserState;
import react.Partial;
import react.ReactComponent.ReactComponentOf;
import react.ReactMacro.jsx;
import react.ReactUtil.copy;
import redux.Redux;
import redux.react.ReactRedux.connect;
import redux.Store;
import loader.UserAccess;

using shared.Utils;
using StringTools;


typedef DrawingMapProps =
{
	?dispatch:Dispatch,
	?stateChange:DrawingMapState->Dispatch,
	?store:Store<AppState>,
	?userState:UserState
}

/**
 * ...
 * @author axel@cunity.me
 */


@:connect
class DrawingMap extends ReactComponentOf<DrawingMapProps, DrawingMapState>
{
	var submitValue:String;
	static var uBCC:Dynamic;
	static var uBState:Dynamic;

	public function new(?props:DrawingMapProps)
	{
		trace(Reflect.fields(props));
		super(props);
		trace(props);
		submitValue = '';
		state = {hasError:false, dbUser:copy(props.userState,{waiting:false})};//{user_name:'',pass:'',new_pass_confirm: '', new_pass: '',waiting:true};
	}

	static function mapDispatchToProps(dispatch:Dispatch) {
		trace('ok');
		return {
			dispatch:dispatch,
			stateChange: function (dState:DrawingMapState) return dispatch(DrawingMapAction.Update(dState))
		};
	}

	override public function shouldComponentUpdate(nextProps:DrawingMapProps, nextState:DrawingMapState) {
		trace('propsChanged:${nextProps!=props} stateChanged:${nextState!=state}');
		if(nextState!=state)
		{
			state.compare(nextState);
		}
		if(nextProps!=props)
		{
			props.compare(nextProps);
			//props.userState.dbUser.compare(nextProps.userState);
		}
		return nextProps!=props;
	}

	override function componentDidCatch(error, info) 
	{		
		trace(error);
		trace(info);
	}
		
	override public function componentDidMount():Void 
	{
		var map = new google.maps.Map(Browser.document.getElementById('map'),{
			center: {lat: 0, lng: 8},
			zoom: 3
		});
		var path:Polyline = new Polyline({
			path:[
				
				{lat:3.3, lng: 8.8},
				{lat:-3.3, lng: -8.8}
			],
			strokeWeight: 22
		});
		path.addListener('click',function(evt:MouseEvent){
			
			trace(evt);
			trace(Reflect.fields(this));
		});
		path.setMap(map);
		trace(props);
	}
	
	static function mapStateToProps(aState:AppState):DrawingMapProps {

		var uState = aState.userState;
			//trace(aState.locationStore.redirectAfterLogin);
		trace(uState);		
		return {
			userState:uState
		};
	}	
	
	function handleChange(e:InputEvent)
	{
		var s:Dynamic = {dbUser:props.userState.dbUser};
		var t:InputElement = cast e.target;
		trace(t.name);
		trace(t.value);
		if(t.name == 'new_pass' && t.value==props.userState.dbUser.password)
		{
			//password not changed
			t.value='';
		}
		//TODO: HANDLE CHANGE
		Reflect.setField((t.name.indexOf('new_pass')==-1? s.dbUser:s), t.name, t.value);
		props.stateChange(copy(props.userState,s));
		//trace(props.dispatch + '==' + App.store.dispatch);
		//trace(props.dispatch == App.store.dispatch);
		//App.store.dispatch(UserAction.LoginChange(s));
		//TODO: PUT INTO Global State to avoid rerender
		//this.setState(s);
		trace(this.state);
	}
	
	function handleSubmit(e:InputEvent)
	{
		e.preventDefault();
		trace(props);
		trace(state);
		trace(submitValue);
		/*switch (props.userState.loginTask)
		{
			case LoginTask.ResetPassword:
				trace('Reset Password requested');
				trace(props);
				props.resetPassword(props.userState);
				return false;		 	
		}*/ 
		return true;
	}	

	public function  renderForm():ReactFragment
	{		
		
		trace(props.userState.dbUser);
		
		return jsx('
				  	<form name="form" onSubmit={handleSubmit} className="login" >
						<div className="formField">
								<label className="fa userIcon" forhtml="login_user_name">
										<span className="hidden">User ID</span>
								</label>
								<input id="login_user_name" name="user_name" 
								className=${errorStyle("user_name") + "form-input"}  
								placeholder="User ID" value=${props.userState.dbUser.user_name} onChange=${handleChange} />
						</div>
						<div className="formField">
								<label className="fa lockIcon" forhtml="pw">
										<span className="hidden">Password</span>
								</label>
								<input id="pw" className=${errorStyle("password") + "form-input"} name="password" value=${props.userState.dbUser.password} type="password" placeholder="Password" onChange=${handleChange} />
						</div>
						<div className="formField">
								<input type="submit" style=${{width:'100%'}} value="Login" onClick=${function(){submitValue='Login';return true;}}/>
						</div>
						<div className="formField" style=${{display: (props.userState.loginTask == ResetPassword? 'flex':'none')}} 
						 onClick=${function(){submitValue='ResetPassword';return true;}}>
								<input type="submit" value="Passwort vergessen?"/>
						</div>
					</form>
		');
		return null;
	}

	override public function render()
	{
		trace(Reflect.fields(props));
		trace(props.userState.lastError);
		trace(state.waiting);
		var style = 
		{
			width:'90%',
			height:'90%'
		};
		
		if (state.waiting)
		{
			return jsx('
			<section className="hero is-alt is-fullheight">
			  <div className="hero-body">
			  <div className="loader"  style=${{width:'7rem', height:'7rem', margin:'auto', borderWidth:'0.58rem'}}/>
			  </div>
			</section> 
			');		
		}
		/**
		 * 					<div className="form2">	
						${renderForm()}						
					</div> 
		 */
		return jsx('
			<section className="hero is-alt is-fullheight">
				<div className="formBox is-rounded" style=${style} id="map">
					<div className="form22" >	
					</div>
				</div>
			</section>
		');
	}
	
	function errorStyle(name:String):String
	{
		var eStyle = switch(name)
		{
			case "password":
				var res = props.userState.lastError == "password"?"error ":"";
				trace(res);
				res;
				
			case "user_name":
				props.userState.lastError == "user_name"?"error ":"";
			
			case "new_pass_confirm":
				props.userState.new_pass != props.userState.new_pass_confirm?"error ":"";

			default:
				"";
		}
		trace(eStyle);
		return eStyle;
	}
	
}