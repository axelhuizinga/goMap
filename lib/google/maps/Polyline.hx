package google.maps;

import haxe.extern.EitherType;

extern class Polyline extends MVCObject {
	
	public function new(?opts:PolylineOptions);
	
	public function getDraggable():Bool;
	public function getEditable():Bool;	
	public function getMap():Map;
	public function getPath():MVCArray<LatLng>;
	public function getVisible():Bool;
	public function setBounds(bounds:EitherType<LatLng, LatLngLiteral>):Void;
	public function setDraggable(draggable:Bool):Void;
	public function setEditable(editable:Bool):Void;
	public function setMap(map:Map):Void;
	public function setOptions(options:PolylineOptions):Void;
	public function setRadius(radius:Int):Void;
	public function setVisible(visible:Bool):Void;

	/**
	 * EVENTS
	 */
	
	//inline function onClick(handler:(event:MouseEvent)->Void):Void this.on('click', handler);
}