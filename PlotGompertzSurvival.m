%% PlotGompertzSurvival.m

%%
clear all
close all
%% COMPUTATION FOR EXTENDED DATA FIGURE 2B

lambda = 0.0055;
b = 0.1868;
x = 0:37;
cdf = exp(lambda/b*(1-exp(b*x)));
morta = (cdf(1:end-1)-cdf(2:end))./cdf(1:end-1);

%% EXTENDED DATA FIGURE 2B

xatq(1) = 1;
for j=1:37
    xatq(j+1) = xatq(j)*(1-morta(j));
end

figure()
plot(0:37,xatq,'k','linewidth',2)
set(gca,'fontsize',18,'fontweight','bold')
xlabel('Age (days)')
ylabel('Proportion surviving')
xlim([0 35])