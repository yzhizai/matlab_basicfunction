function out = cfg_signtest_run(job)

filenames1 = job.input_files;
thresh_value = job.input_thresh;

[path,~,ext] = fileparts(filenames1{1});

conn_1 = zeros(90,90,numel(filenames1));
sig_mat = zeros(90);
switch ext
    case '.txt'
        for aa = 1:numel(filenames1)
            sig_conn = load(filenames1{aa});
            conn_1(:,:,aa) = sig_conn;
        end
    case '.mat'
        for aa = 1:numel(filenames1)
            sig_conn = load(filenames1{aa});
            conn_1(:,:,aa) = sig_conn.CM;
        end
end

for bb = 1:90
    for cc = 1:90
        x = conn_1(bb,cc,:);
        sig_mat(bb,cc) = signtest(x(:));
    end
end

save(fullfile(path,'sig_mat.mat'),'sig_mat');

thresh_value = thresh_value*2;  %for one-tailed test
sig_mat_temp = zeros(90);
sig_mat_temp(sig_mat <= thresh_value) = 1;
out = sig_mat_temp;


