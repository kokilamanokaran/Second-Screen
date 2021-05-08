function FigHandle = figure2(varargin)
MP=get(0,'MonitorPositions');
fig=figure;
if size(MP,1)>1
    pos=get(fig,'Position');
    pause(0.01); % this seems sometimes necessary on a Mac
    set(fig,'Position',[pos(1,2)+MP(2,1:2) pos(3:4)]);
end
  %
  Shift    = MP(2, 1:2);
  FigH     = figure(varargin{:}, 'Visible', 'off');
  drawnow;
  set(FigH, 'Units', 'pixels');
  pos      = get(FigH, 'Position');
  pause(0.02);  % See Stefan Glasauer's comment
  set(FigH, 'Position', [pos(1:2) + Shift, pos(3:4)], ...
            'Visible', paramVisible);
end
if nargout ~= 0
  FigHandle = FigH;
end