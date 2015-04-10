function snr = snr_mat(W_series)
% This function is used to construct the groupwise connectome
%Usage: snr = snr_mat(W_series)
%W_series: includes the W field.
%        .W field: Connect matrix
W_syn = [];
for aa = 1:numel(W_series)
   W_syn(:,:,aa) = W_series(aa).W;
end

W_mean = mean(W_syn,3);
W_std = std(W_syn,0,3);

snr = W_mean./W_std;
snr(isnan(snr)) = 0;