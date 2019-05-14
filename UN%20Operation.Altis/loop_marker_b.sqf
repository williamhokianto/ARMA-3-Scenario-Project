loopmarker_grenadier = [] spawn {
	while {true} do
	{	
		waitUntil {alive un_grenadier};
		"marker_grenadier" setMarkerPos getPos un_grenadier;
		"marker_grenadier" setMarkerText "Grenadier";
		"marker_grenadier" setMarkerColor "ColorWEST";
		sleep 0.5;
	};
};

loopmarker_autorifleman = [] spawn {
	while {true} do
	{	
		waitUntil {alive un_autorifleman};
		"marker_autorifleman" setMarkerPos getPos un_autorifleman;
		"marker_autorifleman" setMarkerText "Autorifleman";
		"marker_autorifleman" setMarkerColor "ColorWEST";
		sleep 0.5;
	};
};

loopmarker_antitank = [] spawn {
	while {true} do
	{
		waitUntil {alive un_antitank};
		"marker_antitank" setMarkerPos getPos un_antitank;
		"marker_antitank" setMarkerText "Anti Tank";
		"marker_antitank" setMarkerColor "ColorWEST";
		sleep 0.5;
	};
};