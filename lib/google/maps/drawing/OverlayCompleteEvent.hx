package google.maps.drawing;

import google.maps.Circle;
import google.maps.Polyline;
import google.maps.Polygon;
import google.maps.Rectangle;


import haxe.extern.EitherType;

typedef OverlayCompleteEvent = {
	overlay:EitherType<Marker,EitherType<Polygon,EitherType<Polyline,EitherType<Rectangle,Circle>>>>,
	type:OverlayType
}