package google.maps;

extern class Marker extends MVCObject{
	public function new(?opts:MarkerOptions);
	
	public function getAnimation():Animation;
	public function getClickable():Bool;
	public function getCursor():String;
	public function getDraggable():Bool;
	public function getIcon():EitherType<String, EitherType<Icon, Symbol>>;
	public function getLabel():MarkerLabel;
	public function getMap():EitherType<Map, StreetViewPanorama>;
	public function getOpacity():Float;
	public function getPosition():LatLng;	
	public function getShape():MarkerShape;
	public function getTitle():String;
	public function getVisible():Bool;
	public function getZIndex():Int;
	public function setAnimation(animation:Animation):Void;
	public function setClickable(flag:Bool):Void;
	public function setCursor(cursor:String):Void;
	public function setDraggable(flag:Bool):Void;
	public function setIcon(EitherType<String, EitherType<Icon,Symbol>>):Void;
	public function setLabel(label:EitherType<String, MarkerLabel>):Void;	
	public function setMap(map:EitherType<Map, StreetViewPanorama>):Void;
	public function setOpacity(opacity:Float):Void;
	public function setOptions(options:MarkerOptions):Void;
	public function setPosition(latLng:EitherType<LatLng, LatLngLiteral>):Void;
	public function setShape(shape:MarkerShape):Void;
	public function setTitle(title:String):Void;
	public function setVisible(visible:Bool):Void;
	public function setZIndex(zIndex:Int):Void;
}