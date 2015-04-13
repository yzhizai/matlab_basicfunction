function cont_out = cfg_pan_contrast_exdti

output_dir = cfg_files;
output_dir.name = 'choose the output directory';
output_dir.tag = 'output_dir';
output_dir.filter = {'dir'};
output_dir.help = {'choose the directory to output the images'};

input1 = cfg_files;
input1.name = 'choose panda matfiles';
input1.tag = 'panda_files';
input1.help = {'choose the panda mat files to contrast with exdit matfiles'};

input2 = cfg_files;
input2.name = 'choose exdti matfiles';
input2.tag = 'exdti_files';
input2.help = {'choose the exdti mat files to contrast with panda matfiles'};

input_all = cfg_branch;
input_all.name = 'choose files';
input_all.tag = 'input_all';
input_all.val = {input1 input2};
input_all.help = {'choose the files as the subitem describes'};


cont_out = cfg_exbranch;
cont_out.name = 'contrast between panda and exdti';
cont_out.tag = 'cont_out';
cont_out.val = {output_dir input_all};
cont_out.prog = @cfg_pan_contrast_exdti_run;
cont_out.help = {'contrast between panda and exdti'};

