package google.maps;

extern class MVCArray<T> {
	
	public function new(?array:Array<T>);
	public function clear():Void;
	public function forEach(callback:T->Int->Void):Void;
	public function getArray():Void;
	public function getAt(i:Int):Void;
	public function getLength():Int;	
	public function insertAt(i:Int, elem:T):Void;
	public function pop():Void;
	public function push(elem:T):Void;
	public function removeAt():Void;
	public function setAt():Void;
}