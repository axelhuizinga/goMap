package google.maps;

import haxe.extern.EitherType;

extern class MapTypeRegistry {
	public function set(id:String, mapType:EitherType<MapType,Dynamic>):Void;
}