
//FOR MAP
//class rGUI_map: ATLAS_RscMapControl

class atlas_guiBase
{
	idd = 7200;
	//onLoad = "uiNamespace setVariable ['atlas_guiBase', (_this select 0)]"; 
	onLoad = "_this call Atlas_fnc_respawnDialogOpened"; 
	//onUnload = "";
	movingEnable = 0;
	



controls[]=
{
	IGUIBack_2200,
	atlas_gui_listBox_1500,
	atlas_gui_rscButton_1600,
	atlas_gui_rscButton_1601,
	atlas_gui_sText_1100,
	atlas_gui_rscPicture_1200,
	atlas_gui_rscButton_1602
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by LOKI, v1.063, #Xapimy)
////////////////////////////////////////////////////////

class IGUIBack_2200: IGUIBack
{
	idc = 2200;
	text = "guiBack_1"; //--- ToDo: Localize;
	x = 0.298419 * safezoneW + safezoneX;
	y = 0.22509 * safezoneH + safezoneY;
	w = 0.403161 * safezoneW;
	h = 0.549821 * safezoneH;
};
class atlas_gui_listBox_1500: ATLAS_RscListbox
{
	idc = 1500;
	text = "listBox_1"; //--- ToDo: Localize;
	onLBSelChanged = "_this call Atlas_fnc_respawn_LbSelChanged";
	onLBDblClick = "[lbData [1500,(lbCurSel 1500)]   ,player] call Atlas_fnc_respawnAtPlace;";
	x = 0.308499 * safezoneW + safezoneX;
	y = 0.247082 * safezoneH + safezoneY;
	w = 0.0705531 * safezoneW;
	h = 0.175943 * safezoneH;
};
class atlas_gui_rscButton_1600: ATLAS_RscButton
{
	idc = 1600;
	action = "[lbData [1500,(lbCurSel 1500)]   ,player] call Atlas_fnc_respawnAtPlace;";
	text = "Spawn"; //--- ToDo: Localize;
	x = 0.308499 * safezoneW + safezoneX;
	y = 0.565979 * safezoneH + safezoneY;
	w = 0.0453556 * safezoneW;
	h = 0.0219929 * safezoneH;
};
class atlas_gui_rscButton_1601: ATLAS_RscButton
{
	idc = 1601;
	text = "do nothing"; //--- ToDo: Localize;
	x = 0.308499 * safezoneW + safezoneX;
	y = 0.598968 * safezoneH + safezoneY;
	w = 0.0453556 * safezoneW;
	h = 0.0219929 * safezoneH;
};
class atlas_gui_sText_1100: ATLAS_RscStructuredText
{
	idc = 1100;
	text = "sText_1"; //--- ToDo: Localize;
	x = 0.308499 * safezoneW + safezoneX;
	y = 0.434021 * safezoneH + safezoneY;
	w = 0.0705531 * safezoneW;
	h = 0.120961 * safezoneH;
};
class atlas_gui_rscPicture_1200: ATLAS_RscMapControl
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.39921 * safezoneW + safezoneX;
	y = 0.247082 * safezoneH + safezoneY;
	w = 0.282213 * safezoneW;
	h = 0.3079 * safezoneH;
};
class atlas_gui_rscButton_1602: ATLAS_RscButton
{
	idc = 1602;
	text = "EXIT"; //--- ToDo: Localize;
	action = closeDialog 0;
	x = 0.308499 * safezoneW + safezoneX;
	y = 0.708932 * safezoneH + safezoneY;
	w = 0.0453556 * safezoneW;
	h = 0.0219929 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
