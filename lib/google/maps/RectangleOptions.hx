package google.maps;

import google.maps.LatLngBounds;
import google.maps.LatLngBoundsLiteral;
import google.maps.StrokePosition;

typedef RectangleOptions = {
	?bounds:EitherType<LatLngBounds,LatLngBoundsLiteral>,
	?clickable:Bool,
	?draggable:Bool,
	?editable:Bool,
	?fillColor:String,
	?fillOpacity:Float,
	?map:google.maps.Map,
	?radius:Int,
	?strokeColor:String,
	?strokeOpacity:Float,
	?strokePosition:StrokePosition,
	?strokeWeight:Int,
	?visible:Bool,
	?zIndex:Int
}

