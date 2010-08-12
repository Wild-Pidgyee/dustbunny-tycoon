% showTF
% An alert box pops up with the string args displayed using latex
% interpreter.
% str1-str2 : latex strings
% title : popup title


function varargout = showTF(varargin);
if nargout == 0
    if nargin == 7
        tfsym = varargin{1};
        tfnum = varargin{2};
        topPanel = varargin{3};
        midAx = varargin{4};
        botAx = varargin{5};
        vspace = varargin{6};
        hspace = varargin{7};

        old_units_top = get(topPanel,'Units');
        set(topPanel,'Units','pixels');

        old_units_bot = get(botAx,'Units');
        set(botAx,'Units','pixels');

        old_pos = get(botAx,'Position');

        VMARGIN = get(botAx,'Position');
        VMARGIN = VMARGIN(2);

        HMARGIN = old_pos(1);
        WIDTH = old_pos(3);

        boxheight = 152;

        if ishandle(midAx)
            old_units_mid = get(midAx,'Units');
            set(midAx,'Units','pixels');
            HEIGHT = (vspace - boxheight - 2*VMARGIN)/2;
            midPos = [HMARGIN 2.5*VMARGIN+HEIGHT WIDTH HEIGHT-0.5*VMARGIN];
            botPos = [HMARGIN VMARGIN WIDTH HEIGHT+VMARGIN];
            set(midAx,'Position',midPos);
            set(midAx,'Units',old_units_mid);
        else
            HEIGHT = (vspace - boxheight - VMARGIN);
            botPos = [HMARGIN VMARGIN WIDTH HEIGHT];
        end

        topPos = [2 vspace-boxheight hspace-6 boxheight-2];

        set(topPanel,'Position',topPos,'Visible','on','ButtonDownFcn',...
            ['kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
             'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; set(guiel.TFSelectBox,''Value'',1);'],...
            'ResizeFcn','');

        set(botAx,'Position',botPos);
        set(botAx,'Units',old_units_bot);
        set(topPanel,'Units',old_units_top);

        axHandle = get(topPanel,'Children');
            set(axHandle,'XLim',[0 1],'YLim',[0 1]);
        kiddies = get(axHandle,'Children');

        if any(ishandle(kiddies)) delete(kiddies); end

        text(0.5,0.7,tfsym,'Interpreter','latex','Fontsize',16,'VerticalAlignment','middle','HorizontalAlignment','center','Parent',axHandle,'ButtonDownFcn',...
            ['kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
             'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; set(guiel.TFSelectBox,''Value'',1);']);
        text(0.5,0.4,tfnum,'Interpreter','latex','Fontsize',16,'VerticalAlignment','middle','HorizontalAlignment','center','Parent',axHandle,'ButtonDownFcn',...
            ['kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
             'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; set(guiel.TFSelectBox,''Value'',1);']);

    elseif nargin == 5
        % Gear Head Calculator
        topPanel = varargin{1};
        midAx = varargin{2};
        botAx = varargin{3};
        vspace = varargin{4};
        hspace = varargin{5};

        old_units_top = get(topPanel,'Units');
        set(topPanel,'Units','pixels');

        old_units_bot = get(botAx,'Units');
        set(botAx,'Units','pixels');

        old_pos = get(botAx,'Position');

        VMARGIN = get(botAx,'Position');
        VMARGIN = VMARGIN(2);

        HMARGIN = old_pos(1);
        WIDTH = old_pos(3);

        boxheight = 152;

        if ishandle(midAx)
            old_units_mid = get(midAx,'Units');
            set(midAx,'Units','pixels');
            HEIGHT = (vspace - boxheight - 2*VMARGIN)/2;
            midPos = [HMARGIN 2.5*VMARGIN+HEIGHT WIDTH HEIGHT-0.5*VMARGIN];
            botPos = [HMARGIN VMARGIN WIDTH HEIGHT+VMARGIN];
            set(midAx,'Position',midPos);
            set(midAx,'Units',old_units_mid);
        else
            HEIGHT = (vspace - boxheight - VMARGIN);
            botPos = [HMARGIN VMARGIN WIDTH HEIGHT];
        end

        topPos = [2 vspace-boxheight hspace-6 boxheight-2];

        set(topPanel,'Position',topPos,'Visible','on');


        set(botAx,'Position',botPos);
        set(botAx,'Units',old_units_bot);
        set(topPanel,'Units',old_units_top);

        axHandle = get(topPanel,'Children');


        kiddies = get(axHandle,'Children');

        if any(ishandle(kiddies)) delete(kiddies); end

        pic = imread('gearhead.bmp');
        topPos;
        dims = size(pic);
        dims = [dims(2)*[-0.5 0.5] dims(1)*[-0.5 0.5]];
        image(dims(1:2),dims(3:4),pic,'Parent',axHandle);
        set(axHandle,'XLim',topPos(3)*[-0.34 0.66],'YLim',topPos(4)*[-0.5 0.5],'XLimMode','manual','YLimMode','manual','Visible','off','Xdir','normal','Ydir','normal');

        text(0,-55,'$N_1:N_2$','Interpreter','latex','Fontsize',12,'VerticalAlignment','top','HorizontalAlignment','left','Parent',axHandle);
        text(dims(2)+5,0,'$J_{load}$','Interpreter','latex','Fontsize',12,'VerticalAlignment','middle','HorizontalAlignment','left','Parent',axHandle);
        text(dims(1),20,'$Motor$','Interpreter','latex','Fontsize',12,'VerticalAlignment','middle','HorizontalAlignment','left','Parent',axHandle);

        result = text(dims(2)+60,30,'','Interpreter','latex','Fontsize',12,'VerticalAlignment','middle','HorizontalAlignment','left','Parent',axHandle);




        tt = 'Enter gear ratios, and Motor and load interia, then press Enter.'; 
        jCalc = uipanel('Parent',gcf,'Units','pixels','Position',[ 300 topPos(2)+30 70 100],'BorderType','beveledin');
        button = uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 0 70 20],'String','Copy Result','Style','pushbutton',...
            'Callback','clipboard(''copy'',get(gcbo,''UserData''));','UserData',0,...
            'BackgroundColor',[0.9 0.9 0.9],'Enable','on','ToolTipString','Copy output value to Clipboard');

        cback = ['switch tmp.m, '...
            'case 1;'...
                'tmp.others = get(gcbo,''UserData'');'...
                'tmp.n1 = str2num(get(gcbo,''String''));'...
                'tmp.n2 = str2num(get(tmp.others(1),''String''));'...
                'tmp.J = str2num(get(tmp.others(2),''String''));'...
                'tmp.Jm = str2num(get(tmp.others(3),''String''));'...
            'case 2;'...
                'tmp.others = get(gcbo,''UserData'');'...
                'tmp.n2 = str2num(get(gcbo,''String''));'...
                'tmp.n1 = str2num(get(tmp.others(1),''String''));'...
                'tmp.J = str2num(get(tmp.others(2),''String''));'...
                'tmp.Jm = str2num(get(tmp.others(3),''String''));'...
            'case 3;'...
                'tmp.others = get(gcbo,''UserData'');'...
                'tmp.J = str2num(get(gcbo,''String''));'...
                'tmp.n2 = str2num(get(tmp.others(1),''String''));'...
                'tmp.n1 = str2num(get(tmp.others(2),''String''));'...
                'tmp.Jm = str2num(get(tmp.others(3),''String''));'...
            'case 4;'...
                'tmp.others = get(gcbo,''UserData'');'...
                'tmp.Jm = str2num(get(gcbo,''String''));'...
                'tmp.n1 = str2num(get(tmp.others(1),''String''));'...
                'tmp.n2 = str2num(get(tmp.others(2),''String''));'...
                'tmp.J = str2num(get(tmp.others(3),''String''));'...
        'end;'...
            'tmp.str = [''$J=\frac{N_1^2}{N_2^2}\cdot J_{load}+J_m='' num2str((tmp.J*tmp.n1^2)/(tmp.n2^2)+tmp.Jm) ''kg \cdot m^2$'']; '...
            'set(' num2str(result,'%15.15f') ' ,''String'',tmp.str); set(' num2str(button,'%15.15f') ',''Enable'',''on'',''UserData'',num2str((tmp.J*tmp.n1^2)/(tmp.n2^2)+tmp.Jm)); clear tmp'];    

     %   uicontrol('Parent',jCalc,'Style','text','Units','pixels','Position',[0 60 60 20],'BackgroundColor',[0.8 0.8 1],'Enable','off','ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);']);
        edit(1) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[30 80 40 20],'String','1','Style','edit','Callback',['tmp.m=1; ' cback],'BackgroundColor',[1 1 1],'ToolTipString',tt);
        edit(2) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[30 60 40 20],'String','1','Style','edit','Callback',['tmp.m=2; ' cback],'BackgroundColor',[1 1 1],'ToolTipString',tt);
        edit(3) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[30 40 40 20],'String','0','Style','edit','Callback',['tmp.m=3; ' cback],'BackgroundColor',[1 1 1],'ToolTipString',tt);
        edit(4) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[30 20 40 20],'String','0.0019','Style','edit','Callback',['tmp.m=4; ' cback],'BackgroundColor',[1 1 1],'ToolTipString',tt);
        set(edit(1),'UserData',[edit(2) edit(3) edit(4)]); set(edit(2),'UserData',[edit(1) edit(3) edit(4)]); set(edit(3),'UserData',[edit(2) edit(1) edit(4)]); set(edit(4),'UserData',[edit(1) edit(2) edit(3)]);
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 80 30 20],'String','N1','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString',tt);
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 60 30 20],'String','N2','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString',tt);
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 40 30 20],'String','Jload','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString',tt);
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 20 30 20],'String','Jm','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString',tt);

        set(result,'DeleteFcn',['try delete(' num2str(jCalc,'%15.15f') '); end;'])

        set(topPanel,'ButtonDownFcn',...
            ['kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
             'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; set(guiel.TFSelectBox,''Value'',1);'],...
            'ResizeFcn','');

    elseif nargin == 6
        params = varargin{1};
        topPanel = varargin{2};
        midAx = varargin{3};
        botAx = varargin{4};
        vspace = varargin{5};
        hspace = varargin{6};


        names = {'$L$','$R$','$J_{total}$','$b$','$k_b$','$k_m$','$k_p$','$k_i$','$k_d$'};
        descs = {'$Armature Inductance - H$',...
                 '$Armature Resistance - \Omega$',...
                 '$Moment of Inertia - kg \cdot m^2$',...
                 '$Equivalent Viscous Friction Coefficient - \frac{N \cdot m \cdot s}{rad}$',...
                 '$Back-EMF Constant - \frac{V \cdot s}{rad}$',...
                 '$Motor Torque Constant - \frac{N \cdot m}{A}$',...
                 '$Proportional Gain$',...
                 '$Integral Gain$',...
                 '$Derivative Gain$'};

        old_units_top = get(topPanel,'Units');
        set(topPanel,'Units','pixels');

        old_units_bot = get(botAx,'Units');
        set(botAx,'Units','pixels');

        old_pos = get(botAx,'Position');

        VMARGIN = get(botAx,'Position');
        VMARGIN = VMARGIN(2);

        HMARGIN = old_pos(1);
        WIDTH = old_pos(3);

        boxheight = 190;

        if ishandle(midAx)
            old_units_mid = get(midAx,'Units');
            set(midAx,'Units','pixels');
            HEIGHT = (vspace - boxheight - 2*VMARGIN)/2;
            midPos = [HMARGIN 2.5*VMARGIN+HEIGHT WIDTH HEIGHT-0.5*VMARGIN];
            botPos = [HMARGIN VMARGIN WIDTH HEIGHT+VMARGIN];
            set(midAx,'Position',midPos);
            set(midAx,'Units',old_units_mid);
        else
            HEIGHT = (vspace - boxheight - VMARGIN);
            botPos = [HMARGIN VMARGIN WIDTH HEIGHT];
        end

        topPos = [2 vspace-boxheight hspace-6 boxheight-20];

        set(topPanel,'Position',topPos,'Visible','on','ButtonDownFcn',...
            ['kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
             'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; set(guiel.TFSelectBox,''Value'',1);'],...
            'ResizeFcn','');

        set(botAx,'Position',botPos);
        set(botAx,'Units',old_units_bot);
        set(topPanel,'Units',old_units_top);

        axHandle = get(topPanel,'Children');
        set(axHandle,'XLim',[0 1],'YLim',[0 1]);
        kiddies = get(axHandle,'Children');

        if any(ishandle(kiddies)) delete(kiddies); end

        for ii = 1:length(params)
             text(0.1,1/(length(params)+1)*(length(params)-ii+1),char(names{ii}),'Interpreter','latex','Fontsize',10,'VerticalAlignment','middle','HorizontalAlignment','left','Parent',axHandle,'ButtonDownFcn',...
                ['kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
                 'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; set(guiel.TFSelectBox,''Value'',1);']);       
             text(0.3,1/(length(params)+1)*(length(params)-ii+1),num2str(params(ii)),'Interpreter','latex','Fontsize',10,'VerticalAlignment','middle','HorizontalAlignment','left','Parent',axHandle,'ButtonDownFcn',...
                ['kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
                 'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; set(guiel.TFSelectBox,''Value'',1);']); 
             text(0.5,1/(length(params)+1)*(length(params)-ii+1),char(descs{ii}),'Interpreter','latex','Fontsize',10,'VerticalAlignment','middle','HorizontalAlignment','left','Parent',axHandle,'ButtonDownFcn',...
                ['kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
                 'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; set(guiel.TFSelectBox,''Value'',1);']); 
        end

    end
