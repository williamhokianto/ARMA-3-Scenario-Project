action_id_to_remove = [];
fncRemoveAction = {
	_unit = _this;
	{_unit removeAction _x} foreach action_id_to_remove;
};

police_cmdr_action = police_commander addAction ["<t size='2' color='#68c7ff'>Talk</t> <img size='2' color='#68c7ff' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa' />", "police_cmdr_talk.sqf",[],1.5,true,true,"","",3];

idap_chief_action = idap_chief addAction ["<t size='2' color='#ff993a'>Talk</t> <img size='2' color='#ff993a' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa' />", "idap_chief_talk.sqf",[],1.5,true,true,"","",3];

police_ldr_action = police_team_leader addAction ["<t size='2' color='#68c7ff'>Talk</t> <img size='2' color='#68c7ff' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa' />", "police_ldr_talk.sqf",[],1.5,true,true,"","",3];

police_wound_action = police_ambush1 addAction ["<t size='2' color='#68c7ff'>Talk</t> <img size='2' color='#68c7ff' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa' />", "police_wound_talk.sqf",[],1.5,true,true,"","",3];

idapworker1_action = idapworker1 addAction ["<t size='2' color='#ff993a'>Untie</t> <img size='2' color='#ff993a' image='\a3\Ui_f\data\IGUI\Cfg\simpleTasks\types\help_ca.paa' />", "idapworker1.sqf",[],1.5,true,true,"","",3];

idapworker2_action = idapworker2 addAction ["<t size='2' color='#ff993a'>Untie</t> <img size='2' color='#ff993a' image='\a3\Ui_f\data\IGUI\Cfg\simpleTasks\types\help_ca.paa' />", "idapworker2.sqf",[],1.5,true,true,"","",3];

grenadier_action_recruit = un_grenadier addAction ["<t size='2' color='#435d99'>Recruit</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\IGUI\Cfg\WeaponIcons\gl_ca.paa' />", "un_grenadier_recruit.sqf",[],1.5,true,true,"","",3];

antitank_action_recruit = un_antitank addAction ["<t size='2' color='#435d99'>Recruit</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\IGUI\Cfg\WeaponIcons\at_ca.paa' />", "un_antitank_recruit.sqf",[],1.5,true,true,"","",3];

autorifleman_action_recruit = un_autorifleman addAction ["<t size='2' color='#435d99'>Recruit</t> <img size='2' color='#435d99' image='\a3\Ui_f\data\IGUI\Cfg\WeaponIcons\mg_ca.paa' />", "un_autorifleman_recruit.sqf",[],1.5,true,true,"","",3];