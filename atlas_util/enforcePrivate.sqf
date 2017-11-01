params ["_functionName","_caller"];




_split = _functionName splitstring "_";
_tag = _split select 0;
_name = _split select 2;
//hintc str _split;

_allconfigs = "true" configClasses (missionConfigFile >> "CfgFunctions" >> _tag);
 copytoclipboard str _allconfigs;
hintc str _allconfigs
