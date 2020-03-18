package action;

import haxe.Constraints.Function;
import haxe.ds.IntMap;
import shared.DbData;
import action.async.DBAccess;
import action.async.DBAccessProps;
/**
 * ...
 * @author axel@cunity.me
 */

enum abstract DataStoreAccess(String) {
	var Load;	
	var Save;
	var Update;
}

enum abstract SelectType(String) {
	var All;	
	var One;
	var Unselect;
	var UnselectAll;
}

typedef LiveDataProps = 
{
	id:Dynamic,
	?data: IntMap<Map<String,Dynamic>>,
	?callBack:Function,
	?selectType:SelectType
}

enum  DataAction
{
	Execute(dataAccess:DBAccessProps);
	Update(uData:IntMap<Map<String,Dynamic>>);
	Error(data:DbData);
	ContactsLoaded(data:DbData);
	Restore;
	SelectAccounts(sData:IntMap<Map<String,Dynamic>>);
	SelectActContacts(sData:IntMap<Map<String,Dynamic>>);
	SelectContacts(sData:IntMap<Map<String,Dynamic>>);
	SelectDeals(sData:IntMap<Map<String,Dynamic>>);
	Sync(dataAccess:DBAccessProps);
	UpStore(sData:IntMap<Map<String,Dynamic>>);
	Unselect(id:Int);
}
