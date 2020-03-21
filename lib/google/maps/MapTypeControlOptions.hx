package google.maps;

import google.maps.MapTypeControlStyle;
import google.maps.ControlPosition;
import haxe.extern.EitherType;

typedef MapTypeControlOptions = {
	?mapTypIds:Array<EitherType<MapTypeId, String>>,
	?position:ControlPosition,
	?style:MapTypeControlStyle
}