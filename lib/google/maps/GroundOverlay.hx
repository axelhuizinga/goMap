package google.maps;

import google.maps.LatLngBounds;
import google.maps.LatLngBoundsLiteral;
import google.maps.Map;
import haxe.extern.EitherType;

extern class GroundOverlay {

	public function new(url:String, bounds:EitherType<LatLngBounds,LatLngBoundsLiteral>, ?opts:GroundOverlayOptions);
	public function getBounds():LatLngBounds;
	public function getMap():Map;
	public function getOpacity():Float;
	public function getUrl():String;
	public function setMap():Void;
	public function setOpacity():Void;

}