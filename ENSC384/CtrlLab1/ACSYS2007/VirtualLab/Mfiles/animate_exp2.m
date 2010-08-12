%   Author:     Johannes Minor
%   Date:       July, 2007
%   
%   This program takes the position output and input structures generated by the position control 
%   Simulink model and animates the output response and the input.
%

%Reinitialize all arrays, since the size of the array needs to be reset
cnst.enableanimation = 1;
anim.pos=0;
anim.ip=0;
anim.t=0;
anim.point=0;
anim.X=0;
anim.Y=0;
anim.index=0;
anim.ip_deg=0;
anim.pos_deg=0;

anim.length = 20;                            %Length of robot arm, in inches
anim.dt = 0.08333;                              %Time step resolution

anim.pos = output.signals.values;     %Creating a 1D position array
anim.ip = input.signals.values;       %Creating a 1D desired input array

anim.t = output.time;                        %Creating a 1D time array

set(guiel.APPWINDOW,'Resize','off');


set(guiel.hAX(1),'Nextplot','replace');
guiel.oTrace = plot(guiel.hAX(1),anim.t(1),anim.pos(1),'b-',anim.t(1),anim.ip(1),'r--',0,0,'rs','EraseMode','none','LineWidth',1.5,'Marker','none');

vars.axlims = [0 vars.simtime 1.05*[ min(anim.pos(find(anim.pos == min(anim.pos),1,'first')),anim.ip(find(anim.ip == min(anim.ip),1,'first'))),...
            1.05*max(anim.pos(find(anim.pos == max(anim.pos),1,'first')),anim.ip(find(anim.ip == max(anim.ip),1,'first')))]];

set(guiel.zoomzoom,'Enable','on'); set(guiel.zazoomzoomzoom,'Enable','off');
set(guiel.hAX(1),'XLim',vars.axlims(1:2),...
    'YLim',vars.axlims(3:4),...
    'GridLineStyle',':');
xlabel(guiel.hAX(1),'Time (s)'); ylabel(guiel.hAX(1), vars.plot_units); title(guiel.hAX(1),[vars.response_type ' Response']);

anim.ip = anim.ip;
anim.pos = anim.pos;

drawnow

%Setting up the line representing the robot arm
anim.point = [anim.length*cos(anim.pos),anim.length*sin(anim.pos)];
anim.X = [anim.point(:,1)];
anim.Y = [anim.point(:,2)];

m=1;                                    %anim.indexing the time array such that successive values are dt apart
for ii=1:size(anim.t)
    if anim.t(ii)>=(m-1)*anim.dt;
        anim.index(m) = ii;
        m=m+1;
    end
end
anim.index = anim.index(1:(m-1));
clear m ii
                    
anim.sizeX = size(anim.index);


% Draw the axes, Write the text objects to the polar plot.
        try delete(get(guiel.hAX(2),'Children'));
        end

        primeAnimateExp2

            anim.pos_deg_str=num2str(anim.pos(1));
            anim.ip_deg_str=num2str(anim.ip(1));
            anim.t_str=num2str(anim.t(1),2);
            vars.iptag = text(-8,-10,'Input:','FontUnits','points','FontSize',8,'Parent',guiel.hAX(2));
            vars.optag = text(-8,-13,'Output:','FontUnits','points','FontSize',8,'Parent',guiel.hAX(2));
            vars.ttag = text(-8,-16,'Time:','FontUnits','points','FontSize',8,'Parent',guiel.hAX(2));
            vars.ipstr = text(-1,-10,anim.ip_deg_str,'FontUnits','points','FontSize',8,'Parent',guiel.hAX(2));
            vars.opstr = text(-1,-13,anim.pos_deg_str,'FontUnits','points','FontSize',8,'Parent',guiel.hAX(2));
            vars.tstr = text(-1,-16,anim.t_str,'FontUnits','points','FontSize',8,'Parent',guiel.hAX(2));

for k=1:anim.sizeX(2)  %Framing loop for the movie; plotting input and position output
    try
        if vars.enableanimation==1;
            set(guiel.hPolar(1),'XData',[0 20*cos(anim.ip(anim.index(k))*pi/180)],'YData',[0 20*sin(anim.ip(anim.index(k))*pi/180)]);
            set(guiel.hPolar(2),'XData',[0 20*cos(anim.pos(anim.index(k))*pi/180)],'YData',[0 20*sin(anim.pos(anim.index(k))*pi/180)]);
            axes(guiel.hAX(2));
            anim.pos_deg_str=num2str(anim.pos(anim.index(k)));
            anim.ip_deg_str=num2str(anim.ip(anim.index(k)));
            anim.t_str=num2str(anim.t(anim.index(k)),2);

            set(vars.ipstr,'String',anim.ip_deg_str);
            set(vars.opstr,'String',anim.pos_deg_str);
            set(vars.tstr,'String',anim.t_str);
            
            set(guiel.oTrace(1),'xdata',anim.t(1:anim.index(k)),'ydata',anim.pos(1:anim.index(k)));
            set(guiel.oTrace(2),'xdata',anim.t(1:anim.index(k)),'ydata',anim.ip(1:anim.index(k)));
            grid(guiel.hAX(1),'on');
            legend(guiel.hAX(1),'Output','Input');
            %F(k) = getframe;
            drawnow;
        else break
        end
    catch break
    end
end
clear k
try
set(guiel.APPWINDOW,'Resize','on');
catch
end
%anim.rate = 1/anim.dt;