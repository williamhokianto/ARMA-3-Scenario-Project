{_x hideObject false; 
_x enableSimulation true} 
forEach units pmc1;

{_x hideObject false; 
_x enableSimulation true} 
forEach units pmc2;

{_x hideObject false; 
_x enableSimulation true} 
forEach units pmc3;

pmc1loop = [] spawn { while {true} do {{_x doMove (getPos player)} foreach units pmc1; sleep 5; }; };

pmc2loop = [] spawn { while {true} do {{_x doMove (getPos player)} foreach units pmc2; sleep 5; }; };

pmc3loop = [] spawn { while {true} do {{_x doMove (getPos player)} foreach units pmc3; sleep 5; }; };