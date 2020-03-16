package react.types.or;

import haxe.extern.EitherType;
import js.html.Element;
import react.ReactComponent.ReactElement;

typedef ElementOrNode = EitherType<Element, ReactElement>;
