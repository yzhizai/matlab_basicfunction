function [] = init_cfg

spm_dir = which('spm');
[path,~,~] = fileparts(spm_dir);
addpath(fullfile(path,'matlabbatch'));
cfg_util('initcfg')
cfg_ui