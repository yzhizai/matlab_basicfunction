function [] =  coord_extr(index_1)
%This is used to extract the brain regions coordinates.
%Usage: [] =  coord_extr(index_1)
%index_1 : brain regions's order
% this will output a file called 'coord_extr.txt'
mat_1 = load('E:\dsf\Documents\GitHub\Myhub\mlbbf\Label_coordinates.txt');

coord_1 = mat_1(index_1(:),:);

fid1 = fopen('coord_extr.txt','w+');
fprintf(fid1,'%3d\t%3d\t%3d\r\n',coord_1');
fclose(fid1);

