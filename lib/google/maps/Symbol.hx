package google.maps;

import google.maps.SymbolPath;
import haxe.extern.EitherType;
import google.maps.Point;

typedef Symbol = {
	?anchor:Point,
	?fillColor:String,
	?fillOpacity:Float,
	?labelOrigin:Point,
	path:EitherType<SymbolPath,String>,
	?rotation:Int,
	?scale:Int,
	?strokeColor:String,
	?strokeOpacity:Float,
	?strokeWeight:String
}