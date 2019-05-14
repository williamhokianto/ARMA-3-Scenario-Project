action_id_to_remove pushBack autorifleman_action_recruit;
un_autorifleman call fncRemoveAction;

[un_autorifleman] join player;
un_autorifleman enableAI "MOVE";
un_autorifleman allowDamage true;

autorifleman_action_dismiss = un_autorifleman addAction ["<t size='2' color='#435d99'>Dismiss</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\Map\Markers\NATO\respawn_inf_ca.paa' />", "un_autorifleman_dismiss.sqf",[],1.5,true,true,"","",3];