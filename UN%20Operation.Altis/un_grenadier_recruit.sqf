action_id_to_remove pushBack grenadier_action_recruit;
un_grenadier call fncRemoveAction;

[un_grenadier] join player;
un_grenadier enableAI "MOVE";
un_grenadier allowDamage true;

grenadier_action_dismiss = un_grenadier addAction ["<t size='2' color='#435d99'>Dismiss</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\Map\Markers\NATO\respawn_inf_ca.paa' />", "un_grenadier_dismiss.sqf",[],1.5,true,true,"","",3];