function out = cfg_mat2txt_run(job)

filenames = job.input_file;

for aa = 1:numel(filenames)
    load(filenames{aa});
    txtfilenames = strrep(filenames{aa},'.mat','.txt');
    dlmwrite(txtfilenames,CM)
end
out = filenames;