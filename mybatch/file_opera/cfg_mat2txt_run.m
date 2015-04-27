function out = cfg_mat2txt_run(job)

filenames = job.input_file;
out = cell(size(filenames));
for aa = 1:numel(filenames)
    load(filenames{aa});
    txtfilenames = strrep(filenames{aa},'.mat','.txt');
    out{aa} = txtfilenames;
    dlmwrite(txtfilenames,CM)
end
out = out;