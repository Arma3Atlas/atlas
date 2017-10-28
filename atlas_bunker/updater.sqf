/*
Passed Arguments:
    _this <ARRAY>
        0: _args   - Parameters passed by this function. Same as '_args' above. <ANY>
        1: _handle - A number representing the handle of the function. Same as '_handle' returned by this function. <NUMBER>
*/

params ["_self","_handle"];
if (!isserver) exitwith {};

private _trg = _self getvariable "atlas_objp_trigger";

private _westCountZone = {side _x == west && alive _x} count list _trg;
private _eastCountZone = {side _x == east && alive _x} count list _trg;
private _guerCountZone = {side _x == resistance && alive _x} count list _trg;

private _newside = civilian;  // civ meaning "nobody outnumbers the rest"

if (_westCountZone > _eastCountZone + _guerCountZone) then {_newside = west};
if (_eastCountZone > _westCountZone + _guerCountZone) then {_newside = east};
if (_guerCountZone > _westCountZone + _eastCountZone) then {_newside = resistance};

private _capturer = _self getvariable "atlas_objp_capturer";
private _progress = _self getvariable "atlas_objp_captureprogress";

if (_newside != _capturer) then {
    _self setvariable ["atlas_objp_capturer",_newside,true];
    _progress = 0;
    _self setvariable ["atlas_objp_captureprogress",_progress,true];
};

_progress = _progress + 1;

format ["bunker.updater: n %5 w %1 e %2 g %3 filter %4 progress %6",
 _westCountZone, _eastCountZone, _guerCountZone, _self getVariable "atlas_objp_capturingsides",_self,_progress]
 call atlas_debugout;

if (count list _trg == 0) exitwith {
	_self setVariable ["atlas_objp_updater_running",false];
	[_handle] call CBA_fnc_removePerFrameHandler;
};

if (_newside == civilian) exitwith {};
_self setvariable ["atlas_objp_captureprogress",_progress,true];

private _capsides = _self getVariable "atlas_objp_capturingsides";
if (! (_newside in _capsides)) exitwith {};

if (_progress < 12) exitwith {};        // MAGIC NUMBER for duration here. multiplies with call interval from update.sqf
// probable todo: base off of "time"

_self setvariable ["atlas_objp_currentowner", _newside,true];

_parent = _self getvariable "atlas_objp_parent";
[_parent, _self, _newside] call (_parent getvariable "atlas_town_objupdate");

//marker update
[_self] call (_self getvariable "atlas_obj_draw");


