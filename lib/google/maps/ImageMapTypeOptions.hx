package google.maps;

import google.maps.Projection;
import google.maps.Size;

interface ImageMapTypeOptions{

	public var alt:String;
	public var maxZoom: Int;	
	public var minZoom: Int;
	public var name: String;
	public var projection: Projection;
	public var radius: Int;
	public var tileSize: Size;

}