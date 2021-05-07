% Calculate current "error" between control variable c(2) and set point:
E1 = c(2)-TSet;
% Controller calculates change in manipulated variable:
Dmv = K_c * (E1 - E2 + (dt/tau_I)*E1 - (tau_D/dt)*(Fj(2)-2*Fj_1+Fj_2));
