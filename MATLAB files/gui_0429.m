function varargout = gui_0429(varargin)
% GUI_0429 MATLAB code for gui_0429.fig
%      GUI_0429, by itself, creates a new GUI_0429 or raises the existing
%      singleton*.
%
%      H = GUI_0429 returns the handle to a new GUI_0429 or the handle to
%      the existing singleton*.
%
%      GUI_0429('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_0429.M with the given input arguments.
%
%      GUI_0429('Property','Value',...) creates a new GUI_0429 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_0429_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_0429_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_0429

% Last Modified by GUIDE v2.5 29-Apr-2019 16:53:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_0429_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_0429_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui_0429 is made visible.
function gui_0429_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_0429 (see VARARGIN)

% Choose default command line output for gui_0429
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_0429 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_0429_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%%


%%
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%function myslider
%figure;
%{
sld = uicontrol('Style', 'slider',...
        'Min',0,'Max',900,'Value',50,...
        'Units', 'Normalized',...
        'Callback', @print_val,...
        'SliderStep', [1/18 0.05]);
%}

slider_value = get(hObject,'Value');
newval = slider_value;                         %get value from the slider
newval = round(newval,-1);                         %round off this value
set(hObject, 'Value', newval);                  %set slider position to rounded off value
disp(['Slider moved to ' num2str(newval)]);
matlabImage = imread('image.png');
image(matlabImage)
axis off
axis image

if slider_value>=0 & slider_value<=20
    matlabImage = imread('sub0.png');
    image(matlabImage)
    axis off
    axis image
    
elseif slider_value>20 &slider_value<=70
    matlabImage = imread('sub50.png');
    image(matlabImage)
    axis off
    axis image

elseif slider_value>70 &slider_value<=120
    matlabImage = imread('sub100.png');
    image(matlabImage)
    axis off
    axis image
    
elseif slider_value>120 &slider_value<=170
    matlabImage = imread('sub150.png');
    image(matlabImage)
    axis off
    axis image
    
elseif slider_value>170 &slider_value<=220
    matlabImage = imread('sub200.png');
    image(matlabImage)
    axis off
    axis image

elseif slider_value>220 &slider_value<=270
    matlabImage = imread('sub250.png');
    image(matlabImage)
    axis off
    axis image
    
elseif slider_value>270 &slider_value<=320
    matlabImage = imread('sub300.png');
    image(matlabImage)
    axis off
    axis image

elseif slider_value>320 &slider_value<=370
    matlabImage = imread('sub350.png');
    image(matlabImage)
    axis off
    axis image
    
elseif slider_value>370 &slider_value<=420
    matlabImage = imread('sub400.png');
    image(matlabImage)
    axis off
    axis image
    
elseif slider_value>420 &slider_value<=470
    matlabImage = imread('sub450.png');
    image(matlabImage)
    axis off
    axis image
    
elseif slider_value>470 &slider_value<=520
    matlabImage = imread('sub500.png');
    image(matlabImage)
    axis off
    axis image

elseif slider_value>520 &slider_value<=570
    matlabImage = imread('sub550.png');
    image(matlabImage)
    axis off
    axis image

elseif slider_value>570 &slider_value<=620
    matlabImage = imread('sub600.png');
    image(matlabImage)
    axis off
    axis image

elseif slider_value>620 &slider_value<=670
    matlabImage = imread('sub650.png');
    image(matlabImage)
    axis off
    axis image
    
elseif slider_value>670 &slider_value<=720
    matlabImage = imread('sub700.png');
    image(matlabImage)
    axis off
    axis image
    
elseif slider_value>720 &slider_value<=770
    matlabImage = imread('sub750.png');
    image(matlabImage)
    axis off
    axis image

elseif slider_value>770 &slider_value<=820
    matlabImage = imread('sub800.png');
    image(matlabImage)
    axis off
    axis image

elseif slider_value>820 &slider_value<=870
    matlabImage = imread('sub850.png');
    image(matlabImage)
    axis off
    axis image
    
else 
    matlabImage = imread('sub900.png');
    image(matlabImage)
    axis off
    axis image
end


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
%%



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function enter_1_Callback(hObject, eventdata, handles)
% hObject    handle to enter_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enter_1 as text
%        str2double(get(hObject,'String')) returns contents of enter_1 as a double


% --- Executes during object creation, after setting all properties.
function enter_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enter_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Run_button.
function Run_button_Callback(hObject, eventdata, handles)
% hObject    handle to Run_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %x=str2double(get(handles.

%display the value pointed by slider
    


% --- Executes on button press in push_1.
function push_1_Callback(hObject, eventdata, handles)
% hObject    handle to push_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%axes(axisHandle)
