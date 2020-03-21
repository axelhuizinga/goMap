package google.maps;

import haxe.extern.EitherType;

typedef MapRestriction = {
	?latLngBounds:EitherType<LatLngBounds, LatLngBoundsLiteral>,
	?strictBounds:Bool
}