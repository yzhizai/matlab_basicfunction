function gunzip_batch
% used to unzip .gz files.
%
%Shaofeng Duan
%Institute of High Energy Physics
%2016-10-27
gzfiles = cellstr(spm_select(Inf, 'gz'));

for aa = 1:numel(gzfiles)
    [pat, ~, ~] = fileparts(gzfiles{aa});
    gunzip(gzfiles{aa}, pat);
end
