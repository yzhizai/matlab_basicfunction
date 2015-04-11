function mat2txt = cfg_mat2txt

input_file = cfg_files;
input_file.name = 'choose the files';
input_file.tag = 'input_file';
input_file.help = {'choose the files want to convert from mat type to txt type.'};

mat2txt = cfg_exbranch;
mat2txt.name = 'convert_part';
mat2txt.tag = 'cfg_mat2txt';
mat2txt.val = {input_file};
mat2txt.prog = @cfg_mat2txt_run;
mat2txt.vout = @cfg_mat2txt_vout;
mat2txt.help = {'convert mat files to txt files'};

function vout = cfg_mat2txt_vout(job)
vout = cfg_dep;
vout.sname = 'mat2txt: matfiles';
vou.src_output = substruct('()',{1,':'});

