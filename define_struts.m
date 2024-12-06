function [p,q] = define_struts(strutType,startPoints,endPoints)

%% Function use in lattgen
% Called by:
% a. 
% b. 

switch strutType
    case "DCC"
        p1 = [-1,-1,-1; 1 1 -1; 1 -1 -1; -1 1 -1]; 
        p2 = [1 -1 0; 1 -1 0; -1 -1 0; -1 -1 0]; 
        
        p = [p1;p2]; %p1 and p2 combined
        
        q1 = [1,1,1; -1 -1 1; -1 1 1; 1 -1 1];
        q2 = [-1 1 0; -1 1 0; 1 1 0; 1 1 0]; 
        
        q = [q1;q2]; %q1 and q2 combined
        
    case "Octet"
        %Start points
        p = [-1,-1,-1; %Line 1
            1 -1 -1;    %Line 2
            1 -1 -1;     %Line 3
            1 1 -1;   %Line 4
            1 1 -1; %Line 5
            -1 1 -1; %Line 6
            -1 1 -1; %Line 7
            -1 -1 -1; %Line 8
            1 -1 1; %Line 9
            1 1 1; %Line 10
            1 -1 -1; %Line 11
            1 1 -1; %Line 12
            0 0 -1; %Line 13
            0 0 -1; %Line 14
            0 0 -1; %Line 15
            0 0 -1; %Line 16
            0 0 1; %Line 17
            0 0 1; %Line 18
            0 0 1; %Line 19
            0 0 1; %Line 20
            0 1 0; %Line 21
            0 -1 0; %Line 22
            1 0 0; %Line 23
            -1 0 0]; %Line 24
        
        %End points
        q = [1,-1,1; 
            -1 -1 1; 
            1 1 1; 
            1 -1 1
            -1 1 1
            1 1 1
            -1 -1 1
            -1 1 1
            -1 1 1
            -1 -1 1
            -1 1 -1
            -1 -1 -1
            0 1 0
            0 -1 0
            1 0 0
            -1 0 0
            0 1 0
            0 -1 0
            1 0 0
            -1 0 0
            1 0 0
            -1 0 0
            0 -1 0
            0 1 0]; 
    case "BCC"
        p = [-1,-1,-1; 1 1 -1; 1 -1 -1; -1 1 -1]; 
        q = [1,1,1; -1 -1 1; -1 1 1; 1 -1 1]; 
    case "Cubic"
        p = [-1,-1,-1; 1 1 -1; 1 -1 -1; -1 -1 -1;1 -1 -1; 1 1 -1; -1 1 -1; -1 -1 -1; -1 -1 1; -1 1 1; 1 1 1; 1 -1 1]; 
        q = [-1,1,-1; -1 1 -1; 1 1 -1; 1 -1 -1; 1 -1 1; 1 1 1; -1 1 1; -1 -1 1; -1 1 1; 1 1 1; 1 -1 1; -1 -1 1];
    case "FCC"
        p = [-1 -1 -1; 1 -1 -1; 1 1 -1; 1 -1 -1; -1 -1 -1; -1 -1 1; 1 1 1; -1 1 1;1 1 -1;1 -1 -1;1 1 1;1 -1 1]; 
        q = [1 -1 1; -1 -1 1; 1 -1 1; 1 1 1; -1 1 1; -1 1 -1; -1 1 -1; 1 1 -1; -1 -1 -1;-1 1 -1;-1 -1 1;-1 1 1]; 
    case "Octagon"
        p = [0 0 1;0 0 1;0 0 1;0 0 1;0 0 -1;0 0 -1;0 0 -1;0 0 -1;0 1 0;0 -1 0;0 -1 0;0 1 0];
        q = [1 0 0;-1 0 0;0 1 0;0 -1 0;0 -1 0;0 1 0;1 0 0;-1 0 0;-1 0 0;-1 0 0;1 0 0;1 0 0];
    case "Kelvin Cell"
        p = [ 0.5000   -1.0000         0
            0.5000   -1.0000         0
           -0.5000   -1.0000         0
           -0.5000   -1.0000         0
           -0.5000    1.0000         0
           -0.5000    1.0000         0
            0.5000    1.0000         0
            0.5000    1.0000         0
            1.0000    0.5000         0
            1.0000    0.5000         0
            1.0000   -0.5000         0
            1.0000   -0.5000         0
           -1.0000   -0.5000         0
           -1.0000   -0.5000         0
           -1.0000    0.5000         0
           -1.0000    0.5000         0
           -1.0000    0.5000         0
            1.0000    0.5000         0
            1.0000   -0.5000         0
           -1.0000   -0.5000         0
            0.5000         0    1.0000
           -0.5000         0    1.0000
           -0.5000         0    1.0000
            0.5000         0    1.0000
            0.5000         0   -1.0000
            0.5000         0   -1.0000
           -0.5000         0   -1.0000
           -0.5000         0   -1.0000
                 0   -1.0000   -0.5000
                 0    1.0000   -0.5000
                 0    1.0000    0.5000
                 0   -1.0000    0.5000
           -1.0000         0    0.5000
            1.0000         0    0.5000
            1.0000         0   -0.5000
           -1.0000         0   -0.5000];
        
        q = [ 0   -1.0000   -0.5000
                 0   -1.0000    0.5000
                 0   -1.0000    0.5000
                 0   -1.0000   -0.5000
                 0    1.0000   -0.5000
                 0    1.0000    0.5000
                 0    1.0000    0.5000
                 0    1.0000   -0.5000
            1.0000         0   -0.5000
            1.0000         0    0.5000
            1.0000         0    0.5000
            1.0000         0   -0.5000
           -1.0000         0   -0.5000
           -1.0000         0    0.5000
           -1.0000         0    0.5000
           -1.0000         0   -0.5000
           -0.5000    1.0000         0
            0.5000    1.0000         0
            0.5000   -1.0000         0
           -0.5000   -1.0000         0
                 0    0.5000    1.0000
                 0    0.5000    1.0000
                 0   -0.5000    1.0000
                 0   -0.5000    1.0000
                 0   -0.5000   -1.0000
                 0    0.5000   -1.0000
                 0    0.5000   -1.0000
                 0   -0.5000   -1.0000
                 0   -0.5000   -1.0000
                 0    0.5000   -1.0000
                 0    0.5000    1.0000
                 0   -0.5000    1.0000
           -0.5000         0    1.0000
            0.5000         0    1.0000
            0.5000         0   -1.0000
           -0.5000         0   -1.0000]; 

    case "Z-rods"
        p = [1     1    -1
            -1     1    -1
            -1    -1    -1
             1    -1    -1
        ];
        q = [1     1     1
            -1     1     1
            -1    -1     1
             1    -1     1];

    case "X-rods"
        p = [ -1     1     1
            -1    -1     1
            -1    -1    -1
            -1     1    -1];

        q = [1     1     1
             1    -1     1
             1    -1    -1
             1     1    -1];

    case "Y-rods"
        p = [ 1    -1     1
            -1    -1     1
            -1    -1    -1
             1    -1    -1];

        q = [ 1     1     1
            -1     1     1
            -1     1    -1
             1     1    -1];
    case "Custom"
        % Initialize an empty cell array to store the inputs
        p = startPoints;
        q = endPoints;
        
    %     % Start a loop to collect inputs from the user
    % 
    %     while true
    %     % Ask the user for input
    %     newInput1 = input('Enter start points x,y,z: ');  
    %     newInput2 = input('Enter end points x,y,z: '); 
    %     % Add the new input to the array
    % 
    %     p = [p;newInput1];
    %     q = [q;newInput2];
    % 
    %     % Ask if they have more information to input
    %     moreInfo = input('Do you want to add another strut? (y/n): ', 's');
    % 
    %     % Check if the user wants to stop
    %     if strcmpi(moreInfo, 'n')
    %     disp('No more struts.');
    %     break;  % Exit the loop
    %     end
    %     end

    case "BCC-Curved"
        p1 = [-1 -1 1; -1 1 1; 1 1 1; 1 -1 1; 
            1 1 -1; 1 -1 -1; -1 1 -1; -1 -1 -1;]; 
        p2 = [1 -1 0; -1 -1 0; -1 1 0; 1 1 0;
            -1 1 0; 1 1 0; -1 -1 0; 1 -1 0]; 
        
        p = [p1;p2];
        
        q1 = [0,0,0; 0 0 0; 0 0 0; 0 0 0; 0 0 0; 0 0 0; 0 0 0; 0 0 0]; 
        q2 = -p2;
        
        q = [q1;q2];

    case "Butterfly-Curved"
        p1 = [-1 -1 1; -1 1 1; 1 1 1; 1 -1 1; 
            1 1 -1; 1 -1 -1; -1 1 -1; -1 -1 -1;]; 
        p2 = [1 -1 0; -1 -1 0; -1 1 0; 1 1 0;
            -1 1 0; 1 1 0; -1 -1 0; 1 -1 0]; 
        
        p = [p1;p2];
        
        q1 = [0,0,0; 0 0 0; 0 0 0; 0 0 0; 0 0 0; 0 0 0; 0 0 0; 0 0 0]; 
        q2 = -p2;
        
        q = [q1;q2];

    case "FCC-Curved"
        p1 = [-1 -1 -1; -1 1 -1;  1 -1 -1; 1 1 -1; -1 -1 -1;-1 1 -1; 1 -1 -1; 1 1 -1];
        p2 = [-1 -1 0;  -1 1 0; 1 -1 0; 1 1 0; -1 -1 0; -1 1 0; 1 -1 0; 1 1 0];

        q1 = [-1 -1 1;  -1 1 1; 1 -1 1; 1 1 1; -1 -1 1; -1 1 1; 1 -1 1; 1 1 1];
        q2 = [1 -1 0; -1 -1 0; 1 1 0; -1 1 0 ;-1 1 0; 1 1 0; -1 -1 0; 1 -1 0];
        
        p = [p1;p2];
        q = [q1;q2];

    otherwise
        error("Structure has not been included in the list of strut based lattices")

end
