# ATQAnopheles
Code for Mathematical Model in ‘Exposing Anopheles mosquitoes to antimalarials blocks Plasmodium parasites transmission’ by Paton et al. Data aggregation was performed in R. All Simulations were performed in Matlab 2016a.


Data extraction:


2015 Africa 1km Population dataset was downloaded from WorldPop in tif format here: http://www.worldpop.org.uk/data/summary/?doi=10.5258/SOTON/WP00004

PfPR 2-10 dataset was downloaded from the Malaria Atlas Project Explorer page: 
https://map.ox.ac.uk/explorer/#/
This can be accessed under: Surfaces > Malaria Risk > Endemicity > Plasmodium faciparum PfPR 2-10
We used the 2015 data: 2015_Nature_Africa_PR.2015.tif

ITN coverage dataset was downloaded from the Malaria Atlas Project Explorer page: 
https://map.ox.ac.uk/explorer/#/
This can be accessed under: Surfaces > Malaria Risk > Intervention > ITN coverage
We used the 2015 data: 2015_Nature_Africa_ITN.2015.tif

IR data on Pyrethroid resistance in Anopheles were given on request from IR mapper: http://www.irmapper.com/ and saved as IR_points_anopheles_pyrethroids.csv 


Code Files:


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


SpatialLayers.R
Opens and aggregates data on parasite rate in 2-10 year olds, insecticide-treated bed net coverage, and population. Extracts data in 5km-by-5km grid squares where insecticide resistance has been tested. Requires 2015_Nature_Africa_PR.2015.tif, 2015_Nature_Africa_ITN.2015.tif, AFR_PPP_2015_adj_v2.tif, and IR_points_anopheles_pyrethroids.csv.
