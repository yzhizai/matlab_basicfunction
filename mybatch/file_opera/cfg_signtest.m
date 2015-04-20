function mysigntest = cfg_signtest

input1 = cfg_files;
input1.name = 'choose the files';
input1.tag = 'input_files';
input1.help = {'choose the files to do signtest'};

input2 = cfg_entry;
input2.name = 'the signtest level';
input2.tag = 'input_thresh';
input2.num = [1 1];
input2.strtype = 'r';
input2.help = {'choose the signtest to thresh the signtest p value'};

mysigntest = cfg_exbranch;
mysigntest.name = 'excute the signtest';
mysigntest.tag = 'signtest';
mysigntest.val = {input1 input2};
mysigntest.prog = @cfg_signtest_run;
mysigntest.vout = @cfg_signtest_vout;
mysigntest.help = {'excute the signtest and thresh the origin matrix'};

function vout = cfg_signtest_vout(job)

vout = cfg_dep;
vout.sname = 'sign_test significant matrix mask';
vout.src_output = substruct('()',{1});

