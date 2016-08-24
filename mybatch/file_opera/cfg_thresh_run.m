function out = cfg_thresh_run(job)

fidnames = fieldnames(job.mymenu);
filenames = job.input_file;


out = cell(size(filenames));
switch fidnames{:}
    case 'branch1'
        mask_file = job.mymenu.branch1.mask;
        mymask = load(mask_file{1});
        if isfield(mymask,'mask')
             S = substruct('.','mask');
             mask = subsref(mymask,S);
        else
            error('the mat files should have the ''mask'' fields');
        end

        for aa = 1:numel(filenames)
            [path, tit, ext] = fileparts(filenames{aa});
            CM = load(filenames{aa});
            S1 = substruct('.','CM');
            CM = subsref(CM,S1).*mask;
            fname = fullfile(path,['m' tit ext]);
            save(fname,'CM')
            out{aa} = fname;
        end
    case 'branch2'
        thresh_type = job.mymenu.branch2.thresh_type;
        thresh_val = job.mymenu.branch2.thresh_val;
        for aa = 1:numel(filenames)
            [path tit ext] = fileparts(filenames{aa});
            CM = load(filenames{aa});
            S1 = substruct('.','CM');
            CM = subsref(CM,S1);
            switch thresh_type
                case 'relative'
                    CM = threshold_proportional(CM,thresh_val);
                case 'absolute'
                    CM = threshold_absolute(CM,thresh_val);
                otherwise
                        error('You should input right format for "relative" and "absolute"');
            end
            fname = fullfile(path,['m' tit ext]);
            save(fname,CM)
            out{aa} = fname;
        end
end



    