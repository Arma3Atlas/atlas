_selectedVehicle = missionnamespace getVariable lbData [1500,(_this select 1)];
_mapCtrl = ((uiNamespace getVariable "atlas_guiBase") displayCtrl 1200);
_mapCtrl ctrlMapAnimAdd [0, 0.05, _selectedVehicle];
ctrlMapAnimCommit _mapCtrl;


