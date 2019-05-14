action_id_to_remove pushBack autorifleman_action_dismiss;
un_autorifleman call fncRemoveAction;

[un_autorifleman] joinSilent un_idle_group;
un_autorifleman allowDamage false;
un_autorifleman doMove un_autorifleman_init_pos;
sleep 30;
doStop un_autorifleman;
un_autorifleman setPos un_autorifleman_init_pos;
un_autorifleman disableAI "MOVE";
autorifleman_action_recruit = un_autorifleman addAction ["<t size='2' color='#435d99'>Recruit</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\IGUI\Cfg\WeaponIcons\mg_ca.paa' />", "un_autorifleman_recruit.sqf",[],1.5,true,true,"","",3];