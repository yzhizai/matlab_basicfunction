function out = cfg_txt2mat_run(job)

filenames = job.input_file;

for aa = 1:numel(filenames)
    CM = load(filenames{aa});
    matfilenames = strrep(filenames{aa},'.txt','.mat');
    save(matfilenames,'CM');
end
out = filenames;