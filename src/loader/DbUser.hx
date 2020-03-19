package loader;

class DbUser{
	
	public var active:Bool;
	public var change_pass_required:Bool;
	public var contact:Int;
	public var edited_by:Int;
	public var editing:String;
	public var email:String;
	public var external:String;
	public var first_name:String;	
	public var id:Int;
	public var jwt:String;	
	public var last_locktime:String;	
	public var last_login:String;	
	public var last_name:String;
	public var last_request_time:String;
	public var mandator:Int;
	public var online:Bool;	
	public var password:String;
	public var last_error:String;
	public var settings:String;
	public var new_pass:String;	
	public var user_group:Int;
	public var user_name:String;

	public function new(p:Dynamic){
		for(f in Type.getInstanceFields(Type.getClass(this))){
			switch (f){
				case '__uid'|'getCLID'|'serialize'|'unserialize'|'unserializeInit'|'getSerializeSchema':
					//SKIP
				default:
					Reflect.setField(this, f, Reflect.field(p,f));
			}
		}		
	};

}