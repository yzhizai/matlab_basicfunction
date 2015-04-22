function out = cfg_namelist_run(job)

filenames = job.input_file;
[path,~,~] = fileparts(filenames{1});
fid = fopen(fullfile(path,'namelist.txt'),'w+');
for aa = 1:numel(filenames)
    [~,tit,~] = fileparts(filenames{aa});
    fprintf(fid,'%s \r\n',tit);
end
fclose(fid);
out = 1;