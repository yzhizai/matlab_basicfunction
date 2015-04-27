function out = cfg_txt2mat_run(job)

filenames = job.input_file;
out = cell(size(filenames));
for aa = 1:numel(filenames)
    CM = load(filenames{aa});
    matfilenames = strrep(filenames{aa},'.txt','.mat');
    out{aa} = matfilenames;
    save(matfilenames,'CM');
end