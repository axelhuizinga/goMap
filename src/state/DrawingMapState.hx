package state;
import loader.DbUser;

typedef DrawingMapState =
{
	?dbUser:DbUser,
	?hasError:Bool,
	?waiting:Bool    
}