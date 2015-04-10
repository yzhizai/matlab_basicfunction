function [] = sign_motified()
global nbs
set1 = nbs.NBS.con_mat{1};
Set1 = full(set1) + full(set1)';
Set1 = ~istrue(Set1);

oldpath = cd;
dirpath2r = uigetdir(' ','Choose the previous txt folder');
dirpath2w = uigetdir(' ','Choose a folder to save present txt files');
cd(dirpath2r)

list1 = dir('*.txt');
for aa = 1:numel(list1)
    fname = list1(aa).name;
    AA = load(fname);
    BB = AA.*Set1;
    fname_full = fullfile(dirpath2w,fname);
    dlmwrite(fname_full,BB,'delimiter',',');
end

cd(oldpath)