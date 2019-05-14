released_idap = released_idap + 1;
action_id_to_remove pushBack idapworker1_action;
idapworker1 call fncRemoveAction;
idapworker1 playMoveNow "Acts_ExecutionVictim_Unbow";
[idapworker1] joinSilent player;
idapworker1 setCaptive true;
sleep 3;
idapworker1 enableAI "MOVE";
idapworker1 enableAI "ANIM";