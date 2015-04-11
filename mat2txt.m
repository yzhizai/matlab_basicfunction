function [] = mat2txt()
% this function is used to change the CM.mat to the text filetype .
% you just need to indentify the dir for the program.
%Usage: [] = mat2matrix()
pname = uigetdir();
old_path = pwd;
cd(pname)
display(['current working directory is :' pname]);
if exist('txtfiles','dir')
    rmdir('txtfiles','s')
end
mkdir('txtfiles');
mylist =dir('*.mat');
h_wait = waitbar(0,'please wait...');
for aa = 1:numel(mylist)
    tit_ext = strrep(mylist(aa).name,'.mat','.txt');
    fname = fullfile(pname,'txtfiles',tit_ext);
    
    S = load(mylist(aa).name);
    CM = S.CM;
    
    dlmwrite(fname,CM,'delimiter',' ');
    waitbar(aa/numel(mylist));
end
delete(h_wait);
cd(old_path)

display(['current working directory is :' old_path]);