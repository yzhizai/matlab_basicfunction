function flip_4D(filename)
[pat, tit, ext, ~] = spm_fileparts(filename);
V = spm_vol(fullfile(pat, [tit, ext]));
Y = spm_read_vols(V);

Y_flip = flipud(Y);
fname = fullfile(pat, [tit, '_flip', ext]);


N    = cat(1,V.private);
dt = V(1).dt(1);
sf  = V(1).pinfo(1);
off = V(1).pinfo(2);

ni = nifti;
ni.dat = file_array(fname,...
                        [V(1).dim numel(V)],...
                        [dt spm_platform('bigend')],...
                        0,...
                        sf,...
                        off);
ni.mat = N(1).mat;
ni.mat0 = N(1).mat;
ni.descrip = 'flip the data';

create(ni);
for i=1:size(ni.dat,4)
    ni.dat(:,:,:,i) = Y_flip(:, :, :, i);
    spm_get_space([ni.dat.fname ',' num2str(i)], V(i).mat);
end

