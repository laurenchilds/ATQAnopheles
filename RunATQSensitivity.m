%% RunATQSensitivity.m
%% Required functions:
% ATQ.m
% ATQParameters.m
% brewermap.m (version 3.0.0.2) (c) 2014 Stephen Cobeldick

%%
clear all
close all
%% COMPUTATION FOR EXTENDED DATA FIGURE 3

bite_vec = [21 32 46 67 98 152 266]; % bites vector gives prevalence of 20,30,40,50,60,70,80%

p = ATQParameters();
IR_vec = 0:.2:1;

PrevINS = NaN(length(bite_vec),length(IR_vec));
PrevINSATQ = NaN(length(bite_vec),length(IR_vec));
covcounter = 1;
for coverage = .2:.2:.8
    p.cov_vec = coverage;

for iterate = 1:length(bite_vec)
    for iterate2 = 1:length(IR_vec)
        p.bites = bite_vec(iterate)/p.K;
        
        p.insect = 1-IR_vec(iterate2);
        p.hs = 0; % without ATQ
        [IHout,cov_vec] = ATQ(p);
        PrevINS(iterate,iterate2) = IHout(1);    
        
        p.hs = 1; % with ATQ
        [IHout,cov_vec] = ATQ(p);
        PrevINSATQ(iterate,iterate2) = IHout(1);

    end
end

%% EXTENDED DATA FIGURE 3

figure(1)
colormap(brewermap([],'RdYlGn'))

subplot(2,2,covcounter)
enhancedeff = fliplr((PrevINS-PrevINSATQ)./repmat(PrevINS(:,end),1,length(IR_vec)));
bar(enhancedeff)
startprev = {'20','30','40','50','60','70','80'};
set(gca,'fontsize',14,'xticklabel',startprev)
xlabel('% prevalence without intervention')
ylabel('Enhanced effectiveness of INS + ATQ')
IRs = {'100 % IR','80 % IR','60 % IR','40 % IR','20 % IR','0 % IR'};
l = legend(IRs);
set(l,'box','off','location','northeast','fontsize',10)
title(strcat(sprintf('Coverage of %d',p.cov_vec*100),' %'))
covcounter = covcounter +1;
ylim([0 1])
csvwrite(strcat('Sensitivity_',int2str(covcounter),'.csv'),enhancedeff)
end

