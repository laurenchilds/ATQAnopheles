%% RunATQIRmapREVISED.m
%% Required functions:
% ATQ.m
% ATQParameters.m
% FindBitingRatingIRMap

%%
function [WithoutATQ,WithATQ] = RunATQIRmap

[bite_out,param_out,lat,long,PfPR,cellid,cells] = FindBitingRateIRMap;

p = ATQParameters();

WithATQ = NaN(597,1);
WithoutATQ = NaN(597,1);
tic
for id = 1:length(cellid)
     
p.cov_vec = param_out(id,3);
IR = param_out(id,1);
p.insect = IR/100; 
p.bites = mean(bite_out(id,:));

if p.bites ==0
    WithATQ(id) = PfPR(id);
    WithoutATQ(id) = PfPR(id);
else
p.hs = 1;
[IHout,cov_vec] = ATQ(p);
WithATQ(id) = IHout(1);

p.hs = 0;
[IHout,cov_vec] = ATQ(p);
WithoutATQ(id) = IHout(1);
end
end
toc

%% Save data

for j1 = 1:length(cellid)
    currentid = find(cellid(j1)==cells);
    id = currentid(1);
    loc(j1,:) = [lat(id) long(id)];
end

WestAfrica = find(loc(:,2)<18 & loc(:,1)>0);
EastAfrica = find(loc(:,2)>25);

WestAfricaData = [loc(WestAfrica,:) param_out(WestAfrica,2) WithoutATQ(WestAfrica) WithATQ(WestAfrica)];
EastAfricaData = [loc(EastAfrica,:) param_out(EastAfrica,2) WithoutATQ(EastAfrica) WithATQ(EastAfrica)];
AllAfricaData = [loc(:,:) param_out(:,2) WithoutATQ(:) WithATQ(:)];

csvwrite('WestAfrica.csv',WestAfricaData)
csvwrite('EastAfrica.csv',EastAfricaData)
csvwrite('AllAfrica.csv',AllAfricaData)

