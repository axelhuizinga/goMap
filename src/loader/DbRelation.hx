package loader;
import haxe.ds.StringMap;

class DbRelation{

	public var alias:String;
	public var fields:Array<String>;
	public var filter:Dynamic;
	public var jCond:String;

	public function new(p:Dynamic){
		
		for(f in Type.getInstanceFields(DbRelation)){
			switch (f){
				case '__uid'|'getCLID'|'serialize'|'unserialize'|'getSerializeSchema':
					//SKIP
				default:
					if(Reflect.hasField(p, f))
						Reflect.setField(this, f, Reflect.field(p,f));
			}
		}	
	};	
}