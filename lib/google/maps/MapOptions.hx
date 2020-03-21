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
	?fullscreenControlOptions:FullscreenControlOptions,
	?gestureHandling:String,
	?heading:Int,
	?keyboardShortcuts:Bool,
	?mapTypeControl:Bool,
	?mapTypeControlOptions:MapTypeControlOptions,
	?mapTypeId: EitherType<MapTypeId, String>,
	?maxZoom:Int,
	?minZoom:Int,
	?noClear:Bool,
	?panControl:Bool,
	?panControlOptions:PanControlOptions,
	?restriction:MapRestriction,
	?rotateControl:Bool,
	?rotateControlOptions:RotateControlOptions,
	?scaleControl:Bool,
	?scaleControlOptions:ScaleControlOptions,
	?scrollwheel:Bool,
	?streetView:StreetViewPanorama,
	?streetViewControl:Bool,
	?streetViewControlOptions:StreetViewControlOptions,
	?styles:Array<MapTypeStyle>,
	?tilt:Int,
	?zoom:Int,
	?zoomControl:Bool,
	?zoomControlOptions:ZoomControlOptions
}