package action;

import state.DrawingMapState;

enum DrawingMapAction
{	
	Loaded();
	Update(state:DrawingMapState);
}

