library(raster)
library(rgdal)
library(sp)
library(dplyr)

PfPR <- setMinMax(raster('2015_Nature_Africa_PfPR.2015.tif'))
ITN <- setMinMax(raster('2015_Nature_Africa_ITN.2015.tif'))
Pop <- setMinMax(raster('AFR_PPP_2015_adj_v2.tif'))

# aggregate and resample Pop to match ITN, PfPR resolution
Pop_lowres <- aggregate(Pop, fact=(res(ITN)[1]/res(Pop)[1]), fun=sum)
Pop_stackable <- resample(Pop_lowres, ITN, method = 'bilinear')
Pop_clean <- mask(Pop_stackable, ITN)

# binned PfPR layer: PfPR=0 labeled "0", PfPR >0-10% labeled "1", 10-20% labeled "2"...
PfPRbin <- reclassify(PfPR, c(0,0.1,1,  0.1,0.2,2, 0.2,0.3,3,  0.3,0.4,4, 0.4,0.5,5, 0.5,0.6,6, 0.6,0.7,7, 0.7,0.8,8, 0.8,0.9,9)) 
Africa_stack <- stack(Pop_clean, ITN, PfPR, PfPRbin)

IR_points <- read.csv("IR_points_anopheles_pyrethroids.csv", header = TRUE, sep = ",")
IR_points <- subset(IR_points, Mosquito_collection_year_end>=2013)
coordinates(IR_points) <- c("Longitude", "Latitude")

# extract raster data at each resistance point
IR_point_data <- data.frame(IR_points, extract(Africa_stack, IR_points, cellnumbers=TRUE))
IR_point_data <- select(IR_point_data, -c(optional))
write.csv(IR_point_data, file = "IR_point_raster_data.csv", row.names=TRUE)