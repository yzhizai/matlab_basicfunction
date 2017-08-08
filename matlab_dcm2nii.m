function matlab_dcm2nii

mricronDir = spm_select(1, 'dir', 'choose the mricon directory');
oldPath = pwd;
cd(mricronDir);
dirNames = cellstr(spm_select(Inf, 'dir', 'Choose the directories'));
h = waitbar(0, 'waiting...');
for aa = 1:numel(dirNames)
    waitbar(aa/numel(dirNames));
    cmdLine = sprintf('dcm2nii.exe -b dcm2nii.ini %s', dirNames{aa});
    system(cmdLine);
end
delete(h);

cd(oldPath);
