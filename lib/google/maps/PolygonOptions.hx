package google.maps;

import google.maps.LatLngLiteral;
import google.maps.LatLng;
import google.maps.MVCArray;
import haxe.extern.EitherType;

typedef PolygonOptions = {
	?clickable:Bool,
	?draggable:Bool,
	?editable:Bool,
	?fillColor:String,
	?fillOpacity:Float,
	?geodesic:Bool,
	?map:google.maps.Map,
	?paths:EitherType<MVCArray<MVCArray<LatLng>>, 
		EitherType<MVCArray<LatLng>, 
			EitherType<Array<Array<EitherType<LatLng, LatLngLiteral>>>,Array<EitherType<LatLng, LatLngLiteral>>>>>,
	?strokeColor:String,
	?strokeOpacity:Float,
	?strokeWeight:Int,
	?visible:Bool,
	?zIndex:Int
}