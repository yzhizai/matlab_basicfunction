function [] = ctrl_file(varargin)

% This function is used to move/copy specified files to destinated folder
%
%Usage:[] = ctrl_file(varargin)
% str_ptn = varargin{1};==> '*binary*.mat'
% oper_style = varargin{2}; ==> 'copy' or 'move'

str_ptn = varargin{1};
oper_style = varargin{2};
origin_folder = uigetdir('','Choose a folder to deal the files');
dest_folder = uigetdir('','Choose a destination...');

old_path = cd;
cd(origin_folder)
mylist = dir(str_ptn);
mycell = struct2cell(mylist);
switch lower(oper_style)
    case 'copy'
        for aa = 1:numel(mylist)
            copyfile(mycell{1,aa},dest_folder)
        end
    case 'move'
        for aa = 1:numel(mylist)
            movefile(mycell{1,aa},dest_folder,'f')
        end
end
cd(old_path)
        