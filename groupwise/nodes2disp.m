%This file is used to output the linked nodes;
% [fname pname] = uigetfile('*.mat','Choose the aal_abbr.mat files...'); 
% load([pname fname])

load abbr_label.mat
global nbs
[ai,aj] = find(nbs.NBS.con_mat{1});
fid = fopen('lianjie.txt','w+');
for aa = 1:numel(ai)
    i_lab = nbs.NBS.node_label{ai(aa)};
    j_lab = nbs.NBS.node_label{aj(aa)};
    abbr_i_lab = abbr_cell{ai(aa)};
    abbr_j_lab = abbr_cell{aj(aa)};
    fprintf(fid,'%20s <---> %-20s     %10s <---> %s \r\n',i_lab,j_lab,abbr_i_lab(1:end -2),abbr_j_lab(1:end - 2));
    str_disp = sprintf('%20s <---> %-20s     %10s <---> %s \r\n',i_lab,j_lab,abbr_i_lab(1:end -2),abbr_j_lab(1:end - 2));
    disp(str_disp)
end
fclose(fid);