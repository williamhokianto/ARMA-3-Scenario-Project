action_id_to_remove pushBack antitank_action_recruit;
un_antitank call fncRemoveAction;
 
[un_antitank] join player;
un_antitank enableAI "MOVE";
un_antitank allowDamage true;

antitank_action_dismiss = un_antitank addAction ["<t size='2' color='#435d99'>Dismiss</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\Map\Markers\NATO\respawn_inf_ca.paa' />", "un_antitank_dismiss.sqf",[],1.5,true,true,"","",3];