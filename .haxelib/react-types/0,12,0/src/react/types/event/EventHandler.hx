package react.types.event;

import js.html.DOMElement;
import react.types.SyntheticEvent;

typedef EventHandler<TElement:DOMElement, E:BaseSyntheticEvent<TElement>> = E->Void;
typedef ReactEventHandler<TElement:DOMElement> = EventHandler<TElement, BaseSyntheticEvent<TElement>>;

typedef ClipboardEventHandler<TElement:DOMElement> = EventHandler<TElement, ClipboardEvent<TElement>>;
typedef CompositionEventHandler<TElement:DOMElement> = EventHandler<TElement, CompositionEvent<TElement>>;
typedef DragEventHandler<TElement:DOMElement> = EventHandler<TElement, DragEvent<TElement>>;
typedef FocusEventHandler<TElement:DOMElement> = EventHandler<TElement, FocusEvent<TElement>>;
typedef FormEventHandler<TElement:DOMElement> = EventHandler<TElement, FormEvent<TElement>>;
typedef ChangeEventHandler<TElement:DOMElement> = EventHandler<TElement, ChangeEvent<TElement>>;
typedef InputEventHandler<TElement:DOMElement> = EventHandler<TElement, InputEvent<TElement>>;
typedef KeyboardEventHandler<TElement:DOMElement> = EventHandler<TElement, KeyboardEvent<TElement>>;
typedef MouseEventHandler<TElement:DOMElement> = EventHandler<TElement, MouseEvent<TElement>>;
typedef TouchEventHandler<TElement:DOMElement> = EventHandler<TElement, TouchEvent<TElement>>;
typedef PointerEventHandler<TElement:DOMElement> = EventHandler<TElement, PointerEvent<TElement>>;
typedef UIEventHandler<TElement:DOMElement> = EventHandler<TElement, UIEvent<TElement>>;
typedef WheelEventHandler<TElement:DOMElement> = EventHandler<TElement, WheelEvent<TElement>>;
typedef AnimationEventHandler<TElement:DOMElement> = EventHandler<TElement, AnimationEvent<TElement>>;
typedef TransitionEventHandler<TElement:DOMElement> = EventHandler<TElement, TransitionEvent<TElement>>;

