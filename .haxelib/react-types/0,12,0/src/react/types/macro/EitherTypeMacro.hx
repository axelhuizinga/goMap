package react.types.macro;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.TypeTools;

class EitherTypeMacro {
	public static function build():ComplexType {
		return switch (Context.getLocalType()) {
			case TInst(_, []): throw false;
			case TInst(_, [t]): TypeTools.toComplexType(t);

			case TInst(_, types):
				makeEither(TypeTools.toComplexType(types.shift()), types);

			default: throw false;
		};
	}

	static function makeEither(base:ComplexType, others:Array<Type>):ComplexType {
		if (others.length == 0) return base;
		var next = TypeTools.toComplexType(others.shift());
		var right = (others.length == 0) ? next : makeEither(next, others);
		return macro :haxe.extern.EitherType<$base, $right>;
	}
}
