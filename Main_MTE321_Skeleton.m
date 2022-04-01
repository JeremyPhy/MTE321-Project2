%% Project 2

%% Hi Class,
%% Hope you have fun with this project. Please note that this skeleton is only 
%% meant to serve as a guidance. If you want to rewrite the code from scratch, you are most
%% welcome. Creativity is highly encouraged. 

% Enter all independant variables in appropriate units
% eg r2, ddtheta2, Ig:
r2 = 3;
dtheta2 = 40;
ddtheta2 = 0;
OB = 5;
BC = 20;

% Initialize arrays to collect desired values as needed
M12 = [];
Cx_list = zeros(1, 360);
Cy_list = zeros(1, 360);
theta3_list = zeros(1, 360);
dtheta3_list = zeros(1, 360);
ddtheta3_list = zeros(1, 360);

% Might want to use the loop to iterate through the values of theta to 
% find the required deliverables for all angles:

% NOTE: The teaching team chose to use a loop to run through the several theta 
%       values, and to use functuion calls to do the required operations. You 
%       can choose not to use either. You may get the same results, but the code
%       may be harder to look through or debug. Do whatever works best for you!  
x = 0 : 1 : 360;
for theta2 = 0:1:360
    
    theta3 = atan2d((12-5*sind(theta2)), (4-5*cosd(theta2)));
    dtheta3 = ((5*dtheta2)/20)*cosd(theta2 - theta3);
    ddtheta3 = -(5/20)*(dtheta2^2)*sind(theta2 - theta3);

    theta3_list(theta2 + 1) = theta3;
    dtheta3_list(theta2 + 1) = dtheta3;
    ddtheta3_list(theta2 + 1) = ddtheta3;

    Cx_list(theta2 + 1) = 5*cosd(theta2) + 20*cosd(theta3);
    Cy_list(theta2 + 1) = 5*sind(theta2) + 20*sind(theta3);

    dCx = -5*dtheta2*sind(theta2) - 20*dtheta3*sind(theta3);
    dCy = 5*dtheta2*cosd(theta2) + 20*dtheta3*cosd(theta3);

    ddCx = -5*(dtheta2^2)*cosd(theta2) - 20*(dtheta3^2)*cosd(theta3) - 20*ddtheta3*sind(theta3);
    ddCy = -5*(dtheta2^2)*sind(theta2) - 20*(ddtheta3^2)*sind(theta3) + 20*ddtheta3*cosd(theta3);

    dR3 = 5*dtheta2*sind(theta2 - theta3);
   
    % Enter the variables you want to calculated at every iteration
    % eg:
    
    %r3 = ;
    %dr3 = ;
    
    % You might want to consider using functions to find A and ma so that
    % you dont have to type it all out here. But you are free to do as you
    % wish.

    %B = get_ma_vector();
    %A = get_A_matrix(); 
    %F = A\ B;
    
    % Store data in predeclared arrays
    % NOTE: You need to fill in the brackets of the function calls to match the
    %       values inside the function files themselves. Otherwise, the code will
    %       throw errors.
    
    %M12 = [M12; x(1)];
    %Fs = [Fs; get_shaking_force_Fs(x, x, x, x)];
    %alpha_s = [alpha_s,get_direction_of_shaking_force_alpha_s(x, x, x, x)];
    %Ms = [Ms; get_shaking_moment_Ms(r1, r4)];
    %F32_list = [F32; x];
    
end

% Part A requirements
% Plot all desired deliverables:
figure_num = 1;
figure(figure_num);
plot(x, dtheta3_list);
title("Angular Velocity of Link 3 -vs- Angular Position of Link 2");
axis([0 360 -10 10])
grid on;
xlabel('\theta_2  [degree]')
ylabel('d\theta_3  [N-m]')

%figure (2)
%plot(theta2_list,M12)
%grid on;
%title('\theta_2 vs M12')
%xlabel('\theta_2   unit: degree')
%ylabel('M12   unit: N-m')




