package react.types.dom.svg;

@:enum abstract CrossOrigin(String) {
	var Anonymous = 'anonymous'; // "" works too
	var UseCredentials = 'use-credentials';
}
