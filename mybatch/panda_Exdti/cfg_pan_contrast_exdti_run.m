function out = cfg_pan_contrast_exdti_run(job)

output_dir = job.output_dir;
input_all = job.input_all;
pan_files = input_all.panda_files;
ex_files = input_all.exdti_files;

if numel(pan_files) ~= numel(ex_files)
    error('you should input the same number files for both softwares');
end

for aa = 1:numel(pan_files)
    myCM = load(pan_files{aa});
    cm1 = myCM.CM;
    myCM = load(ex_files{aa});
    cm2 = myCM.CM;
    con_mat = round([cm1,zeros(size(cm1,1),10),cm2]*64);
    [path tit ext] = fileparts(ex_files{aa});
    imgname = fullfile(output_dir{1},[tit '.bmp']);
    imwrite(con_mat,colormap('jet'),imgname,'bmp');
end

out = 1;
    
    
    
