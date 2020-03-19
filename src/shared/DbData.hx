package shared;

import haxe.Json;
import haxe.ds.Map;

/**
 * ...
 * @author axel@cunity.me
 */
class DbData {

	public var dataErrors:Map<String,String>;
	public var dataInfo:Map<String,Dynamic>;
	public var dataParams:Map<String,Dynamic>;
	public var dataRows:Json;
	
	public function new() 
	{
		dataErrors = new Map();
		dataInfo = new Map();
		dataParams = new Map();
		dataRows = Json.parse('{}');		
	}	
}