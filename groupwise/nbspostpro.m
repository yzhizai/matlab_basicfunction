function  [] = nbspostpro(subnet)
%This function is used after NBS program used to generate the significant
%node labels & node coordinates & connection matrix.
%Usage:[] = nbspostpro(subnet)
%subnet presents the order of subnet.

global nbs
if ~exist('myconn','dir')
    mkdir myconn
end
adj = full(nbs.NBS.con_mat{subnet} + nbs.NBS.con_mat{subnet}');
adj_stat = nbs.NBS.test_stat;
adj_sum_col = sum(adj,2);
adj_sum_row = sum(adj,1);
adj((adj_sum_col == 0),:) = [];
adj(:,(adj_sum_row == 0)) = [];
adj_stat((adj_sum_col == 0),:) = [];   %obtain stat value for each connection to draw color
adj_stat(:,(adj_sum_row == 0)) = [];

CM = adj;
save('myconn/myconnMat.mat','CM')  %this is the abbre connection matrix
CM = adj_stat;
save('myconn/test_stat.mat','CM')   %this is the abbre test_stat matrix

label_fid1 = fopen('myconn/nbs_label.txt','w+');
coor_fid2 = fopen('myconn/nbs_coordinates.txt','w+');
node_size_fid3 = fopen('myconn/node_size.txt','w+');
fprintf(node_size_fid3,'%d\r\n',sum(adj,2));
fclose(node_size_fid3);
[lin_i lin_j] = find(nbs.NBS.con_mat{subnet});
choosevec = zeros(90,1);
for aa = 1:90
    if ismember(aa,unique([lin_i lin_j]));
        choosevec(aa) = 1;
        fprintf(label_fid1,'%d %s \r\n',1,nbs.NBS.node_label{aa});
    end
end
fclose(label_fid1);
coor = nbs.NBS.node_coor;
coor(choosevec==0,:) = [];
fprintf(coor_fid2,'%3d\t%3d\t%3d\r\n',coor');
fclose(coor_fid2);

%This file is used to output the linked nodes;
% [fname pname] = uigetfile('*.mat','Choose the aal_abbr.mat files...'); 
% load([pname fname])
load abbr_label.mat
[ai,aj] = find(nbs.NBS.con_mat{subnet});
fid = fopen('myconn/lianjie.txt','w+');
ind_upper = find(triu(ones(90),1) == 1);
for aa = 1:numel(ai)
    y = nbs.GLM.y(:,find(ind_upper == ((aj(aa)-1)*90 + ai(aa))))
    num_cell = sum(nbs.GLM.X); %get the control number
    y1 = y(1:num_cell(1));
    y2 = y((num_cell(1) + 1):end);
    i_lab = nbs.NBS.node_label{ai(aa)};
    j_lab = nbs.NBS.node_label{aj(aa)};
    abbr_i_lab = abbr_cell{ai(aa)};
    abbr_j_lab = abbr_cell{aj(aa)};
    fprintf(fid,'%20s <---> %-20s     %10s <---> %s   %f\t%f\t%f\t%f\r\n',i_lab,j_lab,abbr_i_lab(1:end -2),abbr_j_lab(1:end - 2),mean(y1),std(y1),mean(y2),std(y2));
%     str_disp = sprintf('%20s <---> %-20s     %10s <---> %s \r\n',i_lab,j_lab,abbr_i_lab(1:end -2),abbr_j_lab(1:end - 2));
end
fclose(fid);

