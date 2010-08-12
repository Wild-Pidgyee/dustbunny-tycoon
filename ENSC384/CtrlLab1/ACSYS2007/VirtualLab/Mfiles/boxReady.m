% boxReady
%   Prepares the axes guiel.hAX(1) for the zoom select box.  The Zoom In
%   button sets boxReady as the "ButtonDownFcn" of the axes.
%
%   Ex:
% guiel.zoomzoom=uicontrol(guiel.cPanel(4),'Style','PushButton','Units','pixels',...
% 	'Position',[0 0 cnst.icwidth cnst.icwidth],'Enable','on',...
%     'CData',iczoomin,'TooltipString',guiel.zoominTt,'CallBack',...
%     'set(guiel.hAX(1),''ButtonDownFcn'',''boxReady'');set(guiel.zoomzoom,''Enable'',''off'');');
%
% Axes Handle : guiel.hAX(1)
% Patch Handle : guiel.dragBox
% Figure Handle : guiel.APPWINDOW
% Start Point : vars.CurrentPoint
% Axes Limits : vars.axlims  ([Xmin Xmax Ymin Ymax])
% Zoom Out Button: guiel.zazoomzoomzoom
% New Axes Limits: vars.XYLim ([Xmin Xmin Xmax Xmax Ymin Ymax Ymax Ymin])
%

vars.CurrentPoint = get(guiel.hAX(1),'CurrentPoint');
set(guiel.APPWINDOW,'PointerShapeCData',cnst.MagnifyingGlass);

axes(guiel.hAX(1));
hold on;
if ishandle(guiel.dragBox)
    delete(guiel.dragBox);
end
guiel.dragBox = patch(guiel.hAX(1),repmat(vars.CurrentPoint(1,1),[1 4]),repmat(vars.CurrentPoint(1,2),[1 4]));
set(guiel.dragBox,'FaceColor','none','EdgeColor','r','LineStyle',':');
hold off;

set(guiel.zazoomzoomzoom,'Enable','on');

vars.axlims = [get(guiel.hAX(1),'XLim') get(guiel.hAX(1),'YLim')];

set(guiel.APPWINDOW,'Units','pixels','WindowButtonMotionFcn',...
    'vars.XYLims = drawBox2(guiel.dragBox,vars.CurrentPoint,vars.axlims,get(guiel.hAX(1),''CurrentPoint''));',...
    'WindowButtonUpFcn',...
    ['set(guiel.APPWINDOW,''WindowButtonMotionFcn'',''eval(codeblk.ZoomPointerControl);'',''WindowButtonUpFcn'','''');'...'
    'vars.XYLim = [get(guiel.dragBox,''Xdata'') get(guiel.dragBox,''YData'')];,'...
    'set(guiel.APPWINDOW,''Units'',''Normalized''); delete(guiel.dragBox);'...
    'if numel(vars.XYLim) >=4 && ~any(any(isnan(vars.XYLim)))'...
        'diffLim = diff(vars.XYLim); diffAx = diff(vars.axlims);'...
        'if diffLim(2,1) > diffAx(1)/100 && diffLim(1,2) > diffAx(3)/100 '...
            'set(guiel.hAX(1),''XLim'',[vars.XYLim(1,1) vars.XYLim(3,1)],''YLim'',[vars.XYLim(1,2) vars.XYLim(3,2)]);'...
        'end,'...
        'clear diffLim diffAx;'...
    'else,'...
        'plotTime = get(guiel.oTrace(1),''XData'');'...
        'if vars.CurrentPoint(1,1)-(vars.axlims(2)-vars.axlims(1))/4 < plotTime(1);',...
        '   set(guiel.hAX(1),''xlim'',[plotTime(1) plotTime(1)+(vars.axlims(2)-vars.axlims(1))/2]);',...
        'else;',...
        '   set(guiel.hAX(1),''xlim'',[vars.CurrentPoint(1,1)-(vars.axlims(2)-vars.axlims(1))/4 vars.CurrentPoint(1,1)+(vars.axlims(2)-vars.axlims(1))/4]);',...
        'end;',...
        'set(guiel.hAX(1),''ylim'',[vars.CurrentPoint(1,2)-(vars.axlims(4)-vars.axlims(3))/4 vars.CurrentPoint(1,2)+(vars.axlims(4)-vars.axlims(3))/4]); clear plotTime;'...
     'end,'...
     'vars.axlims = [get(guiel.hAX(1),''XLim'') get(guiel.hAX(1),''YLim'')];'...
      ]);

