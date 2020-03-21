package google.maps;

import haxe.extern.EitherType;

extern class LatLngBounds {
	public function new(?sw:EitherType<LatLng,LatLngLiteral>);
		
	public function equals(other:LatLng):Bool;
}