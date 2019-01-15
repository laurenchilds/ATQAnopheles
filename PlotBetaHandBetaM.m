%% PlotBetaHandBetaM.m
%% Required functions:
% ATQParameters.m

%%
clear all
close all
%% EXTENDED DATA FIGURE 2Ci
p = ATQParameters;
f = 0:5e4;
p.b = 0.55;

p.bites = 55/p.K;
betaHmed = 1 - (1-p.b).^(p.bites*f);

figure()
plot(f,betaHmed,'linewidth',2)
set(gca,'fontsize',18,'fontweight','bold')
xlabel('Infectious feeders, f')
ylabel('\beta_H')


%% EXTENDED DATA FIGURE 2Cii

IH = 0:.01:1;
p.k1 = 0.02;
p.k2 = 0.2;

betaM = p.k2 * (1-p.k1./(p.k2*IH+p.k1));

figure()
plot(IH,betaM,'linewidth',2)
set(gca,'fontsize',18,'fontweight','bold')
xlabel('Proportion of humans infected, I_H')
ylabel('\beta_M')