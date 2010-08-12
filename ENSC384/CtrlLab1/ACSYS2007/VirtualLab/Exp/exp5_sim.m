% function exp5
% exp5  -	A MATLAB based application that is a simulated control design project.
% This application makes extensive use of the GUI capabilities
% of Matlab R12.
% To run, select Experiment #5 from the Experiment Menu in SIMLab
%
% � Farid Golnaraghi 1993, 1999, 2002, 2007
% The MechWorks Software Inc., Waterloo, Ont., Canada
% Version 2007
%=============================================================
% Author: Johannes Minor
% SIMLab, Experiment 5: Control System Design GUI
% Last Modified: July 10, 2007
%=============================================================

vars.response_type = 'Position';
vars.simfilename = 'controldesign_sim';

vars.simtime = 3;
    set(guiel.APPWINDOW,'Name','SIMLab: Experiment 5: Control System Design � 2007 Farid Golnaraghi');

    exp_fig;
    
    guiel.helptext = {...
        'SIMLab - Experiment 5: Control System Design - Puck Drop Experiment',...
        '',...
        'Click "Enter Model Parameters" to open the Simulink block diagram.',...
        'Double click on the "PID" block to modify controller parameters.',...
        'Double click on the "DC Motor(Position Output)" block to enter motor properties.',...
        'Double click on the "Input Step" and "Step Disturbance" blocks to modify system inputs.',...
        'Double click on the "Electromagnet Control" to set the release angle and position trigger enable time. ',...
        '',...
        'To run the simulation, close the Simulink Block Diagram and click "Run Simulation". "Stop Simulation" halts the animation.',...
        'To export the time response plot as it currently appears, click "Plot To Figure".  If you wish to plot multiple response curves on the same figure, check the "Reuse Axes" checkbox.',...
        '',...
        'The "SIMLab Tools" Menu',...
        'Selecting a Transfer Function from the dropdown menu will display the transfer function in numeric and symbolic form.',...
        'Choose "Show Simulation Parameters" from the SIMLab Tools dropdown menu to see the current controller and motor parameters.',...
        'The "Gear Head Calculator" calculates the total inertia, given a gear ratio, motor inertia and load inertia.',...
        'To adjust the length of the robot arm and the height of the puck drop, choose "Modify Puck Drop Setup".',...
        '',...
        'Click the Zoom button and drag an area on the plot to set new axes limits.',...
        'Click the Cursor button and use the mouse to find exact point values on the plot, or skip through data values with the arrow keys.'};