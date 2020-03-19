package google.maps;

extern class Size {
	public var height:Int;
	public var width:Int;
	public function(width:Int, height:Int, ?widthUnit:String, ?heightUnit:String);
	public function equals(other:Size):Bool;
	public function toString():String;
}