%Steady State%
F=0.0003146;     %Inlet volumetric flowrate in m^3/s
Ca0=8009.2;      %Initial concentration 
T=333.3;         %Temperature of reactor in K (=c(2)) 
Fj=0.00039;      %Volumetric flowrate of cooling jacket in m^3/s
V=1.36;          %Reactor Volume in m^3
Ca=3924.5;       %Concentration
Tj=330.3;        %Outlet Temperature of cooling jacket in K (=c(3))
T0=294.4;        %Initial Temperature of feed in K 
 
%Parameter values%
Vj=0.109;        %Volume of cooling jacket in m^3 
E=69780;         %Activation energy in j/mol
U=851.7;         %Overall heat transfer coefficient in j/S m^2 K
Tj0=294.2;       %Initial Temperature of cooling jacket in K
Cp=3140;         %Specific heat capacity in J/kg K
rho=800.9;       %Density in kg/m^3
a=19700000;      %Arhenius constant in s^-1
R=8.314;         %Universal gas constant in j/kg mol K
Ah=23.23;        %Heat Transfer Area in m^2
lambda=-69780;   %Heat of reaction in J/mol
Cpj=4187;        %specific heat capacity of cooling jacket in j/kg K
rhoj=998;        %Density of cooling jacket in Kg/m^3
Tset=333.3;      %Set temperature in K

c0=[4032.454534;333.3;330.4430687]
% c0=[7632.75421756781;297.866942092821;297.587886279515];
cF=[Ca0;T0;Tj0]; %Matrix of three variables
t0=0;            %Initial time
tf=60000;        %final time

%%%%%%% set-point %%%%%%%
TSet = 333.3; % Reactor temperature set-point – you may have a different value – but try and move the simulation to steady-state at a higher temperature- this will give greater conversion, which is another objective
%%%%%%% Controller tuning – use these values to start with %%%%%%
K_c = 0.01; % Proportional controller gain
tau_I = 66.6; % Integral time constant
tau_D = 0; % Derivative time constant
