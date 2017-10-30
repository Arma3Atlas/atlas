////////////////////////////////////
_counter = _this select 0;

disableSerialization;

uinamespace setvariable ["bar",findDisplay 46 ctrlCreate ["RscProgress", -1]];
private _bar = uinamespace getvariable "bar";	

while { _counter > 0} do {
_counter = _counter - 1;

_progress = progressPosition _bar;

_bar ctrlSetPosition [0,0,1,0.01]; 
_bar ctrlCommit 0;
_bar progressSetPosition (_progress + 0.1); 

sleep 1;
};

//hint "finished";

