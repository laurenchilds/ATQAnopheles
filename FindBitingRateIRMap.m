%% FindBitingRatingIRMap.m
%% Required functions:
% ATQ.m
% ATQParameters.m

%%
function [bite_out,param_out,lat,long,PfPR,cellid,cells] = FindBitingRateIRMap

IRset2 = csvread('ir_point_raster_data.csv',2);
% 2nd column is latitude
% 3rd column is longitude
% 5th column is IR level
% 6th column is population
% 7th column is ITN coverage
% 8th column is PfPR
% 10th column is cellid
lat = IRset2(:,2);
long = IRset2(:,3);
cells = IRset2(:,10);
cellid = unique(IRset2(:,10));
PfPR = IRset2(:,8);
ITN = IRset2(:,7);
IRlevel = IRset2(:,5);
pop = IRset2(:,6);
tic

p = ATQParameters();
p.hs = 0; % without ATQ

bite_out = NaN(length(cellid),2);
param_out = NaN(length(cellid),4);
for j1 = 1:length(cellid)
    currentid = find(cellid(j1)==cells);
    id = currentid(1);
if ITN(id)>-.01 && PfPR(id)>-.01 && mean(IRlevel(currentid))<99.1
    p.cov_vec = ITN(id);
    IR = mean(IRlevel(currentid));
    p.insect = IR/100; 
    bites_vec = [];
    p.bites = 1/p.K;
    Prev1 = [];

    iterate = 0;
    IHout = 0;
    while IHout(1) < PfPR(id)
        iterate = iterate + 1;
        p.bites = p.bites*2;
        bites_vec = [bites_vec p.bites];
        [IHout,cov_vec] = ATQ(p);
        Prev1(iterate,1) = IHout(1);
    end
bite_fine = linspace(bites_vec(end-1),bites_vec(end),50);
Prev2 = NaN(50,1);
Prev2(1) = Prev1(end-1);
Prev2(end) = Prev1(end);
for count = 2:49
    p.bites = bite_fine(count);
    [IHout,cov_vec] = ATQ(p);
    Prev2(count) = IHout(1);
    if IHout(1)>PfPR(id)
        break
    end
end
tmpid = find(Prev2<PfPR(id),1,'last');
bite_out(j1,1:2) = bite_fine(tmpid:tmpid+1);
param_out(j1,1:4) = [mean(IRlevel(currentid)) pop(id) ITN(id) PfPR(id)];
elseif ITN(id)>-.01 && PfPR(id)>-.01
    param_out(j1,1:4) = [mean(IRlevel(currentid)) pop(id) ITN(id) PfPR(id)];
    bite_out(j1,1:2) = 0;
end


end
toc
