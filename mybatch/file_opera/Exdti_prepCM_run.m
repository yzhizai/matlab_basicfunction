function out = Exdti_prepCM_run(job)

filenames = job.filenames;
para = job.para;
nof = para.nof;
symbol = para.symbol;
prefix = para.prefix;

[path,~,ext] = fileparts(filenames{1});
fid = fopen(fullfile(path,'namelist.txt'),'w+');
out = cell(1,numel(filenames));
for aa = 1:numel(filenames)
    [~,tit,~] = fileparts(filenames{aa});
    titcell = textscan(tit,'%s',nof,'delimiter',symbol);
    tit_temp = titcell{1};
    fname = fullfile(path,[prefix '_' tit_temp{1} ext]);
    
    fprintf(fid,[prefix '_' tit_temp{1} '\r\n']);
    
    myCM = load(filenames{aa});
    CM = myCM.CM;
    CM(isnan(CM)) = 0;
    CM = triu(CM,1) + triu(CM,1)';
    
    save(fname,'CM')
    out{aa} = fname;
end
fclose(fid);