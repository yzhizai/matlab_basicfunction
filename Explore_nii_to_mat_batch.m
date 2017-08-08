% In exploreDTI, many functions can be runned in parallel except for
% transfering the dwis to mat step. This file is used to eliminate this
% drawback.

% After preprcessing in FSL, the subject folder contains 3 neccessary
% files, data.nii, orient.bval, orient.bvec. The next stage to process this
% folder includes: converting *.bval and *.bvec to B-matrix, converting nii
% to mat file.

function Explore_nii_to_mat_batch
% Locating the folder
dirNames = cellstr(spm_select(Inf, 'dir', 'choose subject folders'));
Mask_par.tune_NDWI = 0;
Mask_par.tune_DWI = 0;
Mask_par.mfs = 1;
for aa = 1:numel(dirNames)
    dirName = dirNames{aa};
    write_bmatrix(dirName);
    [~ ,tit, ~] = fileparts(dirName);
    E_DTI_quick_and_dirty_DTI_convert_from_nii_txt_to_mat('data.nii.gz', ...
        'orient.txt', [tit, '.mat'], Mask_par, 1);
end

function write_bmatrix(dirName)
% Converting *bval and *bvec to bmatrix.
fid1 = fopen(fullfile(dirName, 'orient.bval'));
fid2 = fopen(fullfile(dirName, 'orient.bvec'));
bval = textscan(fid1, '%f');
bvec = textscan(fid2, '%f');

%     reshape to size with 1*N and 3*N
bval = bval{1}';
bvec = reshape(bvec{1}, [], 3)';
b_matrix = bval_bvec_to_matrix(bval, bvec, [2, 1, 3], [-1, 1, 1]);
fid = fopen(fullfile(dirName, 'orient.txt'), 'w+');
for bb = 1:size(b_matrix, 1)
    fprintf(fid, '%12.8f\t%12.8f\t%12.8f\t%12.8f\t%12.8f\t%12.8f\n',b_matrix(bb,:));
end
fclose(fid);
fclose(fid1);
fclose(fid2);
