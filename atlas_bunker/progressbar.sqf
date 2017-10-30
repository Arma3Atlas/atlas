// Only called from updater
if (isdedicated) exitwith {};

params ["_self"];

_trigger = _self getvariable "atlas_objp_trigger";
if (! (player in list _trigger)) exitwith {};	

if (isnil "atlas_bunker_progressbar_running") then { atlas_bunker_progressbar_running = false; };
if (atlas_bunker_progressbar_running) exitwith {};

if (_self getvariable "atlas_objp_capturer" != side player) exitwith {};

// We now know the player is in that bunker, capturing it.
atlas_bunker_progressbar_running = true;
disableSerialization;

private _bar = findDisplay 46 ctrlCreate ["RscProgress", -1];
_bar ctrlSetPosition [0,0,1,0.01]; 

while { 
	player in list _trigger 
	&& _self getvariable "atlas_objp_capturer" == side player
	&& _self getvariable "atlas_objp_currentowner" != side player
} do {
	_progress = _self getvariable "atlas_objp_captureprogress";
	
	_bar progressSetPosition (_progress/atlas_objp_bunker_captureduration); 
	_bar ctrlCommit 1;

	sleep 1;
};
ctrlDelete _bar;
atlas_bunker_progressbar_running = false;
