%ctrl_file to get the files to a folder
%prepCM to deal with the files in the folder to a 'prep' folder
%get into the 'prep' folder to excute the sign_test
clc;
clear all
old_path = cd;
new_path = uigetdir();
cd(new_path);
struct_1 = dir('*.mat');
conn_1 = zeros(90,90,length(struct_1));
for aa = 1:length(struct_1)
    sig_conn = load(struct_1(aa).name);
     conn_1(:,:,aa) = sig_conn.CM;
end
sig_mat = zeros(90);
for bb = 1:90
    for cc = 1:90
        x = conn_1(bb,cc,:);
        sig_mat(bb,cc) = signtest(x(:));
    end
end

sig_mat = reshape(sig_mat,90,90);
[fname pname] = uiputfile('*.mat','save file');
save(fullfile(pname,fname),'sig_mat');
cd(old_path)