package state;

import js.html.InputElement;
import haxe.ds.IntMap;
import js.html.FormElement;
import js.html.InputEvent;
import js.html.TableRowElement;
import react.ReactRef;

enum abstract HandlerAction(String) {
	var Submit;
	var SubmitAndClose;
	var Close;
}
typedef SubmitHandler = 
{
	handler:InputEvent->Void,
	?handlerAction:HandlerAction,
	label:String
}

typedef FormState =
{
	?action:String,
	?actualState:Dynamic,
	?dataClassPath:String,
	?data:Map<String,Dynamic>,
	?dataTable:Array<Map<String,Dynamic>>,
	?dataCount:Int,
	?fields:Dynamic,//VIEW FORMFIELDS
	?formStateKey:String,
	?clean:Bool,
	?pageCount:Int,
	?ref:ReactRef<FormElement>,
	//?contactData:IntMap<Map<String,Dynamic>>,
	?initialData:Dynamic,//IntMap<Map<String,Dynamic>>,
	?selectedRows:Array<TableRowElement>,
	?selectedRowIDs:Array<Int>,
	?handleChange:InputEvent->Void,
	?handleSubmit:Array<SubmitHandler>,	
	?hasError:Bool,
	?limit:Int,
	?mounted:Bool,
	?isConnected:Bool,
	?loading:Bool,
	?initialState:Dynamic,
	?model:String,
	?modelClass:Dynamic,
	?valuesArray:Array<Map<String,Dynamic>>,//FORMATTED DISPLAY VALUES
	?values:Map<String,Dynamic>,//FORMATTED DISPLAY VALUES
	?rows:Array<Dynamic>,
	?section:String,
	?storeListener:redux.Redux.Unsubscribe,
	?submitted:Bool,
	?errors:Map<String,String>,
	?title:String
}