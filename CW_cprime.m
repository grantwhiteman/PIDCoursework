%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                  %
%           function file CW_cprime                                %
%                         ==========                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function cprime = CW_cprime(t,c,mv)
 
% Defines the right-hand sides of the system of DEs
% Load up the data
data;
Fj=mv;

% Allocate a vertical vector of cprime
%
%  if (t>10000)
%  Ca0=1.01*Ca0;
% end

cprime =[0;0;0];
%
% Calculate the pre-exponential factor of the reaction
%
 
K = a*exp(-E/(R*c(2)));

 
cprime(1) = (F/V)*(Ca0-c(1))-(K*c(1));  % DE for concentration of component A
 
cprime(2) = (F/V)*(T0-c(2))-((lambda*K*c(1))/(rho*Cp))-(((U*Ah)/(rho*Cp*V))*(c(2)-c(3))) ;     % DE for reactor temperature    
 
cprime(3) = ((Fj/Vj)*(Tj0-c(3)))+(((U*Ah)/(rhoj*Cpj*Vj))*(c(2)-c(3)));   
                                                                               % DE for jacket temperature
