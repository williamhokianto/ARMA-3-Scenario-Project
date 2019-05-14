action_id_to_remove pushBack grenadier_action_dismiss;
un_grenadier call fncRemoveAction;

[un_grenadier] joinSilent un_idle_group;
un_grenadier allowDamage false;
un_grenadier doMove un_grenadier_init_pos;
sleep 30;
doStop un_grenadier;
un_grenadier setPos un_grenadier_init_pos;
un_grenadier disableAI "MOVE";
grenadier_action_recruit = un_grenadier addAction ["<t size='2' color='#435d99'>Recruit</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\IGUI\Cfg\WeaponIcons\gl_ca.paa' />", "un_grenadier_recruit.sqf",[],1.5,true,true,"","",3];