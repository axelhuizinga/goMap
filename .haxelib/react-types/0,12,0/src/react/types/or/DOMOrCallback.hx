package react.types.or;

import haxe.extern.EitherType;
import js.html.DOMElement;

typedef DOMOrCallback = EitherType<DOMElement, Void->DOMElement>;
