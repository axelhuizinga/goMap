package google.maps;

import google.maps.Point;
import lib.google.maps.LatLng;

interface Projection {
	public function fromLatLngToPoint(latLng:LatLng, point:Point):Point;
	public function fromPointToLatLng(pixel:Point, noWrap:Bool):LatLng;
}