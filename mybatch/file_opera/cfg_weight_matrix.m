function myweight = cfg_weight_matrix

input1 = cfg_files;
input1.name = 'choose the fiber number txt files';
input1.tag = 'input_fn';
input1.help = {'choose the fiber number txt files'};

input2 = cfg_files;
input2.name = 'choose the subject roi size files';
input2.tag = 'input_vs';  %volume size
input2.help = {'choose the subject volume size files'};

myweight = cfg_exbranch;
myweight.name = 'generate the weighted matrix';
myweight.tag = 'weight_fn'; %weight fiber numbers
myweight.val = {input1 input2};
myweight.prog = @cfg_weight_matrix_run;
myweight.vout = @cfg_weight_matrix_vout;
myweight.help = {'generate the weight normized fiber number matrix'};

function vout = cfg_weight_matrix_vout(job)

vout = cfg_dep;
vout.sname = 'weighted matrix';
vout.src_output = substruct('()',{1});