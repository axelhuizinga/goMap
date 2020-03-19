package google.maps;

import js.html.Node;
import js.html.Document;
import google.maps.Projection;
import google.maps.Size;

interface MapType{

	public var alt:String;
	public var maxZoom: Int;	
	public var minZoom: Int;
	public var name: String;
	public var projection: Projection;
	public var radius: Int;
	public var tileSize: Size;

	public function getTile(tileCoord:Point, zoom:Int, ownerDocument:Document):Node;

	public function releaseTile(tile:Node):Void;
}