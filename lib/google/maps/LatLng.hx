package lib.google.maps;

typedef LatLngLiteral = {
	lat:Float,
	lng:Float
}

extern class LatLng {
	public function new(lat:Float, lng:Float, ?noWrap:Bool);
		
	public function equals(other:LatLng):Bool;
	public function toJSON():LatLngLiteral;
	public function toString():String;
	public function toUrlValue(?precision:Float):String;
	
	
}