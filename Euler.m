%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                  %
%           function file CW for Euler’s Method                    %
%                         ==                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear                % Removes all existing variables
format short e       % Prints any output in 5 digit floating point form
  
%
% Set up the solution data and the initial conditions
%
% Load up the data from the data file
% 
data;
 
c = cF          % initial concentrations are inputted into the matrix c
t = t0;         % initial time is inputted into t
 
history_t = t;   % Save all the time points in history_t
history_c = c';  % Save all the concentrations at these times in history_c 
%
% Choose a time step 
%
 
dt = 10;
  
while((t+dt/2) < tf)    % repeats loop while t < tf
 
cprime =CW_cprime(t,c); 
c = c + dt*cprime; 
t = t + dt; 
 
history_t = [history_t;t];            % Update time history
history_c = [history_c;c'];           % Update history of concentrations
end                                   % end of while loop
  
%
% On output history_t contains a vector of all the time points visited by the
% differential equation solver
% and  history_c is a matrix with a row for each time point and a column
% for each variable

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
 
figure(1)
plot(history_t,history_c(:,1),'g')
hold off
figure(2)
plot(history_t,history_c(:,2),'m')
hold on
figure(3)
plot(history_t,history_c(:,3),'c')
hold off
