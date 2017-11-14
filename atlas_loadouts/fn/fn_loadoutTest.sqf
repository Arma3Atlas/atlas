comment "Exported from Arsenal by LOKI";

_unit = player;


comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
_unit forceAddUniform "U_B_T_Soldier_F";
_unit addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToUniform "20Rnd_762x51_Mag";};
_unit addItemToUniform "Laserbatteries";
_unit addVest "V_PlateCarrier1_tna_F";
for "_i" from 1 to 4 do {_unit addItemToVest "FirstAidKit";};
for "_i" from 1 to 2 do {_unit addItemToVest "20Rnd_762x51_Mag";};
for "_i" from 1 to 3 do {_unit addItemToVest "HandGrenade";};
_unit addItemToVest "Chemlight_red";
for "_i" from 1 to 2 do {_unit addItemToVest "DemoCharge_Remote_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "9Rnd_45ACP_Mag";};
_unit addBackpack "B_AssaultPack_tna_F";
_unit addItemToBackpack "MineDetector";
for "_i" from 1 to 2 do {_unit addItemToBackpack "20Rnd_762x51_Mag";};
_unit addItemToBackpack "HandGrenade";
for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear "H_HelmetB_Enh_tna_F";
_unit addGoggles "G_Balaclava_TI_G_tna_F";

comment "Add weapons";
_unit addWeapon "arifle_SPAR_03_khk_F";
_unit addPrimaryWeaponItem "muzzle_snds_B";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Nightstalker";
_unit addPrimaryWeaponItem "bipod_01_F_khk";
_unit addWeapon "hgun_ACPC2_F";
_unit addHandgunItem "muzzle_snds_acp";
_unit addHandgunItem "acc_flashlight_pistol";
_unit addWeapon "Laserdesignator_01_khk_F";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "B_UavTerminal";
_unit linkItem "NVGogglesB_grn_F";

comment "Set identity";
_unit setFace "TanoanHead_A3_02";
_unit setSpeaker "male01eng";
[_unit,"CombatPatrol"] call bis_fnc_setUnitInsignia;
