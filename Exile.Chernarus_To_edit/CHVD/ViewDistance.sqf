/*
View Distance script made by Shix
http://www.exilemod.com/profile/4566-shix/
Made for XM8 Apps http://www.exilemod.com/topic/9040-updated-xm8-apps/
*/

disableSerialization;


_xm8Controlls = [991,881,992,882,993,883,994,884,995,885,996,886,997,887,998,888,999,889,9910,8810,9911,8811,9912,8812];
{
    _fade = _display displayCtrl _x;
    _fade ctrlSetFade 1;
    _fade ctrlCommit 0.5;
} forEach _xm8Controlls;
{
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
} forEach _xm8Controlls;
uiSleep 0.2;

execVM "fn_openDialog.sqf"

_GoBackBtn = _display ctrlCreate ["RscButtonMenu", 1116];
_GoBackBtn ctrlSetPosition [(32 - 3) * (0.025),(20 - 2) * (0.04),6 * (0.025),1 * (0.04)];
_GoBackBtn ctrlCommit 0;
_GoBackBtn ctrlSetText "Go Back";
_GoBackBtn ctrlSetEventHandler ["ButtonClick", "[]spawn fnc_goBack"];



fnc_goBack = {
  _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
  _vdCtrls = [1120,1119,1112,1114,1116];
  {
      _ctrl = (_display displayCtrl _x);
      _ctrl ctrlSetFade 1;
      _ctrl ctrlCommit 0.25;
      ctrlEnable [_x, false];
  } forEach _vdCtrls;
  execVM "xm8Apps\XM8Apps_Init.sqf";
  uiSleep 1;
  {
    ctrlDelete ((findDisplay 24015) displayCtrl _x);
  } forEach _vdCtrls;
};
