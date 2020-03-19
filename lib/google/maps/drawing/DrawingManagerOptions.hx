package lib.google.maps.drawing;

import google.maps.drawing.OverlayType;
import google.maps.drawing.DrawingControlOptions;
import google.maps.CircleOptions;

typedef DrawingManagerOptions = {
	?circleOptions:CircleOptions,
	?drawingControl:Bool,
	?drawingControlOptions:DrawingControlOptions,
	?drawingMode:OverlayType,
	?map:google.maps.Map,
	?markerOptions:MarkerOptions,
	?polygonOptions
}