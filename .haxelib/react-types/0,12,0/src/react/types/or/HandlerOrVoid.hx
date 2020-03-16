package react.types.or;

import haxe.Constraints.Function;
import haxe.extern.EitherType;
import react.types.event.ClassicHandler;

typedef HandlerOrVoid<Handler:Function> = EitherType<Handler, EitherType<Noop, ClassicHandler>>;
