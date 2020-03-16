package react.types.or;

import haxe.extern.EitherType;

typedef CallbackOrVoid<Callback> = EitherType<Callback, Noop>;
