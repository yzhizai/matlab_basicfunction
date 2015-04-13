function cfg = Exdti_proc_master

prep_part = cfg_repeat;
prep_part.name = 'prep_part';
prep_part.tag = 'prep';
prep_part.values = {Exdti_prepCM};
prep_part.forcestruct = true;
prep_part.help = {'this module is to preprocess mat files'};

convert_part = cfg_repeat;
convert_part.name = 'convert_part';
convert_part.tag = 'convert_part';
convert_part.values = {cfg_mat2txt,cfg_txt2mat};
convert_part.forcestruct = true;
convert_part.help = {'this module is to convert the type of files'};

cfg = cfg_repeat;
cfg.name = 'Exdti process';
cfg.tag = 'Exdti';
cfg.values = {prep_part,convert_part};
cfg.forcestruct = true;
cfg.help = {'the full modules'};