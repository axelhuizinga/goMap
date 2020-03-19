package state;
import loader.DbUser;
import loader.LoginTask;

typedef UserState =
{
	?dbUser:DbUser,
	?lastError:Dynamic,
	?loginTask:LoginTask,
	?new_pass_confirm:String,
	?new_pass:String,
	?waiting:Bool    
}