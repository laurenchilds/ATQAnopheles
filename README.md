# ATQAnopheles
Code for Mathematical Model in ‘Exposing Anopheles mosquitoes to antimalarials blocks transmission of Plasmodium parasites’ by Paton et al.


ATQ.m
Simulation code for discrete model. Required by RunATQ.m, Run20ATQ.m, Run70ATQ.m, RunATQIRmap.m, RunATQSensitivity.m.


ATQParameters.m
Parameter file for simulation code. Required by RunATQ.m, Run20ATQ.m, Run70ATQ.m, RunATQIRmap.m, RunATQSensitivity.m.


brewermap.m
The complete selection of ColorBrewer colorschemes (RGB colormaps). (c) 2014 Stephen Cobeldick Downloadable from https://github.com/spunt/bspmview/blob/master/supportfiles/brewermap.m Required by RunATQ.m, Run20ATQ.m, Run70ATQ.m, RunATQSensitivity.m.


FindBitingRateIRMap.m
Finds the biting rate used for simulations at various insecticide resistance levels. Required by RunATQIRmap.m. 


ir_point_raster_data.csv
Data on insecticide resistance points including latitude (2nd column), longitude (3rd column), insecticide resistance level (5th column), population (6th column), bed net coverage (7th column), and PfPR in 2-10 year olds (8th column). Required by FindBitingRateIRMap.m.


PlotBetaHandBetaM.m
Calculates and plots the curves for BetaH and BetaM. Code for Extended Data Figure 2C.


PlotGompertzSurvival.m
Calculates and plots the Gompertz survival curve. Code for Extended Data Figure 2B.


RunATQ.m
Calculates the effectiveness of insecticide alone and with ATQ at 45% prevalence varying coverage (x-axis) and insecticide resistance (y-axis). Code for Figure 3A.


RunATQ20.m
Calculates the effectiveness of insecticide alone and with ATQ at 20% prevalence varying coverage (x-axis) and insecticide resistance (y-axis). Code for Extended Data Figure 4A.


RunATQ70.m
Calculates the effectiveness of insecticide alone and with ATQ at 70% prevalence varying coverage (x-axis) and insecticide resistance (y-axis). Code for Extended Data Figure 4B.


RunATQIRmap.m
Calculates the effectiveness of insecticide alone and with ATQ at prevalence, insecticide resistance and coverage at points where insecticide resistance has been measured in sub-Saharan Africa. Code for data in Figure 3B. Produces files AllAfrica.csv, EastAfrica.csv and WestAfrica.csv with latitude (1st column), longitude (2nd column), population (3rd column), estimated prevalence with insecticide alone (4th column) and estimated prevalence with insecticide with ATQ (5th column) for plotting of Figure 3B.


RunATQSensitivity.m
Calculates the enhanced effectiveness of insecticide with ATQ relative to insecticide alone while varying prevalence (x-axis), insecticide resistance (color of bars) and coverage (subplots). Code for Extended Data Figure 3.
