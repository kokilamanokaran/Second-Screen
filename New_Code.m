%% 
addpath(genpath('C:\Users\admin\Desktop\Projects\Freelancer\Codementor\Nicholas\Code')) 
imds = imageDatastore('C:\Users\admin\Desktop\Projects\Freelancer\Codementor\Nicholas\Pictures','FileExtensions',{'.jpg','.tif'});
nFiles = numel(imds.Files);
I = readimage(imds,1);

%%Codes to consider
get( groot, 'MonitorPositions' );
set_figure_toscreen(a)
%%Where 'a' is numeric, either a monitor number (1, 2, 3, 4) or a figure handle.
set_figure_toscreen(opt,a)
%%Where opt is a string, either 'mon' to use a monitor, or 'fig' to
%%use a figure handle. a should be either a monitor number (if using 'mon') or a figure handle (if using 'fig'). 

fig=figure;
a = axes('position',[.3 .3 .3 .5]);
ax.CameraPosition = [0 0 0];
imagesc(I); % assume you have I as an image
pos=get(a,'position');
x_shift=.1; 
y_shift=.1;

%%set(a,'position',pos+[x_shift 0 0 0]);
%%set(a,'position',pos+[0 y_shift 0 0]);
%% show figure 
imshow(I, 'Color', 'k')
%% Move figure around?
% Demo to shift a region in a binary image.
% By ImageAnalyst
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.
workspace;  % Make sure the workspace panel is showing.
fontSize = 14;
grayImage = peaks(200);
imshow(grayImage, []);
subplot(2,2,1);
imshow(grayImage, []);
title('Original Grayscale Image', 'FontSize', fontSize);
axis on;
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]); % Maximize figure.
set(gcf,'name','Demo by ImageAnalyst','numbertitle','off') 
% imtool(z)
binaryImage = grayImage > 5;
subplot(2,2,2);
imshow(binaryImage, []);
title('Binary Image', 'FontSize', fontSize);
axis on;
% Find the centroid of that binary region
measurements = regionprops(binaryImage, 'Centroid');
[rows, columns] = size(binaryImage);
rowsToShift = round(rows/2- measurements.Centroid(2));
columnsToShift = round(columns/2 - measurements.Centroid(1));
% Call circshift to move region to the center.
shiftedImage = circshift(binaryImage, [rowsToShift columnsToShift]);
subplot(2,2,3);
imshow(shiftedImage, []);
title('Shifted Binary Image', 'FontSize', fontSize);
axis on;

%% online code
im = imread('autumn.tif');
im1 = im(1:206,1:206,:); %make the image square for demonstration purposes
im2 = imresize(im1,0.5);
im3 = imresize(im2,0.5);
subplot('position',[1-1 .5 1/2 1/2])
imshow(im1);
subplot('position',[1-.5 .5 1/4 1/4]);
imshow(im2);
subplot('position',[1-.25 .5 1/8 1/8]);
imshow(im3);
%% WindowAPI demo
FigH = figure('Color',[1, 1, 1], 'Renderer', 'Painters');
AxesH = axes('Units', 'pixels', 'Position', [100, 100, 100, 100]);
sphere;
set(AxesH, 'Visible', 'off', 'CameraViewAngle', 7);
uicontrol('String', 'The Button', 'Position', [220, 100, 80, 28]);
WindowAPI(FigH, 'Alpha', 0.7, [255, 255, 255]);
