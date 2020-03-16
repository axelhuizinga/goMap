package react.types;

import haxe.Constraints.Function;

typedef ClassicHandler = react.types.event.ClassicHandler;
typedef HandlerOrVoid<Handler:Function> = react.types.or.HandlerOrVoid<Handler>;
