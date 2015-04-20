function out = cfg_weight_matrix_run(job)

txt_files = job.input_fn;
vs_files = job.input_vs; %volume size
%both should have the same size
out = cell(numel(txt_files),1);
for aa = 1:numel(txt_files)
    [path tit ext] = fileparts(txt_files{aa});
    CM = load(txt_files{aa});
    vs = load(vs_files{aa});
    vs_1 = repmat(vs,[1,size(vs,1)]);
    vs_mat = (vs_1 + vs_1')/2;
    CM = CM./vs_mat;
    fname = fullfile(path,['w' tit ext]);
    dlmwrite(fname,CM);
    out{aa} = fname;
end
    
