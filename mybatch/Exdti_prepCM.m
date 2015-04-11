function prepCM = Exdti_prepCM

input1=cfg_files;  %choose the mat files
input1.name = 'choose the files';
input1.tag = 'filenames';
input1.help = {'choose the files generated from ExploreDTI','these files should be the network mat files'};

input2 = cfg_entry;
input2.name = 'the number of the field of the file names';
input2.tag = 'nof';
input2.strtype = 'i';
input2.num = [1 1];
input2.help = {'you should specify the number of the filed'};

input3 = cfg_entry;
input3.name = 'the field seperated symbol';
input3.tag = 'symbol';
input3.strtype = 's';
input3.num = [1 1];
input3.help = {'for subj_FA.mat, seperated symbol is _'};

input4 = cfg_entry;
input4.name = 'prefix';
input4.tag = 'prefix';
input4.strtype = 's';
input4.num = [1 Inf];
input4.help = {'this define the output files prefixed tag'};

prepCM = cfg_exbranch;
prepCM.name = 'prep_part';
prepCM.tag = 'prepCM';
prepCM.val = {input1 input2 input3 input4};
prepCM.prog = @Exdti_prepCM_run;
prepCM.vout = @Exdti_prepCM_vout;

function vout = Exdti_prepCM_vout(job)

vout = cfg_dep;
vout.sname = 'prepCM : files';
vout.src_output = substruct('()',{1,':'});





