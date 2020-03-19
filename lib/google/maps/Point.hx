package google.maps;

extern class Point {
	
	public var x:Int;
	public var y:Int;
	
	public function new(x:Int,y:Int);

	public function equals(other:Point):Bool;
	public function toString():String;
}