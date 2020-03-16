package react.types.macro;

import haxe.macro.ComplexTypeTools;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.TypeTools;

typedef FieldMap = Map<String, Field>;

class ForcedOverrideMacro {
	#if macro
	static var reportUnneeded = Context.defined('react_types_report_unneeded_forcedoverride');
	static var reportUnneededFields = Context.defined('react_types_report_unneeded_field_override');
	static var reportFieldOverride = Context.defined('react_types_report_field_override');
	#end

	public static function build():ComplexType {
		return switch (Context.getLocalType()) {
			case TInst(_, []): throw false;

			case TInst(_, types):
				var fields:FieldMap = Lambda.fold(types, reduceFields, []);
				return TAnonymous(Lambda.array(fields));

			default: throw false;
		};
	}

	static function reduceFields(type:Type, fields:FieldMap):FieldMap {
		var isFirst = Lambda.count(fields) == 0;
		var checkOverrides = reportUnneeded || reportUnneededFields || reportFieldOverride;
		var newFields = extractFields(type);
		var overrides = 0;

		for (f in newFields.keys()) {
			var field = newFields.get(f);

			if (!isFirst && fields.exists(f)) {
				var baseField = fields.get(f);

				if (checkOverrides) {
					if (!compareFieldsTypes(field, baseField)) {
						overrides++;

						if (reportFieldOverride) {
							Context.warning('Overriding this field', field.pos);
							Context.warning('Base field is defined here', baseField.pos);
						}
					} else if (reportUnneededFields) {
						Context.warning('Overriding field `${field.name}` with same type as base field', field.pos);
					}
				}
			}

			fields.set(f, field);
		}

		if (!isFirst && reportUnneeded && overrides == 0) {
			// TODO: better position, somehow
			Context.warning('ForcedOverride is not needed here', Context.currentPos());
		}

		return fields;
	}

	static function extractFields(t:Type):Map<String, Field> {
		return switch(TypeTools.toComplexType(Context.follow(t))) {
			case TAnonymous(fields):
				[for (f in fields) f.name => f];

			default:
				Context.error(
					'ForcedOverride: structure expected',
					Context.currentPos()
				);
		};
	}

	static function compareFieldsTypes(f1:Field, f2:Field):Bool {
		var t1 = ComplexTypeTools.toString(extractFieldType(f1));
		var t2 = ComplexTypeTools.toString(extractFieldType(f2));
		return t1 == t2;
	}

	static function extractFieldType(f:Field):ComplexType {
		return switch (f.kind) {
			case FVar(ct, _): ct;
			case FFun(_): throw 'Not supported for functions atm';
			case FProp(_, _, ct, _): ct;
		};
	}
}
