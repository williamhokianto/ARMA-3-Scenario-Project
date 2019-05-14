action_id_to_remove pushBack antitank_action_dismiss;
un_antitank call fncRemoveAction;

[un_antitank] joinSilent un_idle_group;
un_antitank allowDamage false;
un_antitank doMove un_antitank_init_pos;
sleep 30;
doStop un_antitank;
un_antitank setPos un_antitank_init_pos;
un_antitank disableAI "MOVE";
antitank_action_recruit = un_antitank addAction ["<t size='2' color='#435d99'>Recruit</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\IGUI\Cfg\WeaponIcons\at_ca.paa' />", "un_antitank_recruit.sqf",[],1.5,true,true,"","",3];