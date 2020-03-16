# Using the new context API

TODO: example app with something like

* an appbar with a user menu
* some left panel with profile editing
* some comment area with a comment form and a user badge

```haxe
typedef MyContextProps = {
	// Actual context data
	> MyContextData,

	// Methods exposed to alter context
	var switchUser:Void->Void;
	var closeServer:Void->Void;
	var logout:Void->Void;
}

typedef MyContextData = {
	// @:optional
	var server:ServerDefinition;

	@:optional var appToken:String;
	@:optional var userToken:String;

	@:optional var idUser:String;
	@:optional var idCompany:Int;
}

typedef ServerContextProviderProps = {
	var value:MyContextProps;
}

typedef ServerContextConsumerProps = {
	var children:MyContextProps->ReactFragment;
}

class MyContext {
	public static var Context:ReactContext<MyContextProps>;
	public static var Provider:ReactTypeOf<ServerContextProviderProps>;
	public static var Consumer:ReactTypeOf<ServerContextConsumerProps>;

	public static function init() {
		Context = React.createContext();
		Consumer = Context.Consumer;
		Provider = Context.Provider;
	}
}
```
