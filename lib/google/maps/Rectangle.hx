package google.maps;

import haxe.extern.EitherType;

extern class Rectangle extends MVCObject {
	
	public function new(?opts:RectangleOptions);
	
	public function getBounds():LatLngBounds;
	public function getDraggable():Bool;
	public function getEditable():Bool;
	public function getMap():Map;
	public function getVisible():Bool;
	public function setBounds(bounds:EitherType<LatLng, LatLngLiteral>):Void;
	public function setDraggable(draggable:Bool):Void;
	public function setEditable(editable:Bool):Void;
	public function setMap(map:Map):Void;
	public function setOptions(options:RectangleOptions):Void;
	public function setRadius(radius:Int):Void;
	public function setVisible(visible:Bool):Void;

	/**
	 * EVENTS
	 */
	
	inline function onClick(handler:(event:MouseEvent)->Void) this.on('click', handler);
}