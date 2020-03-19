package google.maps;

import haxe.extern.EitherType;

typedef CircleOptions = {
	?center:EitherType<LatLng,LatLngLiteral>,
	?clickable:Bool,
	?draggable:Bool,
	?editable:Bool,
	?fillColor:String,
	?fillOpacity:Float,
	?map:google.maps.Map,
	?radius:Int,
	?strokeColor:String,
	?strokeOpacity:Float,
	?strokeWeight:Int,
	?visible:Bool,
	?zIndex:Int
}