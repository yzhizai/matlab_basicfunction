function out = cfg_thresh_run(job)

mask_file = job.mask;
filenames = job.input_file;

mymask = load(mask_file{1});
if isfield(mymask,'sig_mat_temp')
    S = substruct('.','sig_mat_temp');
    mask = subsref(mymask,S);
else
    error('the mat files should have the ''sig_mat_temp'' fields');
end
out = cell(size(filenames));
for aa = 1:numel(filenames)
    [path tit ext] = fileparts(filenames{aa});
    CM = load(filenames{aa});
    CM = CM.*mask;
    fname = fullfile(path,['m' tit ext]);
    dlmwrite(fname,CM)
    out{aa} = fname;
end

    