package google.maps;

import haxe.extern.EitherType;
import google.maps.Animation;
import google.maps.Point;

import haxe.extern.EitherType;

typedef MarkerOptions = {
	?anchorPoint:Point,
	?animation:Animation,
	?clickable:Bool,
	?crossOnDrag:Bool,
	?cursor:String,
	?draggable:Bool,
	?icon:EitherType<String,EitherType<Icon,Symbol>>,
	?label:EitherType<String,MarkerLabel>,
	?map:EitherType<Map,StreetViewPanorama>,
	?opacity:Float,
	?optimized:Bool,
	?position:EitherType<LatLng,LatLngLiteral>,
	?shape:MarkerShape,
	?title:String,
	?visible:Bool,
	zIndex:Int
}