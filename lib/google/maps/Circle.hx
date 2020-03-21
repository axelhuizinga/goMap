package google.maps;

import haxe.extern.EitherType;

extern class Circle extends MVCObject {
	
	public function new(?opts:CircleOptions);

	
	public function getBounds():LatLngBounds;
	public function getCenter():LatLng;
	public function getDraggable():Bool;
	public function getEditable():Bool;
	public function getMap():Map;
	public function getRadius():Int;
	public function getVisible():Bool;
	public function setCenter(center:EitherType<LatLng, LatLngLiteral>):Void;
	public function setDraggable(draggable:Bool):Void;
	public function setEditable(editable:Bool):Void;
	public function setMap(map:Map):Void;
	public function setOptions(options:CircleOptions):Void;
	public function setRadius(radius:Int):Void;
	public function setVisible(visible:Bool):Void;
}