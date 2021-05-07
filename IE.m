%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                  %
%           function file CW for Improved Euler’s Method           %
%                         ==                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear                % Removes all existing variables
format short e       % Prints any output in 5 digit floating point form
 
 
%
% Set up the solution data and the initial conditions
%
% Load up the data  from the data file
%
 
data;
 
c = c0% initial concentrations are inputted into c
t = t0;          % initial time is inputted into t
% Initialise the last two values of the control variable
T_1 = c(2);
T_2 = c(2);
% Initialise "errors"
E1 = c(2)-TSet;
E2 = E1;  

% Introduce mv: manipulated variable = F_J
mv = Fj;  

history_t = t;   % Save all the time points in history_t
history_c = c';  % Save all the concentrations at these times in history_c
history_mv = Fj;% initialise the jacket flow history
history_e = E1;  % initialise the error history 
%
% Choose a time step 
%
 
dt = 10;
 


while((t+dt/2) < tf)    % repeats loop while t < tf
 
%%%%%%%%%%%%%%%%%%% begin control algorithm %%%%%%%%%%%%%%%%%%%%%%
% Make a step-change in the set point (XXX is the time when you want to
% make the step-change, and YYY is the new value of TSet) 
% if t>10000
% TSet=340;
% end
% Store previous error
E2 = E1;
% Calculate current "error" between control variable and set point:
E1 = c(2)-TSet;
% Controller calculates change in manipulated variable:
Dmv = K_c * (E1 - E2 + (dt/tau_I)*E1 - (tau_D/dt)*(c(2)-2*T_1+T_2));
% Calculate the new value of the manipulated variable and prevent the
% cooling flow rate from becoming negative - this is equivalent to a
% check valve.
if mv+Dmv < 0
mv=0;
else mv = mv+Dmv;
end

cprime = CW_cprime(t,c,mv); 
cp = c + dt*cprime; 
t = t + dt; 
cprimep= CW_cprime(t,cp,mv);

T_2 = T_1; % Backup previous values of cv for control loop
T_1 = c(2);

c=c+(dt/2)*(cprime+cprimep);
 
  history_t = [history_t;t];            % Update time history
  history_c = [history_c;c'];           % Update history of concentrations
  history_mv = [history_mv;mv];
  history_e = [history_e;E1];
end                                     % end of while loop
 


%
% On output history_t contains a vector of all the time points visited by the
% differential equation solver
% and  history_c is a matrix with a row for each time point and a column
% for each variable (in this case 3 columns).
%
 
%
% The following commands plot each of the
% concentrations against time
% on a single axis with colour
%
%     green    '*'     -  c(1)
%     magenta  'o'     -  c(2)
%     cyan     'x'     -  c(3)
%         .
% To stop any particular variable being plotted simply put
% a % at the start of that plotting line.
%
 
PC=abs(history_e(1000:6000));
%performance matrix
SCT=[0:10:50000];
IAE=sum(abs(PC))
ISE=sum((history_e(1000:6000).^2))
ITAE=sum(SCT*PC)

figure(1)
plot(history_t,history_c(:,1),'g')
hold off
figure(2)
plot(history_t,history_c(:,2),'m')
hold on
figure(3)
plot(history_t,history_c(:,3),'c')
hold on
figure(4)
plot(history_t,history_e,'g')
hold off
figure(5)
plot(history_t,history_mv,'g')
hold off