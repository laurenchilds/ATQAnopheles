%% RunATQ70.m
%% Required functions:
% ATQ.m
% ATQParameters.m
% brewermap.m (version 3.0.0.2) (c) 2014 Stephen Cobeldick

%%
clear all
close all
%% COMPUTATION FOR EXTENDED DATA FIGURE 4B

p = ATQParameters();
p.cov_vec = 0:.05:1;
IR_vec = 0:.05:1;

WithATQ = NaN(length(IR_vec),length(p.cov_vec));
WithoutATQ = NaN(length(IR_vec),length(p.cov_vec));

p.bites = 152/p.K; 
disp(p.bites)

for iterate = 1:length(IR_vec)
    
    p.insect = IR_vec(iterate); 
    disp(p.insect)
    
    p.hs = 1;
    [IHout,cov_vec] = ATQ(p);
    WithATQ(iterate,:) = (IHout(1)-IHout)/IHout(1);
       
    p.hs = 0;
    [IHout,cov_vec] = ATQ(p);
    WithoutATQ(iterate,:) = (IHout(1)-IHout)/IHout(1);
end

%% 70% PREVALENCE - EXTENDED DATA FIGURE 4B LEFT

figure()
colormap(brewermap([],'YlGnBu'))
imagesc(cov_vec,1-IR_vec,flipud(WithoutATQ))
xlabel('Coverage (%)')
ylabel('Insecticide Resistance (%)')
set(gca,'fontsize',18,'fontweight','bold','xtick',0:.2:1,'xticklabel',0:20:100,'ytick',0:.2:1,'yticklabel',fliplr(0:20:100))
axis square
title('Insecticide Only')

%% 70% PREVALENCE - EXTENDED DATA FIGURE 4B RIGHT

figure()
colormap(brewermap([],'YlGnBu'))
imagesc(cov_vec,1-IR_vec,flipud(WithATQ))
xlabel('Coverage (%)')
ylabel('Insecticide Resistance (%)')
set(gca,'fontsize',18,'fontweight','bold','xtick',0:.2:1,'xticklabel',0:20:100,'ytick',0:.2:1,'yticklabel',fliplr(0:20:100))
c= colorbar;
c.Label.String = 'Effectiveness (%)';
c.Ticks = 0:.1:1;
c.TickLabels = 0:10:100;
c.FontSize  = 18;
title({'Insecticide +';'ATQ-Like Compound'})
axis square