close all

x = [1,5];

y = [1.2 1.3;1.5 1];

bar(x,y,0.8,'hist')
axis([-1 7 0 2])
set(gca,'xticklabel',{'control','patient'})
hold on
X = [0.4 1.6;4.4 5.6];
E = [0.2 0.2; 0.3 0.3];

errorbar(X,y,E,'k*','Linewidth',2)

xdata = [0.4 0.4 1.6 1.6];
ydata = [1.5 1.8 1.8 1.6];

line(xdata,ydata,'color',[0 0 0],'Linewidth',2);

text(1,1.85,'*','FontSize',16,'FontWeight','bold')