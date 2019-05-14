released_idap = released_idap + 1;
action_id_to_remove pushBack idapworker2_action;
idapworker2 call fncRemoveAction;
idapworker2 playMoveNow "Acts_ExecutionVictim_Unbow";
[idapworker2] joinSilent player;
idapworker2 setCaptive true;
sleep 3;
idapworker2 enableAI "MOVE";
idapworker2 enableAI "ANIM";