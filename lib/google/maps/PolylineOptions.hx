package google.maps;

import google.maps.LatLngLiteral;
import google.maps.LatLng;
import google.maps.MVCArray;
import haxe.extern.EitherType;

typedef PolylineOptions = {
	?clickable:Bool,
	?draggable:Bool,
	?editable:Bool,
	?geodesic:Bool,
	?map:google.maps.Map,
	?path:EitherType<MVCArray<LatLng>, Array<EitherType<LatLng, LatLngLiteral>>>,
	?strokeColor:String,
	?strokeOpacity:Float,
	?strokeWeight:Int,
	?visible:Bool,
	?zIndex:Int
}