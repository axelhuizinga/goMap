package react.types.or;

import haxe.extern.EitherType;
import react.ReactComponent.ReactFragment;

typedef FragmentOrCallback = EitherType<ReactFragment, Void->ReactFragment>;
