function [] = size2cost(snr_1,snr_2)
% This function is to get the optimal network cost ,which based on signal to noise
% matrix. 
%Usage:[] = size2cost(snr_1,snr_2);
%snr_1 & snr_2 is different groups' snr matrices. so the first step is to
%get them.
snr_1(isnan(snr_1)) = 0;
snr_2(isnan(snr_2)) = 0;


figure
hold on
y_aa = [];
y_bb = [];
for aa = 0.5:-0.01:0.1
   formula = sprintf('threshold_proportional(snr_1,%i)',aa);
   thr_cm = eval(formula);

   [coms comp_sizes] = get_components(thr_cm);
   y = max(comp_sizes);
   y_aa = [y_aa;y];
end

for bb = 0.5:-0.01:0.1
   formula = sprintf('threshold_proportional(snr_2,%i)',bb);
   thr_cm = eval(formula);

   [coms comp_sizes] = get_components(thr_cm);
   y = max(comp_sizes);
   y_bb = [y_bb;y]
end
plot(0.5:-0.01:0.1,y_aa,'ko-','MarkerSize',10,'MarkerFaceColor',[1 0 0],'LineWidth',2)
plot(0.5:-0.01:0.1,y_bb,'k^-','MarkerSize',10,'MarkerFaceColor',[0 0 1],'LineWidth',2)
lin_x = [0.1,0.3,0.3];
lin_y = [90 90 75];
line('XData',lin_x,'YData',lin_y,'LineStyle','-.','LineWidth',2,'Color',[0 1 0])
% text(0.27,91,'X : 0.26,Y : 90')
legend('Control','Occult')
xlabel('Network Cost')
ylabel('Size of Largest Component')
axis([0.1 0.4 75 95])