elseif nargout == 1
   if nargin == 6
        % Edit Puck Drop Parameters
            params = varargin{1};
        topPanel = varargin{2};
        midAx = varargin{3};
        botAx = varargin{4};
        vspace = varargin{5};
        hspace = varargin{6};
        old_units_top = get(topPanel,'Units');
        set(topPanel,'Units','pixels');

        old_units_bot = get(botAx,'Units');
        set(botAx,'Units','pixels');

        old_pos = get(botAx,'Position');

        VMARGIN = get(botAx,'Position');
        VMARGIN = VMARGIN(2);

        HMARGIN = old_pos(1);
        WIDTH = old_pos(3);

        boxheight = 100;

        if ishandle(midAx)
            old_units_mid = get(midAx,'Units');
            set(midAx,'Units','pixels');
            HEIGHT = (vspace - boxheight - 2*VMARGIN)/2;
            midPos = [HMARGIN 2.5*VMARGIN+HEIGHT WIDTH HEIGHT-0.5*VMARGIN];
            botPos = [HMARGIN VMARGIN WIDTH HEIGHT+VMARGIN];
            set(midAx,'Position',midPos);
            set(midAx,'Units',old_units_mid);
        else
            HEIGHT = (vspace - boxheight - VMARGIN);
            botPos = [HMARGIN VMARGIN WIDTH HEIGHT];
        end

        topPos = [2 vspace-boxheight hspace-6 boxheight-20];

        set(topPanel,'Position',topPos,'Visible','on','ButtonDownFcn',...
            ['kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
             'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; set(guiel.TFSelectBox,''Value'',1);'],...
            'ResizeFcn','');

        set(botAx,'Position',botPos);
        set(botAx,'Units',old_units_bot);
        set(topPanel,'Units',old_units_top);

        axHandle = get(topPanel,'Children');
        set(axHandle,'XLim',[0 1],'YLim',[0 1]);
        kiddies = get(axHandle,'Children');
        if any(ishandle(kiddies)) delete(kiddies); end
        
        jCalc = uipanel('Parent',gcf,'Units','pixels','Position',[ (topPos(3))/2+75 topPos(2) 400 60],'BorderType','beveledin');
        
        dummytext = text(0,0,'','VerticalAlignment','middle','HorizontalAlignment','left','Parent',axHandle);
        set(dummytext,'DeleteFcn',['try delete(' num2str(jCalc,'%15.15f') '); end;']);
        
        edit(1) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[300 40 100 20],'String',num2str(params(1)),'Style','edit',...
            'Callback','try if str2num(get(gcbo,''String''))< 101 || str2num(get(gcbo,''String'')) > 1000, set(gcbo,''String'',num2str(vars.armradius)); end; catch, set(gcbo,''String'',num2str(vars.armradius)); end;',...
            'BackgroundColor',[1 1 1],'ToolTipString','Robot Arm Length');
        edit(2) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[300 20 100 20],'String',num2str(params(2)),'Style','edit',...
            'Callback','try if str2num(get(gcbo,''String''))< 2 || str2num(get(gcbo,''String'')) > 500, set(gcbo,''String'',num2str(vars.dropheight)); end; catch, set(gcbo,''String'',num2str(vars.dropheight)); end;',...
            'BackgroundColor',[1 1 1],'ToolTipString','Puck Drop Height');
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 40 300 20],'String','Enter the length of the robot arm (mm)','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString','Robot Arm Length');
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 20 300 20],'String','Enter the height of the puck (mm)','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString','Puck Drop Height');
        
        button = uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 0 400 20],'String','Update Model','Style','pushbutton',...
            'Callback',['vars.dropheight = str2num(get(' num2str(edit(2),'%15.15f') ',''String'')); vars.armradius = str2num(get(' num2str(edit(1),'%15.15f') ',''String''));'...
                        'kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; '...
                                    'set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
                                     'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; eval(get(guiel.hPB(4),''Callback''));'],...
            'BackgroundColor',[0.9 0.9 0.9],'Enable','on','ToolTipString','Copy output value to Clipboard');
        varargout = {''};
        
   else

        armrad = varargin{1};
        topPanel = varargin{2};
        midAx = varargin{3};
        botAx = varargin{4};
        vspace = varargin{5};
        hspace = varargin{6};
        old_units_top = get(topPanel,'Units');
        set(topPanel,'Units','pixels');

        old_units_bot = get(botAx,'Units');
        set(botAx,'Units','pixels');

        old_pos = get(botAx,'Position');

        VMARGIN = get(botAx,'Position');
        VMARGIN = VMARGIN(2);

        HMARGIN = old_pos(1);
        WIDTH = old_pos(3);

        pic = imread('gearhead5.bmp');
        dims = size(pic);
        
        boxheight = dims(1)+60;

        if ishandle(midAx)
            old_units_mid = get(midAx,'Units');
            set(midAx,'Units','pixels');
            HEIGHT = (vspace - boxheight - 2*VMARGIN)/2;
            midPos = [HMARGIN 2.5*VMARGIN+HEIGHT WIDTH HEIGHT-0.5*VMARGIN];
            botPos = [HMARGIN VMARGIN WIDTH HEIGHT+VMARGIN];
            set(midAx,'Position',midPos);
            set(midAx,'Units',old_units_mid);
        else
            HEIGHT = (vspace - boxheight - VMARGIN);
            botPos = [HMARGIN VMARGIN WIDTH HEIGHT];
        end

        topPos = [2 vspace-boxheight hspace-6 boxheight-20];

        set(topPanel,'Position',topPos,'Visible','on','ButtonDownFcn',...
            ['kiddies = get(guiel.hAX(3),''Children''); delete(kiddies); clear kiddies; set(guiel.tfPanel,''Visible'',''off'',''Position'',cnst.tfPanelpos); set(guiel.hAX(1),''Position'',cnst.axpos1);'...
             'if ishandle(guiel.hAX(2)) set(guiel.hAX(2),''Position'',cnst.axpos2); end; set(guiel.TFSelectBox,''Value'',1);'],...
            'ResizeFcn','');

        set(botAx,'Position',botPos);
        set(botAx,'Units',old_units_bot);
        set(topPanel,'Units',old_units_top);

        axHandle = get(topPanel,'Children');
        set(axHandle,'XLim',[0 1],'YLim',[0 1],'Visible','off');
        kiddies = get(axHandle,'Children');
        if any(ishandle(kiddies)) delete(kiddies); end
        
        
        jCalc = uipanel('Parent',gcf,'Units','pixels','Position',[topPos(3)/2+275-(170+dims(2))/2 topPos(2)-10 170+dims(2) max(120,dims(1))],...
            'BorderType','none','BackgroundColor',[1 1 0.9]);
       
        newax = axes('Parent',jCalc,'Visible','off','Units','pixels','Position',[140 1 dims(2) dims(1)],'Xdir','normal','Ydir','reverse');
        image(pic,'Parent',newax);
        set(newax,'XLimMode','manual','YLimMode','manual','Visible','off','Xdir','normal','Ydir','reverse','Xlim',[0.5 dims(2)+0.5],'Ylim',[0.5 dims(1)+0.5]);
        
        text(0-10,40,'$N_1:N_2$','Interpreter','latex','Fontsize',12,'VerticalAlignment','bottom','HorizontalAlignment','left','Parent',newax);
        text(150,dims(1)-40,'$m_{puck}$','Interpreter','latex','Fontsize',12,'VerticalAlignment','bottom','HorizontalAlignment','left','Parent',newax);
        text(90,dims(1)-70,'$m_{arm}$','Interpreter','latex','Fontsize',12,'VerticalAlignment','bottom','HorizontalAlignment','left','Parent',newax);
        text(60,dims(1)-30,'$Motor$','Interpreter','latex','Fontsize',12,'VerticalAlignment','bottom','HorizontalAlignment','left','Parent',newax);
        text(130,0,['$r_{arm}=' num2str(armrad) 'mm$'],'Interpreter','latex','Fontsize',12,'VerticalAlignment','top','HorizontalAlignment','left','Parent',newax);
        result = text(0.5,0.9,'','Interpreter','latex','Fontsize',12,'VerticalAlignment','top','HorizontalAlignment','center','Parent',axHandle);
        button = uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 0 120 20],'String','Copy Result','Style','pushbutton',...
            'Callback','clipboard(''copy'',get(gcbo,''UserData''));','UserData',0,...
            'BackgroundColor',[0.9 0.9 0.9],'Enable','on','ToolTipString','Copy output value to Clipboard');
        
        cback = ['switch tmp.m, '...
            'case 1;'...
                'tmp.others = get(gcbo,''UserData'');'...
                'tmp.vars = [str2num(get(gcbo,''String'')) str2num(get(tmp.others(1),''String'')) '...
                'str2num(get(tmp.others(2),''String'')) str2num(get(tmp.others(3),''String'')) str2num(get(tmp.others(4),''String''))];'...
            'case 2;'...
                'tmp.others = get(gcbo,''UserData'');'...
                'tmp.vars = [str2num(get(tmp.others(1),''String'')) str2num(get(gcbo,''String'')) '...
                'str2num(get(tmp.others(2),''String'')) str2num(get(tmp.others(3),''String'')) str2num(get(tmp.others(4),''String''))];'...
            'case 3;'...
                'tmp.others = get(gcbo,''UserData'');'...
                'tmp.vars = [str2num(get(tmp.others(1),''String'')) str2num(get(tmp.others(2),''String'')) '...
                'str2num(get(gcbo,''String'')) str2num(get(tmp.others(3),''String'')) str2num(get(tmp.others(4),''String''))];'...
            'case 4;'...
                'tmp.others = get(gcbo,''UserData'');'...
                'tmp.vars = [str2num(get(tmp.others(1),''String'')) str2num(get(tmp.others(2),''String'')) '...
                'str2num(get(tmp.others(3),''String'')) str2num(get(gcbo,''String'')) str2num(get(tmp.others(4),''String''))];'...
            'case 5;'...
                'tmp.others = get(gcbo,''UserData'');'...
                'tmp.vars = [str2num(get(tmp.others(1),''String'')) str2num(get(tmp.others(2),''String'')) '...
                'str2num(get(tmp.others(3),''String'')) str2num(get(tmp.others(4),''String'')) str2num(get(gcbo,''String''))];'...
        'end;'...
            'tmp.result = ((tmp.vars(4)/3+tmp.vars(5))*' num2str((armrad/1000)^2) '*tmp.vars(1)^2)/(tmp.vars(2)^2+tmp.vars(3));'...
            'tmp.str = [''$J=\frac{N_1^2}{N_2^2}\cdot (\frac{m_{arm}}{3} + m_{puck}) \cdot r_{arm}^2 + J_m='' num2str(tmp.result) ''kg \cdot m^2$'']; '...
            'set(' num2str(result,'%15.15f') ' ,''String'',tmp.str); set(' num2str(button,'%15.15f') ',''Enable'',''on'',''UserData'',tmp.result); clear tmp'];    

        
        tt = 'Enter masses and gear ratios to calculate moment of inertia, then press Enter.';
        
        edit(1) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[80 100 40 20],'String','1','Style','edit','Callback',['tmp.m=1; ' cback],'BackgroundColor',[1 1 1],'ToolTipString',tt);
        edit(2) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[80 80 40 20],'String','1','Style','edit','Callback',['tmp.m=2; ' cback],'BackgroundColor',[1 1 1],'ToolTipString',tt);
        edit(3) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[80 60 40 20],'String','0.0019','Style','edit','Callback',['tmp.m=3; ' cback],'BackgroundColor',[1 1 1],'ToolTipString',tt);
        edit(4) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[80 40 40 20],'String','1','Style','edit','Callback',['tmp.m=4; ' cback],'BackgroundColor',[1 1 1],'ToolTipString',tt);
        edit(5) = uicontrol('Parent',jCalc,'Units','Pixels','Position',[80 20 40 20],'String','1','Style','edit','Callback',['tmp.m=5; ' cback],'BackgroundColor',[1 1 1],'ToolTipString',tt);

        set(edit(1),'UserData',[edit(2) edit(3) edit(4) edit(5)]); set(edit(2),'UserData',[edit(1) edit(3) edit(4) edit(5)]); set(edit(3),'UserData',[edit(1) edit(2) edit(4) edit(5)]);
        set(edit(4),'UserData',[edit(1) edit(2) edit(3) edit(5)]); set(edit(5),'UserData',[edit(1) edit(2) edit(3) edit(4)]);
        
        %1 - n1
        %2 - n2
        %3 - Jm
        %4 - marm
        %5 - mpuck
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 100 80 20],'String','N1','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString',tt);
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 80 80 20],'String','N2','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString',tt);
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 60 80 20],'String','Jm','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString',tt);
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 40 80 20],'String','Arm Mass (kg)','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString',tt);
        uicontrol('Parent',jCalc,'Units','Pixels','Position',[0 20 80 20],'String','Puck mass (kg)','Style','text',...
            'ButtonDownFcn',['hoverBox(' num2str(gcf,'%15.15f') ',' num2str(jCalc,'%15.15f') ',gcbo);'],...
            'BackgroundColor',[1 1 0.9],'Enable','off','ToolTipString',tt);

        set(result,'DeleteFcn',['try delete(' num2str(jCalc,'%15.15f') '); end;'])
        
        varargout = {'1'};
   end

end
    