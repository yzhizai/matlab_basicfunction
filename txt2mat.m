function 
% this function is used to change the text to the CM.mat filetype .
% you just need to indentify the dir for the program.
%Usage: [] = txt2mat()
pname = uigetdir();
old_path = pwd;
cd(pname)
display(['current working directory is :' pname]);
if exist('matfiles','dir')
    rmdir('matfiles','s')
end
mkdir('matfiles');
mylist =dir('*.txt');

h_wait = waitbar(0,'please wait ...');
for aa = 1:numel(mylist)
    tit_ext = strrep(mylist(aa).name,'.txt','.mat');
    fname = fullfile(pname,'matfiles',tit_ext);
    
    CM = load(mylist(aa).name);
    save(fname,'CM');
    waitbar(aa/numel(mylist));
end
close(h_wait);
cd(old_path)

display(['current working directory is :' old_path]);