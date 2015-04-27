function txt2mat = cfg_txt2mat

input_file = cfg_files;
input_file.name = 'choose the files';
input_file.tag = 'input_file';
input_file.help = {'choose the files want to convert from mat type to txt type.'};

txt2mat = cfg_exbranch;
txt2mat.name = 'txt_2_mat';
txt2mat.tag = 'cfg_txt2mat';
txt2mat.val = {input_file};
txt2mat.prog = @cfg_txt2mat_run;
txt2mat.vout = @cfg_txt2mat_vout;
txt2mat.help = {'convert txt files to mat files'};

function vout = cfg_txt2mat_vout(job)
vout = cfg_dep;
vout.sname = 'txt2mat: txtfiles';
vou.src_output = substruct('()',{':'});