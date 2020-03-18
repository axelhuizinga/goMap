package loader;
import haxe.ds.StringMap;
import haxe.http.HttpJs;
import haxe.Json;
import react.ReactComponent;
import me.cunity.debug.Out;
/**
 * ...
 * @author axel@cunity.me
 */

/*typedef AsyncDataLoader =
{
	url:String,
	?params:StringMap<String>,
	?cB:String->Void,
	?dataField:String,
	?component:ReactComponent
}*/

 class JsonLoader 
{	
	public static function load(url:String, ?params:Dynamic,?cB:Dynamic->Void):HttpJs
	{
		var req = new HttpJs(url); 
		if(params!=null) for (k in Reflect.fields(params))
		{
			req.addParameter(k, Reflect.field(params, k));
		}		
		req.addHeader('Access-Control-Allow-Methods', "PUT, GET, POST, DELETE, OPTIONS");
		req.addHeader('Access-Control-Allow-Origin', '*');
		var loader:JsonLoader = new JsonLoader(cB);
		req.onData = loader._onData;
		req.onError = function(err:String) trace(err);
		trace('POST? ' + params != null);
		req.withCredentials = true;
		req.request(params != null);
		return req;
	} 
	
	var cB:Dynamic->Void;
	var params:Dynamic;
	var post:Bool;
	var req:HttpJs;
	var url:String;
	
	public function new(?cb:String->Void, ?p:Dynamic, ?r:HttpJs)
	{
		cB = cb;
		params = p;
		post = p!=null;
		req = r;
	}
	
	function _onData(response:String)
	{
		if (response.length > 0)
		{
			var dataObj = Json.parse(response);
			if (dataObj.error != '')
			{
				trace(dataObj.error);
			}
			if (cB != null)
				cB(dataObj);					
		}
	}

}