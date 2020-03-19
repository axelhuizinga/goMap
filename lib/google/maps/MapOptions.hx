package google.maps;
import google.maps.LatLng;
import google.maps.LatLngLiteral;

import haxe.extern.EitherType;

typedef MapOptions = {
	?backgroundColor:String,
	?center:EitherType<LatLng,LatLngLiteral>,
	?clickableIcons:Bool,
	?controlSize:Int,
	?disableDefaultUI:Bool,
	?disableDoubleClickZoom:Bool,
	?draggable:Bool,
	?draggableCursor:String,
	?draggingCursor:String,
	?fullscreenControl:Bool,
	?fullscreenControlOptions:
}