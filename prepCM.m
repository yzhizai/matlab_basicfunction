function [] = prepCM(nof,delmt,prefix)
%This function is used to process the weighted/unweighted CM from ExploreDTI
%mainly to elimite diagonal elements and NaN elements
%Usage: [] = prepCM(nof,delmt,prefix)
%
%nof: the number of field of original files' name
%delmt: the delimiter used to split the files' name
%prefix: ==> 'CON' or 'PAT'
pname = uigetdir('','Choose a folder to process CM files...');
old_path = pwd;
cd(pname)
display(['current working directory is :' pname]);
if exist('prep','dir')
    rmdir('prep','s')
end
mkdir('prep');

% mystruc = dir('*.mat');
% mycell = struct2cell(mystruc);
% mylist = mycell(1,:);
mylist = dir('*.mat');
fid = fopen('namelist.txt','w+');
for aa = 1:numel(mylist)
    titcell = textscan(mylist(aa).name,'%s',nof,'delimiter',delmt);
    tit_temp = titcell{1};
    fname = fullfile(pname,'prep',[prefix '_' tit_temp{1} '.mat']);
    
    fprintf(fid,[prefix '_' tit_temp{1} '\r\n']);
    
    myCM = load(mylist(aa).name);
    CM = myCM.CM;
    CM(isnan(CM)) = 0;
    CM = triu(CM,1) + triu(CM,1)';
    
    save(fname,'CM')
end
fclose(fid);
cd(old_path)
    
