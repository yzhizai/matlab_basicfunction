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

mythresh = cfg_exbranch;
mythresh.name = 'to thresh the connection matrices';
mythresh.tag = 'mythrech';
mythresh.val = {input1 input2};
mythresh.prog = @cfg_thresh_run;
mythresh.vout = @cfg_thresh_vout;
mythresh.help = {'to excute the mask processing'};

function vout = cfg_thresh_vout(job)

vout = cfg_dep;
vout.sname = 'the masked matrices';
vout.src_output = substruct('()',{':'});
