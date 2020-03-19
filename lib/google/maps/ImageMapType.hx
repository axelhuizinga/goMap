package google.maps;

import google.maps.MVCObject;
import google.maps.ImageMapTypeOptions;
import google.maps.Size;
import js.html.Node;

extern class ImageMapType extends MVCObject implements MapType{
	
	public var alt:String;
	public var maxZoom:Int;
	public var minZoom:Int;
	public var name:String;
	public var projection:google.maps.Projection;
	public var radius:Int;
	public var tileSize:Size;

	public function new(opts:ImageTypOptions);
	public function getOpacity():Float;	
	public function releaseTile(tileDev:Node);
	public function setOpacity(opacity:Float);

	public inline function tilesLoaded():Void;
}