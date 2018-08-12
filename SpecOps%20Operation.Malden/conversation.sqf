player KbAddTopic ["introduction","texts.bikb","",""];		//Add the topics, refer back to the file above
officer KbAddTopic ["introduction","texts.bikb","",""];

officer KbTell [player,"introduction","OfficerLine_1"];		//playerLine_1 - Class name of the line defined above
waitUntil {
officer KbWasSaid [player,"introduction","OfficerLine_1",7];	//Search in 3 last seconds
};
sleep 0.5;

hint "Conversation finished!";

sreq synchronizeObjectsAdd [player];