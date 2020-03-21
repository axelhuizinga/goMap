package google.maps;

enum abstract MapTypeId(String) {
	var HYBRID = 'hybrid';
	var ROADMAP = 'roadmap';
	var SATELLITE = 'satellite';
	var TERRAIN = 'terrain';
}