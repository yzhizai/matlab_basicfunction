function namelist = cfg_namelist

input_file = cfg_files;
input_file.name = 'choose the files';
input_file.tag = 'input_file';
input_file.help = {'choose the files want to generate the filenames to namelist.'};

namelist = cfg_exbranch;
namelist.name = 'namelist';
namelist.tag = 'cfg_namelist';
namelist.val = {input_file};
namelist.prog = @cfg_namelist_run;
namelist.help = {'convert txt files to mat files'};
