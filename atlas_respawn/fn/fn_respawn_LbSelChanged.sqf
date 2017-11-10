hint str _this; //MOST RECENT THING I TOUCHED
_selectedVehicle = (atlas_respawn_spawnVehicleList select (_this select 1));
_mapCtrl = ((uiNamespace getVariable "atlas_guiBase") displayCtrl 1200);
_mapCtrl ctrlMapAnimAdd [0, 0.05, _selectedVehicle];
ctrlMapAnimCommit _mapCtrl;


