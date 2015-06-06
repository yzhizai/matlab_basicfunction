function mythresh = cfg_thresh

input1 = cfg_files;
input1.name = 'choose the mask';
input1.tag = 'mask';
input1.filter = {'mat'};
input1.help = {'choose the mask files to thresh the connection matrices'};

input2 = cfg_files;
input2.name = 'choose the files to be masked';
input2.tag = 'input_file';
input2.help = {'choose the connection files to mask'};

input3 = cfg_entry;
input3.name = 'thresh method';
input3.tag = 'thresh_type';
input3.strtype = 's';
input3.help = {'choose the bct thresh type','relative or absolute'};

input4 = cfg_entry;
input4.name = 'thresh value';
input4.tag = 'thresh_val';
input4.strtype = 'r';
input4.help = {'a proportion p (0<p<1) of the strongest weights'};

branch1 = cfg_branch;
branch1.name = 'maskimage';
branch1.tag = 'branch1';
branch1.val = {input1};
branch1.help = {'using the mask to thresh the connection matrices'};

branch2  = cfg_branch;
branch2.name = 'thresh_bct';
branch2.tag = 'branch2';
branch2.val = {input3,input4};
branch2.help = {'using the thresh value to mask the connection matrices'};


menu1 = cfg_choice;
menu1.name = 'choose the mask method';
menu1.tag = 'mymenu';
menu1.values = {branch1,branch2};
menu1.help = {'choose the mask method'};

mythresh = cfg_exbranch;
mythresh.name = 'to thresh the connection matrices';
mythresh.tag = 'mythrech';
mythresh.val = {input2 menu1};
mythresh.prog = @cfg_thresh_run;
mythresh.vout = @cfg_thresh_vout;
mythresh.help = {'to excute the mask processing'};

function vout = cfg_thresh_vout(job)

vout = cfg_dep;
vout.sname = 'the masked matrices';
vout.src_output = substruct('()',{':'});
