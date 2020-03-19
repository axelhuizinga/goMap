package google.maps;

import haxe.Constraints.Function;

typedef MapsEventListener = {
	public function remove():Void;
}

extern class MVCObject {
	public function addListener(eventName:String, handler:Function):MapsEventListener;
	
	public function bindTo(key:String, target:MVCObject, ?targetKey:String, ?noNotify:Bool):Void;			
	public function get(key:String):Dynamic;	
	public function notify(key:String):Void;	
	public function set(key:String, value:Dynamic):Void;		
	public function setValues(?values:Dynamic):Void;		
	public function unbind(key:String):Void;		
	public function unbindAll():Void;		
}