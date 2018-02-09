function varargout = Sudoku1(varargin)
% SUDOKU1 MATLAB code for Sudoku1.fig
%      SUDOKU1, by itself, creates a new SUDOKU1 or raises the existing
%      singleton*.
%
%      H = SUDOKU1 returns the handle to a new SUDOKU1 or the handle to
%      the existing singleton*.
%
%      SUDOKU1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUDOKU1.M with the given input arguments.
%
%      SUDOKU1('Property','Value',...) creates a new SUDOKU1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sudoku1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sudoku1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sudoku1

% Last Modified by GUIDE v2.5 25-Jun-2015 12:52:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sudoku1_OpeningFcn, ...
                   'gui_OutputFcn',  @Sudoku1_OutputFcn, ...
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


% --- Executes just before Sudoku1 is made visible.
function Sudoku1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sudoku1 (see VARARGIN)

% Choose default command line output for Sudoku1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sudoku1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.axes1,'Visible','off');
set(handles.solve,'Enable','off');
set(handles.modify,'Enable','off');


% --- Outputs from this function are returned to the command line.
function varargout = Sudoku1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in scan.
function scan_Callback(hObject, eventdata, handles)
% hObject    handle to scan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S;
global I;
W = webcam;

set(handles.scan,'Enable','off');

cd('../Funcs');
S = Sudoku(W);
I=pintar_sudoku(S);
cd('../GUIDE');

set(handles.solve,'Enable','on');
set(handles.modify,'Enable','on');
set(handles.scan,'Enable','off');


% --- Executes on button press in solve.
function solve_Callback(hObject, eventdata, handles)
% hObject    handle to solve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S;
set(handles.solve,'Enable','off');
set(handles.modify,'Enable','off');

cd('../Funcs');
imshow(pintar_sudoku(solucion(S)));
cd('../GUIDE');

set(handles.scan,'Enable','on');


% --- Executes on button press in modify.
function modify_Callback(hObject, eventdata, handles)
% hObject    handle to modify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S;
global I;

cd('../Funcs');
S=modificar(S,str2num(get(handles.text,'String')),I);
I=pintar_sudoku(S);
imshow(I);
cd('../GUIDE');



function text_Callback(hObject, eventdata, handles)
% hObject    handle to text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text as text
%        str2double(get(hObject,'String')) returns contents of text as a double


% --- Executes during object creation, after setting all properties.
function text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
