uiNamespace setVariable ['atlas_guiBase', (_this select 0)];

hint "dialogOpen";

_spawnpoints = [player] call Atlas_fnc_getAvailableSpawnpoints;

_listBox = ((uiNamespace getVariable "atlas_guiBase") displayCtrl 1500);
//((_this select 0) displayCtrl 1500);



{
	



	_bCount = _x getVariable ["atlas_respawn_bodiesRemaining",0];
	_vClass = typeOf _x;
	_cfgPath = (configFile >> "CfgVehicles" >> _vClass); 
	_friendlyName = "";
	if (isText(_cfgPath >> "displayName")) then 
	{
      _friendlyName = getText(_cfgPath >> "displayName");
    };

	
	_dInfo = format ["[%1] %2",_bCount,_friendlyName];
	_index = (_listBox lbAdd _dInfo);
	_listBox lbSetData [_index,([_x] call BIS_fnc_objectVar)];

	
	 if (isText(_cfgPath >> "picture")) then 
	{
      _listBox lbSetPicture[_index, getText(_cfgPath >> "picture")];
    };


	
} forEach _spawnpoints;
//98.127.40.244:2302
((uiNamespace getVariable "atlas_guiBase") displayCtrl 1100) ctrlSetStructuredText parseText "sText adsadawgoes in here";