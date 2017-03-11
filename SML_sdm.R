###############################
#### SET WORKING DIRECTORY ####
###############################

# Clean everything that was loaded before
rm(list=ls())


#Don't need to rotate this part anymore
###########################################################################################################################
###########################################################################################################################

# My directory
setwd("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado")


###################################
#### INSTALL REQUIRED PACKAGES ####
###################################


#install.packages("biomod2", dep=T)
#install.packages("car", dep=T)
#install.packages("colorRamps", dep=T)
#install.packages("corrplot", dep=T)
#install.packages("dismo", dep=T)
#install.packages("doParallel", dep=T)
#install.packages("dplyr", dep=T)
#install.packages("maps", dep=T)
#install.packages("maptools", dep=T)
#install.packages("plotKML", dep=T)
#install.packages("PresenceAbsence", dep=T)
#install.packages("raster", dep=T)
#install.packages("rgdal", dep=T)
#install.packages("roxygen2", dep=T)
#install.packages("sdm", dep=T)
#install.packages("SDMTools", dep=T)
#install.packages("sqldf", dep=T)
#install.packages("testthat", dep=T)
#install.packages("usdm", dep=T)




#######################################
#### GET AND CROP WORLDCLIM LAYERS ####
#######################################


## Get WorldClim layers
#  ********************

library(raster)

# Present
alt <- raster::getData("worldclim", var = "alt", res = 2.5)
tmin <- raster::getData("worldclim", var = "tmin", res = 2.5)
tmax <- raster::getData("worldclim", var = "tmax", res = 2.5)
tmean <- raster::getData("worldclim", var = "tmean", res = 2.5)
prec <- raster::getData("worldclim", var = "prec", res = 2.5)
bio <- raster::getData("worldclim", var = "bio", res = 2.5)

# 2050

#BC
tmin50_26_BC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "BC", year = 50)
tmax50_26_BC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "BC", year = 50)
prec50_26_BC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "BC", year = 50)
bio50_26_BC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "BC", year = 50)

tmin50_45_BC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "BC", year = 50)
tmax50_45_BC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "BC", year = 50)
prec50_45_BC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "BC", year = 50)
bio50_45_BC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "BC", year = 50)

tmin50_85_BC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "BC", year = 50)
tmax50_85_BC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "BC", year = 50)
prec50_85_BC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "BC", year = 50)
bio50_85_BC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "BC", year = 50)

#CC
tmin50_26_CC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "CC", year = 50)
tmax50_26_CC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "CC", year = 50)
prec50_26_CC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "CC", year = 50)
bio50_26_CC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "CC", year = 50)

tmin50_45_CC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "CC", year = 50)
tmax50_45_CC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "CC", year = 50)
prec50_45_CC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "CC", year = 50)
bio50_45_CC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "CC", year = 50)

tmin50_85_CC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "CC", year = 50)
tmax50_85_CC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "CC", year = 50)
prec50_85_CC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "CC", year = 50)
bio50_85_CC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "CC", year = 50)

#CN
tmin50_26_CN <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "CN", year = 50)
tmax50_26_CN <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "CN", year = 50)
prec50_26_CN <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "CN", year = 50)
bio50_26_CN <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "CN", year = 50)

tmin50_45_CN <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "CN", year = 50)
tmax50_45_CN <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "CN", year = 50)
prec50_45_CN <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "CN", year = 50)
bio50_45_CN <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "CN", year = 50)

tmin50_85_CN <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "CN", year = 50)
tmax50_85_CN <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "CN", year = 50)
prec50_85_CN <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "CN", year = 50)
bio50_85_CN <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "CN", year = 50)

#GS
tmin50_26_GS <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "GS", year = 50)
tmax50_26_GS <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "GS", year = 50)
prec50_26_GS <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "GS", year = 50)
bio50_26_GS <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "GS", year = 50)

tmin50_45_GS <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "GS", year = 50)
tmax50_45_GS <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "GS", year = 50)
prec50_45_GS <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "GS", year = 50)
bio50_45_GS <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "GS", year = 50)

tmin50_85_GS <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "GS", year = 50)
tmax50_85_GS <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "GS", year = 50)
prec50_85_GS <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "GS", year = 50)
bio50_85_GS <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "GS", year = 50)

#HD
tmin50_26_HD <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "HD", year = 50)
tmax50_26_HD <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "HD", year = 50)
prec50_26_HD <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "HD", year = 50)
bio50_26_HD <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "HD", year = 50)

tmin50_45_HD <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "HD", year = 50)
tmax50_45_HD <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "HD", year = 50)
prec50_45_HD <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "HD", year = 50)
bio50_45_HD <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "HD", year = 50)

tmin50_85_HD <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "HD", year = 50)
tmax50_85_HD <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "HD", year = 50)
prec50_85_HD <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "HD", year = 50)
bio50_85_HD <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "HD", year = 50)

#IP
tmin50_26_IP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "IP", year = 50)
tmax50_26_IP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "IP", year = 50)
prec50_26_IP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "IP", year = 50)
bio50_26_IP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "IP", year = 50)

tmin50_45_IP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "IP", year = 50)
tmax50_45_IP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "IP", year = 50)
prec50_45_IP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "IP", year = 50)
bio50_45_IP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "IP", year = 50)

tmin50_85_IP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "IP", year = 50)
tmax50_85_IP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "IP", year = 50)
prec50_85_IP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "IP", year = 50)
bio50_85_IP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "IP", year = 50)

#MI
tmin50_26_MI <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MI", year = 50)
tmax50_26_MI <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MI", year = 50)
prec50_26_MI <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MI", year = 50)
bio50_26_MI <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MI", year = 50)

tmin50_45_MI <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MI", year = 50)
tmax50_45_MI <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MI", year = 50)
prec50_45_MI <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MI", year = 50)
bio50_45_MI <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MI", year = 50)

tmin50_85_MI <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MI", year = 50)
tmax50_85_MI <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MI", year = 50)
prec50_85_MI <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MI", year = 50)
bio50_85_MI <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MI", year = 50)

#MR
tmin50_26_MR <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MR", year = 50)
tmax50_26_MR <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MR", year = 50)
prec50_26_MR <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MR", year = 50)
bio50_26_MR <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MR", year = 50)

tmin50_45_MR <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MR", year = 50)
tmax50_45_MR <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MR", year = 50)
prec50_45_MR <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MR", year = 50)
bio50_45_MR <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MR", year = 50)

tmin50_85_MR <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MR", year = 50)
tmax50_85_MR <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MR", year = 50)
prec50_85_MR <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MR", year = 50)
bio50_85_MR <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MR", year = 50)

#MC
tmin50_26_MC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MC", year = 50)
tmax50_26_MC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MC", year = 50)
prec50_26_MC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MC", year = 50)
bio50_26_MC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MC", year = 50)

tmin50_45_MC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MC", year = 50)
tmax50_45_MC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MC", year = 50)
prec50_45_MC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MC", year = 50)
bio50_45_MC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MC", year = 50)

tmin50_85_MC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MC", year = 50)
tmax50_85_MC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MC", year = 50)
prec50_85_MC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MC", year = 50)
bio50_85_MC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MC", year = 50)

#MP
tmin50_26_MP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MP", year = 50)
tmax50_26_MP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MP", year = 50)
prec50_26_MP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MP", year = 50)
bio50_26_MP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MP", year = 50)

tmin50_45_MP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MP", year = 50)
tmax50_45_MP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MP", year = 50)
prec50_45_MP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MP", year = 50)
bio50_45_MP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MP", year = 50)

tmin50_85_MP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MP", year = 50)
tmax50_85_MP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MP", year = 50)
prec50_85_MP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MP", year = 50)
bio50_85_MP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MP", year = 50)

#MG
tmin50_26_MG <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MG", year = 50)
tmax50_26_MG <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MG", year = 50)
prec50_26_MG <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MG", year = 50)
bio50_26_MG <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MG", year = 50)

tmin50_45_MG <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MG", year = 50)
tmax50_45_MG <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MG", year = 50)
prec50_45_MG <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MG", year = 50)
bio50_45_MG <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MG", year = 50)

tmin50_85_MG <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MG", year = 50)
tmax50_85_MG <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MG", year = 50)
prec50_85_MG <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MG", year = 50)
bio50_85_MG <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MG", year = 50)

#NO
tmin50_26_NO <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "NO", year = 50)
tmax50_26_NO <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "NO", year = 50)
prec50_26_NO <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "NO", year = 50)
bio50_26_NO <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "NO", year = 50)

tmin50_45_NO <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "NO", year = 50)
tmax50_45_NO <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "NO", year = 50)
prec50_45_NO <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "NO", year = 50)
bio50_45_NO <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "NO", year = 50)

tmin50_85_NO <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "NO", year = 50)
tmax50_85_NO <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "NO", year = 50)
prec50_85_NO <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "NO", year = 50)
bio50_85_NO <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "NO", year = 50)

# 2070
#BC
tmin70_26_BC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "BC", year = 70)
tmax70_26_BC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "BC", year = 70)
prec70_26_BC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "BC", year = 70)
bio70_26_BC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "BC", year = 70)

tmin70_45_BC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "BC", year = 70)
tmax70_45_BC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "BC", year = 70)
prec70_45_BC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "BC", year = 70)
bio70_45_BC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "BC", year = 70)

tmin70_85_BC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "BC", year = 70)
tmax70_85_BC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "BC", year = 70)
prec70_85_BC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "BC", year = 70)
bio70_85_BC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "BC", year = 70)

#CC
tmin70_26_CC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "CC", year = 70)
tmax70_26_CC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "CC", year = 70)
prec70_26_CC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "CC", year = 70)
bio70_26_CC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "CC", year = 70)

tmin70_45_CC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "CC", year = 70)
tmax70_45_CC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "CC", year = 70)
prec70_45_CC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "CC", year = 70)
bio70_45_CC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "CC", year = 70)

tmin70_85_CC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "CC", year = 70)
tmax70_85_CC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "CC", year = 70)
prec70_85_CC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "CC", year = 70)
bio70_85_CC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "CC", year = 70)

#CN
tmin70_26_CN <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "CN", year = 70)
tmax70_26_CN <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "CN", year = 70)
prec70_26_CN <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "CN", year = 70)
bio70_26_CN <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "CN", year = 70)

tmin70_45_CN <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "CN", year = 70)
tmax70_45_CN <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "CN", year = 70)
prec70_45_CN <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "CN", year = 70)
bio70_45_CN <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "CN", year = 70)

tmin70_85_CN <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "CN", year = 70)
tmax70_85_CN <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "CN", year = 70)
prec70_85_CN <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "CN", year = 70)
bio70_85_CN <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "CN", year = 70)

#GS
tmin70_26_GS <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "GS", year = 70)
tmax70_26_GS <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "GS", year = 70)
prec70_26_GS <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "GS", year = 70)
bio70_26_GS <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "GS", year = 70)

tmin70_45_GS <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "GS", year = 70)
tmax70_45_GS <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "GS", year = 70)
prec70_45_GS <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "GS", year = 70)
bio70_45_GS <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "GS", year = 70)

tmin70_85_GS <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "GS", year = 70)
tmax70_85_GS <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "GS", year = 70)
prec70_85_GS <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "GS", year = 70)
bio70_85_GS <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "GS", year = 70)

#HD
tmin70_26_HD <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "HD", year = 70)
tmax70_26_HD <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "HD", year = 70)
prec70_26_HD <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "HD", year = 70)
bio70_26_HD <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "HD", year = 70)

tmin70_45_HD <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "HD", year = 70)
tmax70_45_HD <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "HD", year = 70)
prec70_45_HD <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "HD", year = 70)
bio70_45_HD <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "HD", year = 70)

tmin70_85_HD <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "HD", year = 70)
tmax70_85_HD <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "HD", year = 70)
prec70_85_HD <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "HD", year = 70)
bio70_85_HD <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "HD", year = 70)

#IP
tmin70_26_IP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "IP", year = 70)
tmax70_26_IP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "IP", year = 70)
prec70_26_IP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "IP", year = 70)
bio70_26_IP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "IP", year = 70)

tmin70_45_IP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "IP", year = 70)
tmax70_45_IP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "IP", year = 70)
prec70_45_IP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "IP", year = 70)
bio70_45_IP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "IP", year = 70)

tmin70_85_IP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "IP", year = 70)
tmax70_85_IP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "IP", year = 70)
prec70_85_IP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "IP", year = 70)
bio70_85_IP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "IP", year = 70)

#MI
tmin70_26_MI <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MI", year = 70)
tmax70_26_MI <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MI", year = 70)
prec70_26_MI <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MI", year = 70)
bio70_26_MI <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MI", year = 70)

tmin70_45_MI <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MI", year = 70)
tmax70_45_MI <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MI", year = 70)
prec70_45_MI <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MI", year = 70)
bio70_45_MI <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MI", year = 70)

tmin70_85_MI <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MI", year = 70)
tmax70_85_MI <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MI", year = 70)
prec70_85_MI <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MI", year = 70)
bio70_85_MI <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MI", year = 70)

#MR
tmin70_26_MR <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MR", year = 70)
tmax70_26_MR <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MR", year = 70)
prec70_26_MR <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MR", year = 70)
bio70_26_MR <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MR", year = 70)

tmin70_45_MR <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MR", year = 70)
tmax70_45_MR <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MR", year = 70)
prec70_45_MR <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MR", year = 70)
bio70_45_MR <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MR", year = 70)

tmin70_85_MR <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MR", year = 70)
tmax70_85_MR <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MR", year = 70)
prec70_85_MR <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MR", year = 70)
bio70_85_MR <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MR", year = 70)

#MC
tmin70_26_MC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MC", year = 70)
tmax70_26_MC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MC", year = 70)
prec70_26_MC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MC", year = 70)
bio70_26_MC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MC", year = 70)

tmin70_45_MC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MC", year = 70)
tmax70_45_MC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MC", year = 70)
prec70_45_MC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MC", year = 70)
bio70_45_MC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MC", year = 70)

tmin70_85_MC <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MC", year = 70)
tmax70_85_MC <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MC", year = 70)
prec70_85_MC <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MC", year = 70)
bio70_85_MC <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MC", year = 70)

#MP
tmin70_26_MP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MP", year = 70)
tmax70_26_MP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MP", year = 70)
prec70_26_MP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MP", year = 70)
bio70_26_MP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MP", year = 70)

tmin70_45_MP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MP", year = 70)
tmax70_45_MP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MP", year = 70)
prec70_45_MP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MP", year = 70)
bio70_45_MP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MP", year = 70)

tmin70_85_MP <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MP", year = 70)
tmax70_85_MP <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MP", year = 70)
prec70_85_MP <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MP", year = 70)
bio70_85_MP <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MP", year = 70)

#MG
tmin70_26_MG <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MG", year = 70)
tmax70_26_MG <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MG", year = 70)
prec70_26_MG <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MG", year = 70)
bio70_26_MG <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MG", year = 70)

tmin70_45_MG <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MG", year = 70)
tmax70_45_MG <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MG", year = 70)
prec70_45_MG <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MG", year = 70)
bio70_45_MG <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MG", year = 70)

tmin70_85_MG <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MG", year = 70)
tmax70_85_MG <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MG", year = 70)
prec70_85_MG <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MG", year = 70)
bio70_85_MG <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MG", year = 70)

#NO
tmin70_26_NO <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "NO", year = 70)
tmax70_26_NO <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "NO", year = 70)
prec70_26_NO <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "NO", year = 70)
bio70_26_NO <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "NO", year = 70)

tmin70_45_NO <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "NO", year = 70)
tmax70_45_NO <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "NO", year = 70)
prec70_45_NO <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "NO", year = 70)
bio70_45_NO <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "NO", year = 70)

tmin70_85_NO <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "NO", year = 70)
tmax70_85_NO <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "NO", year = 70)
prec70_85_NO <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "NO", year = 70)
bio70_85_NO <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "NO", year = 70)


## Crop WorldClim layers
#  *********************

library(maptools)


#All my date
Bothrops<-read.csv("Bothrops.csv",header=T)
names(Bothrops)<-c("Taxa","lon","lat")
str(Bothrops)

#General Map
library(maps)
plot(Bothrops$lon, Bothrops$lat, xlim=c(-85,-30),ylim=c(-60,15),
     col="red",pch=19, cex= 0.5, xlab="Longitude",ylab="Latitude")  
scalebar(500, xy = c(-40,-50), type = 'bar', divs = 2, below = "km")
title(paste ("Distribuição Bothrops"))
map(add=T)


# Set boundaries
ext <- extent(-85, -30, -60, 15)

# Crop layers (present)
alt.crop <- crop(alt, ext); plot(alt.crop)
tmin.crop <- crop(tmin, ext)
tmax.crop <- crop(tmax, ext)
tmean.crop <- crop(tmean, ext)
prec.crop <- crop(prec, ext)
bio.crop <- crop(bio, ext)

# Crop layers (2050)
#BC
tmin50_26_BC.crop <- crop(tmin50_26_BC, ext)
tmax50_26_BC.crop <- crop(tmax50_26_BC, ext)
prec50_26_BC.crop <- crop(prec50_26_BC, ext)
bio50_26_BC.crop <- crop(bio50_26_BC, ext)

tmin50_45_BC.crop <- crop(tmin50_45_BC, ext)
tmax50_45_BC.crop <- crop(tmax50_45_BC, ext)
prec50_45_BC.crop <- crop(prec50_45_BC, ext)
bio50_45_BC.crop <- crop(bio50_45_BC, ext)

tmin50_85_BC.crop <- crop(tmin50_85_BC, ext)
tmax50_85_BC.crop <- crop(tmax50_85_BC, ext)
prec50_85_BC.crop <- crop(prec50_85_BC, ext)
bio50_85_BC.crop <- crop(bio50_85_BC, ext)

#CC
tmin50_26_CC.crop <- crop(tmin50_26_CC, ext)
tmax50_26_CC.crop <- crop(tmax50_26_CC, ext)
prec50_26_CC.crop <- crop(prec50_26_CC, ext)
bio50_26_CC.crop <- crop(bio50_26_CC, ext)

tmin50_45_CC.crop <- crop(tmin50_45_CC, ext)
tmax50_45_CC.crop <- crop(tmax50_45_CC, ext)
prec50_45_CC.crop <- crop(prec50_45_CC, ext)
bio50_45_CC.crop <- crop(bio50_45_CC, ext)

tmin50_85_CC.crop <- crop(tmin50_85_CC, ext)
tmax50_85_CC.crop <- crop(tmax50_85_CC, ext)
prec50_85_CC.crop <- crop(prec50_85_CC, ext)
bio50_85_CC.crop <- crop(bio50_85_CC, ext)

#CN
tmin50_26_CN.crop <- crop(tmin50_26_CN, ext)
tmax50_26_CN.crop <- crop(tmax50_26_CN, ext)
prec50_26_CN.crop <- crop(prec50_26_CN, ext)
bio50_26_CN.crop <- crop(bio50_26_CN, ext)

tmin50_45_CN.crop <- crop(tmin50_45_CN, ext)
tmax50_45_CN.crop <- crop(tmax50_45_CN, ext)
prec50_45_CN.crop <- crop(prec50_45_CN, ext)
bio50_45_CN.crop <- crop(bio50_45_CN, ext)

tmin50_85_CN.crop <- crop(tmin50_85_CN, ext)
tmax50_85_CN.crop <- crop(tmax50_85_CN, ext)
prec50_85_CN.crop <- crop(prec50_85_CN, ext)
bio50_85_CN.crop <- crop(bio50_85_CN, ext)

#GS
tmin50_26_GS.crop <- crop(tmin50_26_GS, ext)
tmax50_26_GS.crop <- crop(tmax50_26_GS, ext)
prec50_26_GS.crop <- crop(prec50_26_GS, ext)
bio50_26_GS.crop <- crop(bio50_26_GS, ext)

tmin50_45_GS.crop <- crop(tmin50_45_GS, ext)
tmax50_45_GS.crop <- crop(tmax50_45_GS, ext)
prec50_45_GS.crop <- crop(prec50_45_GS, ext)
bio50_45_GS.crop <- crop(bio50_45_GS, ext)

tmin50_85_GS.crop <- crop(tmin50_85_GS, ext)
tmax50_85_GS.crop <- crop(tmax50_85_GS, ext)
prec50_85_GS.crop <- crop(prec50_85_GS, ext)
bio50_85_GS.crop <- crop(bio50_85_GS, ext)

#HD
tmin50_26_HD.crop <- crop(tmin50_26_HD, ext)
tmax50_26_HD.crop <- crop(tmax50_26_HD, ext)
prec50_26_HD.crop <- crop(prec50_26_HD, ext)
bio50_26_HD.crop <- crop(bio50_26_HD, ext)

tmin50_45_HD.crop <- crop(tmin50_45_HD, ext)
tmax50_45_HD.crop <- crop(tmax50_45_HD, ext)
prec50_45_HD.crop <- crop(prec50_45_HD, ext)
bio50_45_HD.crop <- crop(bio50_45_HD, ext)

tmin50_85_HD.crop <- crop(tmin50_85_HD, ext)
tmax50_85_HD.crop <- crop(tmax50_85_HD, ext)
prec50_85_HD.crop <- crop(prec50_85_HD, ext)
bio50_85_HD.crop <- crop(bio50_85_HD, ext)

#IP
tmin50_26_IP.crop <- crop(tmin50_26_IP, ext)
tmax50_26_IP.crop <- crop(tmax50_26_IP, ext)
prec50_26_IP.crop <- crop(prec50_26_IP, ext)
bio50_26_IP.crop <- crop(bio50_26_IP, ext)

tmin50_45_IP.crop <- crop(tmin50_45_IP, ext)
tmax50_45_IP.crop <- crop(tmax50_45_IP, ext)
prec50_45_IP.crop <- crop(prec50_45_IP, ext)
bio50_45_IP.crop <- crop(bio50_45_IP, ext)

tmin50_85_IP.crop <- crop(tmin50_85_IP, ext)
tmax50_85_IP.crop <- crop(tmax50_85_IP, ext)
prec50_85_IP.crop <- crop(prec50_85_IP, ext)
bio50_85_IP.crop <- crop(bio50_85_IP, ext)

#MI
tmin50_26_MI.crop <- crop(tmin50_26_MI, ext)
tmax50_26_MI.crop <- crop(tmax50_26_MI, ext)
prec50_26_MI.crop <- crop(prec50_26_MI, ext)
bio50_26_MI.crop <- crop(bio50_26_MI, ext)

tmin50_45_MI.crop <- crop(tmin50_45_MI, ext)
tmax50_45_MI.crop <- crop(tmax50_45_MI, ext)
prec50_45_MI.crop <- crop(prec50_45_MI, ext)
bio50_45_MI.crop <- crop(bio50_45_MI, ext)

tmin50_85_MI.crop <- crop(tmin50_85_MI, ext)
tmax50_85_MI.crop <- crop(tmax50_85_MI, ext)
prec50_85_MI.crop <- crop(prec50_85_MI, ext)
bio50_85_MI.crop <- crop(bio50_85_MI, ext)

#MR
tmin50_26_MR.crop <- crop(tmin50_26_MR, ext)
tmax50_26_MR.crop <- crop(tmax50_26_MR, ext)
prec50_26_MR.crop <- crop(prec50_26_MR, ext)
bio50_26_MR.crop <- crop(bio50_26_MR, ext)

tmin50_45_MR.crop <- crop(tmin50_45_MR, ext)
tmax50_45_MR.crop <- crop(tmax50_45_MR, ext)
prec50_45_MR.crop <- crop(prec50_45_MR, ext)
bio50_45_MR.crop <- crop(bio50_45_MR, ext)

tmin50_85_MR.crop <- crop(tmin50_85_MR, ext)
tmax50_85_MR.crop <- crop(tmax50_85_MR, ext)
prec50_85_MR.crop <- crop(prec50_85_MR, ext)
bio50_85_MR.crop <- crop(bio50_85_MR, ext)

#MC
tmin50_26_MC.crop <- crop(tmin50_26_MC, ext)
tmax50_26_MC.crop <- crop(tmax50_26_MC, ext)
prec50_26_MC.crop <- crop(prec50_26_MC, ext)
bio50_26_MC.crop <- crop(bio50_26_MC, ext)

tmin50_45_MC.crop <- crop(tmin50_45_MC, ext)
tmax50_45_MC.crop <- crop(tmax50_45_MC, ext)
prec50_45_MC.crop <- crop(prec50_45_MC, ext)
bio50_45_MC.crop <- crop(bio50_45_MC, ext)

tmin50_85_MC.crop <- crop(tmin50_85_MC, ext)
tmax50_85_MC.crop <- crop(tmax50_85_MC, ext)
prec50_85_MC.crop <- crop(prec50_85_MC, ext)
bio50_85_MC.crop <- crop(bio50_85_MC, ext)

#MP
tmin50_26_MP.crop <- crop(tmin50_26_MP, ext)
tmax50_26_MP.crop <- crop(tmax50_26_MP, ext)
prec50_26_MP.crop <- crop(prec50_26_MP, ext)
bio50_26_MP.crop <- crop(bio50_26_MP, ext)

tmin50_45_MP.crop <- crop(tmin50_45_MP, ext)
tmax50_45_MP.crop <- crop(tmax50_45_MP, ext)
prec50_45_MP.crop <- crop(prec50_45_MP, ext)
bio50_45_MP.crop <- crop(bio50_45_MP, ext)

tmin50_85_MP.crop <- crop(tmin50_85_MP, ext)
tmax50_85_MP.crop <- crop(tmax50_85_MP, ext)
prec50_85_MP.crop <- crop(prec50_85_MP, ext)
bio50_85_MP.crop <- crop(bio50_85_MP, ext)

#MG
tmin50_26_MG.crop <- crop(tmin50_26_MG, ext)
tmax50_26_MG.crop <- crop(tmax50_26_MG, ext)
prec50_26_MG.crop <- crop(prec50_26_MG, ext)
bio50_26_MG.crop <- crop(bio50_26_MG, ext)

tmin50_45_MG.crop <- crop(tmin50_45_MG, ext)
tmax50_45_MG.crop <- crop(tmax50_45_MG, ext)
prec50_45_MG.crop <- crop(prec50_45_MG, ext)
bio50_45_MG.crop <- crop(bio50_45_MG, ext)

tmin50_85_MG.crop <- crop(tmin50_85_MG, ext)
tmax50_85_MG.crop <- crop(tmax50_85_MG, ext)
prec50_85_MG.crop <- crop(prec50_85_MG, ext)
bio50_85_MG.crop <- crop(bio50_85_MG, ext)

#NO
tmin50_26_NO.crop <- crop(tmin50_26_NO, ext)
tmax50_26_NO.crop <- crop(tmax50_26_NO, ext)
prec50_26_NO.crop <- crop(prec50_26_NO, ext)
bio50_26_NO.crop <- crop(bio50_26_NO, ext)

tmin50_45_NO.crop <- crop(tmin50_45_NO, ext)
tmax50_45_NO.crop <- crop(tmax50_45_NO, ext)
prec50_45_NO.crop <- crop(prec50_45_NO, ext)
bio50_45_NO.crop <- crop(bio50_45_NO, ext)

tmin50_85_NO.crop <- crop(tmin50_85_NO, ext)
tmax50_85_NO.crop <- crop(tmax50_85_NO, ext)
prec50_85_NO.crop <- crop(prec50_85_NO, ext)
bio50_85_NO.crop <- crop(bio50_85_NO, ext)


# Crop layers (2070)
#BC
tmin70_26_BC.crop <- crop(tmin70_26_BC, ext)
tmax70_26_BC.crop <- crop(tmax70_26_BC, ext)
prec70_26_BC.crop <- crop(prec70_26_BC, ext)
bio70_26_BC.crop <- crop(bio70_26_BC, ext)

tmin70_45_BC.crop <- crop(tmin70_45_BC, ext)
tmax70_45_BC.crop <- crop(tmax70_45_BC, ext)
prec70_45_BC.crop <- crop(prec70_45_BC, ext)
bio70_45_BC.crop <- crop(bio70_45_BC, ext)

tmin70_85_BC.crop <- crop(tmin70_85_BC, ext)
tmax70_85_BC.crop <- crop(tmax70_85_BC, ext)
prec70_85_BC.crop <- crop(prec70_85_BC, ext)
bio70_85_BC.crop <- crop(bio70_85_BC, ext)

#CC
tmin70_26_CC.crop <- crop(tmin70_26_CC, ext)
tmax70_26_CC.crop <- crop(tmax70_26_CC, ext)
prec70_26_CC.crop <- crop(prec70_26_CC, ext)
bio70_26_CC.crop <- crop(bio70_26_CC, ext)

tmin70_45_CC.crop <- crop(tmin70_45_CC, ext)
tmax70_45_CC.crop <- crop(tmax70_45_CC, ext)
prec70_45_CC.crop <- crop(prec70_45_CC, ext)
bio70_45_CC.crop <- crop(bio70_45_CC, ext)

tmin70_85_CC.crop <- crop(tmin70_85_CC, ext)
tmax70_85_CC.crop <- crop(tmax70_85_CC, ext)
prec70_85_CC.crop <- crop(prec70_85_CC, ext)
bio70_85_CC.crop <- crop(bio70_85_CC, ext)

#CN
tmin70_26_CN.crop <- crop(tmin70_26_CN, ext)
tmax70_26_CN.crop <- crop(tmax70_26_CN, ext)
prec70_26_CN.crop <- crop(prec70_26_CN, ext)
bio70_26_CN.crop <- crop(bio70_26_CN, ext)

tmin70_45_CN.crop <- crop(tmin70_45_CN, ext)
tmax70_45_CN.crop <- crop(tmax70_45_CN, ext)
prec70_45_CN.crop <- crop(prec70_45_CN, ext)
bio70_45_CN.crop <- crop(bio70_45_CN, ext)

tmin70_85_CN.crop <- crop(tmin70_85_CN, ext)
tmax70_85_CN.crop <- crop(tmax70_85_CN, ext)
prec70_85_CN.crop <- crop(prec70_85_CN, ext)
bio70_85_CN.crop <- crop(bio70_85_CN, ext)

#GS
tmin70_26_GS.crop <- crop(tmin70_26_GS, ext)
tmax70_26_GS.crop <- crop(tmax70_26_GS, ext)
prec70_26_GS.crop <- crop(prec70_26_GS, ext)
bio70_26_GS.crop <- crop(bio70_26_GS, ext)

tmin70_45_GS.crop <- crop(tmin70_45_GS, ext)
tmax70_45_GS.crop <- crop(tmax70_45_GS, ext)
prec70_45_GS.crop <- crop(prec70_45_GS, ext)
bio70_45_GS.crop <- crop(bio70_45_GS, ext)

tmin70_85_GS.crop <- crop(tmin70_85_GS, ext)
tmax70_85_GS.crop <- crop(tmax70_85_GS, ext)
prec70_85_GS.crop <- crop(prec70_85_GS, ext)
bio70_85_GS.crop <- crop(bio70_85_GS, ext)

#HD
tmin70_26_HD.crop <- crop(tmin70_26_HD, ext)
tmax70_26_HD.crop <- crop(tmax70_26_HD, ext)
prec70_26_HD.crop <- crop(prec70_26_HD, ext)
bio70_26_HD.crop <- crop(bio70_26_HD, ext)

tmin70_45_HD.crop <- crop(tmin70_45_HD, ext)
tmax70_45_HD.crop <- crop(tmax70_45_HD, ext)
prec70_45_HD.crop <- crop(prec70_45_HD, ext)
bio70_45_HD.crop <- crop(bio70_45_HD, ext)

tmin70_85_HD.crop <- crop(tmin70_85_HD, ext)
tmax70_85_HD.crop <- crop(tmax70_85_HD, ext)
prec70_85_HD.crop <- crop(prec70_85_HD, ext)
bio70_85_HD.crop <- crop(bio70_85_HD, ext)

#IP
tmin70_26_IP.crop <- crop(tmin70_26_IP, ext)
tmax70_26_IP.crop <- crop(tmax70_26_IP, ext)
prec70_26_IP.crop <- crop(prec70_26_IP, ext)
bio70_26_IP.crop <- crop(bio70_26_IP, ext)

tmin70_45_IP.crop <- crop(tmin70_45_IP, ext)
tmax70_45_IP.crop <- crop(tmax70_45_IP, ext)
prec70_45_IP.crop <- crop(prec70_45_IP, ext)
bio70_45_IP.crop <- crop(bio70_45_IP, ext)

tmin70_85_IP.crop <- crop(tmin70_85_IP, ext)
tmax70_85_IP.crop <- crop(tmax70_85_IP, ext)
prec70_85_IP.crop <- crop(prec70_85_IP, ext)
bio70_85_IP.crop <- crop(bio70_85_IP, ext)

#MI
tmin70_26_MI.crop <- crop(tmin70_26_MI, ext)
tmax70_26_MI.crop <- crop(tmax70_26_MI, ext)
prec70_26_MI.crop <- crop(prec70_26_MI, ext)
bio70_26_MI.crop <- crop(bio70_26_MI, ext)

tmin70_45_MI.crop <- crop(tmin70_45_MI, ext)
tmax70_45_MI.crop <- crop(tmax70_45_MI, ext)
prec70_45_MI.crop <- crop(prec70_45_MI, ext)
bio70_45_MI.crop <- crop(bio70_45_MI, ext)

tmin70_85_MI.crop <- crop(tmin70_85_MI, ext)
tmax70_85_MI.crop <- crop(tmax70_85_MI, ext)
prec70_85_MI.crop <- crop(prec70_85_MI, ext)
bio70_85_MI.crop <- crop(bio70_85_MI, ext)

#MR
tmin70_26_MR.crop <- crop(tmin70_26_MR, ext)
tmax70_26_MR.crop <- crop(tmax70_26_MR, ext)
prec70_26_MR.crop <- crop(prec70_26_MR, ext)
bio70_26_MR.crop <- crop(bio70_26_MR, ext)

tmin70_45_MR.crop <- crop(tmin70_45_MR, ext)
tmax70_45_MR.crop <- crop(tmax70_45_MR, ext)
prec70_45_MR.crop <- crop(prec70_45_MR, ext)
bio70_45_MR.crop <- crop(bio70_45_MR, ext)

tmin70_85_MR.crop <- crop(tmin70_85_MR, ext)
tmax70_85_MR.crop <- crop(tmax70_85_MR, ext)
prec70_85_MR.crop <- crop(prec70_85_MR, ext)
bio70_85_MR.crop <- crop(bio70_85_MR, ext)

#MC
tmin70_26_MC.crop <- crop(tmin70_26_MC, ext)
tmax70_26_MC.crop <- crop(tmax70_26_MC, ext)
prec70_26_MC.crop <- crop(prec70_26_MC, ext)
bio70_26_MC.crop <- crop(bio70_26_MC, ext)

tmin70_45_MC.crop <- crop(tmin70_45_MC, ext)
tmax70_45_MC.crop <- crop(tmax70_45_MC, ext)
prec70_45_MC.crop <- crop(prec70_45_MC, ext)
bio70_45_MC.crop <- crop(bio70_45_MC, ext)

tmin70_85_MC.crop <- crop(tmin70_85_MC, ext)
tmax70_85_MC.crop <- crop(tmax70_85_MC, ext)
prec70_85_MC.crop <- crop(prec70_85_MC, ext)
bio70_85_MC.crop <- crop(bio70_85_MC, ext)

#MP
tmin70_26_MP.crop <- crop(tmin70_26_MP, ext)
tmax70_26_MP.crop <- crop(tmax70_26_MP, ext)
prec70_26_MP.crop <- crop(prec70_26_MP, ext)
bio70_26_MP.crop <- crop(bio70_26_MP, ext)

tmin70_45_MP.crop <- crop(tmin70_45_MP, ext)
tmax70_45_MP.crop <- crop(tmax70_45_MP, ext)
prec70_45_MP.crop <- crop(prec70_45_MP, ext)
bio70_45_MP.crop <- crop(bio70_45_MP, ext)

tmin70_85_MP.crop <- crop(tmin70_85_MP, ext)
tmax70_85_MP.crop <- crop(tmax70_85_MP, ext)
prec70_85_MP.crop <- crop(prec70_85_MP, ext)
bio70_85_MP.crop <- crop(bio70_85_MP, ext)

#MG
tmin70_26_MG.crop <- crop(tmin70_26_MG, ext)
tmax70_26_MG.crop <- crop(tmax70_26_MG, ext)
prec70_26_MG.crop <- crop(prec70_26_MG, ext)
bio70_26_MG.crop <- crop(bio70_26_MG, ext)

tmin70_45_MG.crop <- crop(tmin70_45_MG, ext)
tmax70_45_MG.crop <- crop(tmax70_45_MG, ext)
prec70_45_MG.crop <- crop(prec70_45_MG, ext)
bio70_45_MG.crop <- crop(bio70_45_MG, ext)

tmin70_85_MG.crop <- crop(tmin70_85_MG, ext)
tmax70_85_MG.crop <- crop(tmax70_85_MG, ext)
prec70_85_MG.crop <- crop(prec70_85_MG, ext)
bio70_85_MG.crop <- crop(bio70_85_MG, ext)

#NO
tmin70_26_NO.crop <- crop(tmin70_26_NO, ext)
tmax70_26_NO.crop <- crop(tmax70_26_NO, ext)
prec70_26_NO.crop <- crop(prec70_26_NO, ext)
bio70_26_NO.crop <- crop(bio70_26_NO, ext)

tmin70_45_NO.crop <- crop(tmin70_45_NO, ext)
tmax70_45_NO.crop <- crop(tmax70_45_NO, ext)
prec70_45_NO.crop <- crop(prec70_45_NO, ext)
bio70_45_NO.crop <- crop(bio70_45_NO, ext)

tmin70_85_NO.crop <- crop(tmin70_85_NO, ext)
tmax70_85_NO.crop <- crop(tmax70_85_NO, ext)
prec70_85_NO.crop <- crop(prec70_85_NO, ext)
bio70_85_NO.crop <- crop(bio70_85_NO, ext)

# Stack environmental layers
environment <- stack(alt.crop, mean(tmin.crop), mean(tmax.crop), mean(tmean.crop), mean(prec.crop), bio.crop)

#2050
#BC
environment50_26_BC <- stack(alt.crop, mean(tmin50_26_BC.crop), mean(tmax50_26_BC.crop), mean(prec50_26_BC.crop), bio50_26_BC.crop)
environment50_45_BC <- stack(alt.crop, mean(tmin50_45_BC.crop), mean(tmax50_45_BC.crop), mean(prec50_45_BC.crop), bio50_45_BC.crop)
environment50_85_BC <- stack(alt.crop, mean(tmin50_85_BC.crop), mean(tmax50_85_BC.crop), mean(prec50_85_BC.crop), bio50_85_BC.crop)

#CC
environment50_26_CC <- stack(alt.crop, mean(tmin50_26_CC.crop), mean(tmax50_26_CC.crop), mean(prec50_26_CC.crop), bio50_26_CC.crop)
environment50_45_CC <- stack(alt.crop, mean(tmin50_45_CC.crop), mean(tmax50_45_CC.crop), mean(prec50_45_CC.crop), bio50_45_CC.crop)
environment50_85_CC <- stack(alt.crop, mean(tmin50_85_CC.crop), mean(tmax50_85_CC.crop), mean(prec50_85_CC.crop), bio50_85_CC.crop)

#CN
environment50_26_CN <- stack(alt.crop, mean(tmin50_26_CN.crop), mean(tmax50_26_CN.crop), mean(prec50_26_CN.crop), bio50_26_CN.crop)
environment50_45_CN <- stack(alt.crop, mean(tmin50_45_CN.crop), mean(tmax50_45_CN.crop), mean(prec50_45_CN.crop), bio50_45_CN.crop)
environment50_85_CN <- stack(alt.crop, mean(tmin50_85_CN.crop), mean(tmax50_85_CN.crop), mean(prec50_85_CN.crop), bio50_85_CN.crop)

#GS
environment50_26_GS <- stack(alt.crop, mean(tmin50_26_GS.crop), mean(tmax50_26_GS.crop), mean(prec50_26_GS.crop), bio50_26_GS.crop)
environment50_45_GS <- stack(alt.crop, mean(tmin50_45_GS.crop), mean(tmax50_45_GS.crop), mean(prec50_45_GS.crop), bio50_45_GS.crop)
environment50_85_GS <- stack(alt.crop, mean(tmin50_85_GS.crop), mean(tmax50_85_GS.crop), mean(prec50_85_GS.crop), bio50_85_GS.crop)

#HD
environment50_26_HD <- stack(alt.crop, mean(tmin50_26_HD.crop), mean(tmax50_26_HD.crop), mean(prec50_26_HD.crop), bio50_26_HD.crop)
environment50_45_HD <- stack(alt.crop, mean(tmin50_45_HD.crop), mean(tmax50_45_HD.crop), mean(prec50_45_HD.crop), bio50_45_HD.crop)
environment50_85_HD <- stack(alt.crop, mean(tmin50_85_HD.crop), mean(tmax50_85_HD.crop), mean(prec50_85_HD.crop), bio50_85_HD.crop)

#IP
environment50_26_IP <- stack(alt.crop, mean(tmin50_26_IP.crop), mean(tmax50_26_IP.crop), mean(prec50_26_IP.crop), bio50_26_IP.crop)
environment50_45_IP <- stack(alt.crop, mean(tmin50_45_IP.crop), mean(tmax50_45_IP.crop), mean(prec50_45_IP.crop), bio50_45_IP.crop)
environment50_85_IP <- stack(alt.crop, mean(tmin50_85_IP.crop), mean(tmax50_85_IP.crop), mean(prec50_85_IP.crop), bio50_85_IP.crop)

#MI
environment50_26_MI <- stack(alt.crop, mean(tmin50_26_MI.crop), mean(tmax50_26_MI.crop), mean(prec50_26_MI.crop), bio50_26_MI.crop)
environment50_45_MI <- stack(alt.crop, mean(tmin50_45_MI.crop), mean(tmax50_45_MI.crop), mean(prec50_45_MI.crop), bio50_45_MI.crop)
environment50_85_MI <- stack(alt.crop, mean(tmin50_85_MI.crop), mean(tmax50_85_MI.crop), mean(prec50_85_MI.crop), bio50_85_MI.crop)

#MR
environment50_26_MR <- stack(alt.crop, mean(tmin50_26_MR.crop), mean(tmax50_26_MR.crop), mean(prec50_26_MR.crop), bio50_26_MR.crop)
environment50_45_MR <- stack(alt.crop, mean(tmin50_45_MR.crop), mean(tmax50_45_MR.crop), mean(prec50_45_MR.crop), bio50_45_MR.crop)
environment50_85_MR <- stack(alt.crop, mean(tmin50_85_MR.crop), mean(tmax50_85_MR.crop), mean(prec50_85_MR.crop), bio50_85_MR.crop)

#MC
environment50_26_MC <- stack(alt.crop, mean(tmin50_26_MC.crop), mean(tmax50_26_MC.crop), mean(prec50_26_MC.crop), bio50_26_MC.crop)
environment50_45_MC <- stack(alt.crop, mean(tmin50_45_MC.crop), mean(tmax50_45_MC.crop), mean(prec50_45_MC.crop), bio50_45_MC.crop)
environment50_85_MC <- stack(alt.crop, mean(tmin50_85_MC.crop), mean(tmax50_85_MC.crop), mean(prec50_85_MC.crop), bio50_85_MC.crop)

#MP
environment50_26_MP <- stack(alt.crop, mean(tmin50_26_MP.crop), mean(tmax50_26_MP.crop), mean(prec50_26_MP.crop), bio50_26_MP.crop)
environment50_45_MP <- stack(alt.crop, mean(tmin50_45_MP.crop), mean(tmax50_45_MP.crop), mean(prec50_45_MP.crop), bio50_45_MP.crop)
environment50_85_MP <- stack(alt.crop, mean(tmin50_85_MP.crop), mean(tmax50_85_MP.crop), mean(prec50_85_MP.crop), bio50_85_MP.crop)

#MG
environment50_26_MG <- stack(alt.crop, mean(tmin50_26_MG.crop), mean(tmax50_26_MG.crop), mean(prec50_26_MG.crop), bio50_26_MG.crop)
environment50_45_MG <- stack(alt.crop, mean(tmin50_45_MG.crop), mean(tmax50_45_MG.crop), mean(prec50_45_MG.crop), bio50_45_MG.crop)
environment50_85_MG <- stack(alt.crop, mean(tmin50_85_MG.crop), mean(tmax50_85_MG.crop), mean(prec50_85_MG.crop), bio50_85_MG.crop)

#NO
environment50_26_NO <- stack(alt.crop, mean(tmin50_26_NO.crop), mean(tmax50_26_NO.crop), mean(prec50_26_NO.crop), bio50_26_NO.crop)
environment50_45_NO <- stack(alt.crop, mean(tmin50_45_NO.crop), mean(tmax50_45_NO.crop), mean(prec50_45_NO.crop), bio50_45_NO.crop)
environment50_85_NO <- stack(alt.crop, mean(tmin50_85_NO.crop), mean(tmax50_85_NO.crop), mean(prec50_85_NO.crop), bio50_85_NO.crop)

#2070
#BC
environment70_26_BC <- stack(alt.crop, mean(tmin70_26_BC.crop), mean(tmax70_26_BC.crop), mean(prec70_26_BC.crop), bio70_26_BC.crop)
environment70_45_BC <- stack(alt.crop, mean(tmin70_45_BC.crop), mean(tmax70_45_BC.crop), mean(prec70_45_BC.crop), bio70_45_BC.crop)
environment70_85_BC <- stack(alt.crop, mean(tmin70_85_BC.crop), mean(tmax70_85_BC.crop), mean(prec70_85_BC.crop), bio70_85_BC.crop)

#CC
environment70_26_CC <- stack(alt.crop, mean(tmin70_26_CC.crop), mean(tmax70_26_CC.crop), mean(prec70_26_CC.crop), bio70_26_CC.crop)
environment70_45_CC <- stack(alt.crop, mean(tmin70_45_CC.crop), mean(tmax70_45_CC.crop), mean(prec70_45_CC.crop), bio70_45_CC.crop)
environment70_85_CC <- stack(alt.crop, mean(tmin70_85_CC.crop), mean(tmax70_85_CC.crop), mean(prec70_85_CC.crop), bio70_85_CC.crop)

#CN
environment70_26_CN <- stack(alt.crop, mean(tmin70_26_CN.crop), mean(tmax70_26_CN.crop), mean(prec70_26_CN.crop), bio70_26_CN.crop)
environment70_45_CN <- stack(alt.crop, mean(tmin70_45_CN.crop), mean(tmax70_45_CN.crop), mean(prec70_45_CN.crop), bio70_45_CN.crop)
environment70_85_CN <- stack(alt.crop, mean(tmin70_85_CN.crop), mean(tmax70_85_CN.crop), mean(prec70_85_CN.crop), bio70_85_CN.crop)

#GS
environment70_26_GS <- stack(alt.crop, mean(tmin70_26_GS.crop), mean(tmax70_26_GS.crop), mean(prec70_26_GS.crop), bio70_26_GS.crop)
environment70_45_GS <- stack(alt.crop, mean(tmin70_45_GS.crop), mean(tmax70_45_GS.crop), mean(prec70_45_GS.crop), bio70_45_GS.crop)
environment70_85_GS <- stack(alt.crop, mean(tmin70_85_GS.crop), mean(tmax70_85_GS.crop), mean(prec70_85_GS.crop), bio70_85_GS.crop)

#HD
environment70_26_HD <- stack(alt.crop, mean(tmin70_26_HD.crop), mean(tmax70_26_HD.crop), mean(prec70_26_HD.crop), bio70_26_HD.crop)
environment70_45_HD <- stack(alt.crop, mean(tmin70_45_HD.crop), mean(tmax70_45_HD.crop), mean(prec70_45_HD.crop), bio70_45_HD.crop)
environment70_85_HD <- stack(alt.crop, mean(tmin70_85_HD.crop), mean(tmax70_85_HD.crop), mean(prec70_85_HD.crop), bio70_85_HD.crop)

#IP
environment70_26_IP <- stack(alt.crop, mean(tmin70_26_IP.crop), mean(tmax70_26_IP.crop), mean(prec70_26_IP.crop), bio70_26_IP.crop)
environment70_45_IP <- stack(alt.crop, mean(tmin70_45_IP.crop), mean(tmax70_45_IP.crop), mean(prec70_45_IP.crop), bio70_45_IP.crop)
environment70_85_IP <- stack(alt.crop, mean(tmin70_85_IP.crop), mean(tmax70_85_IP.crop), mean(prec70_85_IP.crop), bio70_85_IP.crop)

#MI
environment70_26_MI <- stack(alt.crop, mean(tmin70_26_MI.crop), mean(tmax70_26_MI.crop), mean(prec70_26_MI.crop), bio70_26_MI.crop)
environment70_45_MI <- stack(alt.crop, mean(tmin70_45_MI.crop), mean(tmax70_45_MI.crop), mean(prec70_45_MI.crop), bio70_45_MI.crop)
environment70_85_MI <- stack(alt.crop, mean(tmin70_85_MI.crop), mean(tmax70_85_MI.crop), mean(prec70_85_MI.crop), bio70_85_MI.crop)

#MR
environment70_26_MR <- stack(alt.crop, mean(tmin70_26_MR.crop), mean(tmax70_26_MR.crop), mean(prec70_26_MR.crop), bio70_26_MR.crop)
environment70_45_MR <- stack(alt.crop, mean(tmin70_45_MR.crop), mean(tmax70_45_MR.crop), mean(prec70_45_MR.crop), bio70_45_MR.crop)
environment70_85_MR <- stack(alt.crop, mean(tmin70_85_MR.crop), mean(tmax70_85_MR.crop), mean(prec70_85_MR.crop), bio70_85_MR.crop)

#MC
environment70_26_MC <- stack(alt.crop, mean(tmin70_26_MC.crop), mean(tmax70_26_MC.crop), mean(prec70_26_MC.crop), bio70_26_MC.crop)
environment70_45_MC <- stack(alt.crop, mean(tmin70_45_MC.crop), mean(tmax70_45_MC.crop), mean(prec70_45_MC.crop), bio70_45_MC.crop)
environment70_85_MC <- stack(alt.crop, mean(tmin70_85_MC.crop), mean(tmax70_85_MC.crop), mean(prec70_85_MC.crop), bio70_85_MC.crop)

#MP
environment70_26_MP <- stack(alt.crop, mean(tmin70_26_MP.crop), mean(tmax70_26_MP.crop), mean(prec70_26_MP.crop), bio70_26_MP.crop)
environment70_45_MP <- stack(alt.crop, mean(tmin70_45_MP.crop), mean(tmax70_45_MP.crop), mean(prec70_45_MP.crop), bio70_45_MP.crop)
environment70_85_MP <- stack(alt.crop, mean(tmin70_85_MP.crop), mean(tmax70_85_MP.crop), mean(prec70_85_MP.crop), bio70_85_MP.crop)

#MG
environment70_26_MG <- stack(alt.crop, mean(tmin70_26_MG.crop), mean(tmax70_26_MG.crop), mean(prec70_26_MG.crop), bio70_26_MG.crop)
environment70_45_MG <- stack(alt.crop, mean(tmin70_45_MG.crop), mean(tmax70_45_MG.crop), mean(prec70_45_MG.crop), bio70_45_MG.crop)
environment70_85_MG <- stack(alt.crop, mean(tmin70_85_MG.crop), mean(tmax70_85_MG.crop), mean(prec70_85_MG.crop), bio70_85_MG.crop)

#NO
environment70_26_NO <- stack(alt.crop, mean(tmin70_26_NO.crop), mean(tmax70_26_NO.crop), mean(prec70_26_NO.crop), bio70_26_NO.crop)
environment70_45_NO <- stack(alt.crop, mean(tmin70_45_NO.crop), mean(tmax70_45_NO.crop), mean(prec70_45_NO.crop), bio70_45_NO.crop)
environment70_85_NO <- stack(alt.crop, mean(tmin70_85_NO.crop), mean(tmax70_85_NO.crop), mean(prec70_85_NO.crop), bio70_85_NO.crop)


# Name variables (present)
names(environment) <- c("alt", "tmin", "tmax", "tmean", "prec", "bio1", "bio2", "bio3",
	"bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
	"bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment)

# Make sure the layer Names (rasterStack) perfectly
# match with the names of variables used to build the models

# Name variables (2050)
#BC
names(environment50_26_BC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_BC)

names(environment50_45_BC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_BC)

names(environment50_85_BC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_BC)

#CC
names(environment50_26_CC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_CC)

names(environment50_45_CC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_CC)

names(environment50_85_CC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_CC)

#CN
names(environment50_26_CN) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_CN)

names(environment50_45_CN) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_CN)

names(environment50_85_CN) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_CN)

#GS
names(environment50_26_GS) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_GS)

names(environment50_45_GS) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_GS)

names(environment50_85_GS) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_GS)

#HD
names(environment50_26_HD) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_HD)

names(environment50_45_HD) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_HD)

names(environment50_85_HD) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_HD)

#IP
names(environment50_26_IP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_IP)

names(environment50_45_IP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_IP)

names(environment50_85_IP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_IP)

#MI
names(environment50_26_MI) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_MI)

names(environment50_45_MI) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_MI)

names(environment50_85_MI) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_MI)

#MR
names(environment50_26_MR) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_MR)

names(environment50_45_MR) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_MR)

names(environment50_85_MR) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_MR)

#MC
names(environment50_26_MC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_MC)

names(environment50_45_MC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_MC)

names(environment50_85_MC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_MC)

#MP
names(environment50_26_MP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_MP)

names(environment50_45_MP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_MP)

names(environment50_85_MP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_MP)

#MG
names(environment50_26_MG) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_MG)

names(environment50_45_MG) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_MG)

names(environment50_85_MG) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_MG)

#NO
names(environment50_26_NO) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26_NO)

names(environment50_45_NO) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45_NO)

names(environment50_85_NO) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85_NO)

# Name variables (2070)
#BC
names(environment70_26_BC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_BC)

names(environment70_45_BC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_BC)

names(environment70_85_BC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_BC)

#CC
names(environment70_26_CC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_CC)

names(environment70_45_CC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_CC)

names(environment70_85_CC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_CC)

#CN
names(environment70_26_CN) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_CN)

names(environment70_45_CN) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_CN)

names(environment70_85_CN) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_CN)

#GS
names(environment70_26_GS) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_GS)

names(environment70_45_GS) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_GS)

names(environment70_85_GS) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_GS)

#HD
names(environment70_26_HD) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_HD)

names(environment70_45_HD) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_HD)

names(environment70_85_HD) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_HD)

#IP
names(environment70_26_IP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_IP)

names(environment70_45_IP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_IP)

names(environment70_85_IP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_IP)

#MI
names(environment70_26_MI) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_MI)

names(environment70_45_MI) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_MI)

names(environment70_85_MI) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_MI)

#MR
names(environment70_26_MR) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_MR)

names(environment70_45_MR) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_MR)

names(environment70_85_MR) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_MR)

#MC
names(environment70_26_MC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_MC)

names(environment70_45_MC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_MC)

names(environment70_85_MC) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_MC)

#MP
names(environment70_26_MP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_MP)

names(environment70_45_MP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_MP)

names(environment70_85_MP) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_MP)

#MG
names(environment70_26_MG) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_MG)

names(environment70_45_MG) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_MG)

names(environment70_85_MG) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_MG)

#NO
names(environment70_26_NO) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26_NO)

names(environment70_45_NO) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45_NO)

names(environment70_85_NO) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
                                "bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                                "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85_NO)

# Optional: add NDVI raster to stack
# ndvi.raster <- raster("ndvi2010_5kmwgs84.asc")
# projection(ndvi.raster) <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
# ndvi.crop <- crop(ndvi.raster, ext)
# ndvi.crop.s <- resample(ndvi.crop, altitude.crop, method="bilinear")
# environment <- stack(ndvi.crop.s, environment)




######################################
#### COLLINEARITY CHECK - PRESENT ####
######################################

library(car)
library(dismo)

# Select 1000 random points from mask
set.seed(22111962)
mask <- environment$bio1
rnd.points <- randomPoints(mask, 1000)
plot(!is.na(mask), legend = F)
points(rnd.points, cex = 0.5)

# Principal Components Analysis (PCA) of environmental variables
env.data <- extract(environment, rnd.points)
pca.env.data <- princomp(env.data, cor = T)
plot(pca.env.data)
biplot(pca.env.data, pc.biplot = T)
summary(pca.env.data)
pca.env.data$loadings[, 1:3]

# Variance Inflation Factors (VIF) of environmental variables
                                                                 
library(usdm)
v1 <- vifcor(environment, th=0.9) #correlation
v1
v2 <- vifstep(environment, th=10) #VIF       
v2

# Subset environmental stack
env.selected <- exclude(environment, v2) #exclude collinear variables identified with vifstep 
env.selected

# Pairs plot of selected environmental predictors
env.data.std <- data.frame(scale(env.data)) # Scale variables
library(corrplot)
B <- cor(env.data.std[, c("alt", "bio2", "bio3","bio8","bio9","bio13","bio14", "bio15", "bio18", "bio19")])
corrplot.mixed(B, upper="ellipse", lower="number")


# Subset environmental stack for future scenarios
# Name variables (2050)
#BC
env50_26_BC.selected <- subset(environment50_26_BC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_BC.selected

env50_45_BC.selected <- subset(environment50_45_BC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_BC.selected

env50_85_BC.selected <- subset(environment50_85_BC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_BC.selected

#CC
env50_26_CC.selected <- subset(environment50_26_CC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_CC.selected

env50_45_CC.selected <- subset(environment50_45_CC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_CC.selected

env50_85_CC.selected <- subset(environment50_85_CC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_CC.selected

#CN
env50_26_CN.selected <- subset(environment50_26_CN, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_CN.selected

env50_45_CN.selected <- subset(environment50_45_CN, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_CN.selected

env50_85_CN.selected <- subset(environment50_85_CN, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_CN.selected

#GS
env50_26_GS.selected <- subset(environment50_26_GS, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_GS.selected

env50_45_GS.selected <- subset(environment50_45_GS, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_GS.selected

env50_85_GS.selected <- subset(environment50_85_GS, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_GS.selected

#HD
env50_26_HD.selected <- subset(environment50_26_HD, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_HD.selected

env50_45_HD.selected <- subset(environment50_45_HD, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_HD.selected

env50_85_HD.selected <- subset(environment50_85_HD, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_HD.selected

#IP
env50_26_IP.selected <- subset(environment50_26_IP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_IP.selected

env50_45_IP.selected <- subset(environment50_45_IP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_IP.selected

env50_85_IP.selected <- subset(environment50_85_IP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_IP.selected

#MI
env50_26_MI.selected <- subset(environment50_26_MI, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_MI.selected

env50_45_MI.selected <- subset(environment50_45_MI, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_MI.selected

env50_85_MI.selected <- subset(environment50_85_MI, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_MI.selected

#MR
env50_26_MR.selected <- subset(environment50_26_MR, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_MR.selected

env50_45_MR.selected <- subset(environment50_45_MR, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_MR.selected

env50_85_MR.selected <- subset(environment50_85_MR, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_MR.selected

#MC
env50_26_MC.selected <- subset(environment50_26_MC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_MC.selected

env50_45_MC.selected <- subset(environment50_45_MC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_MC.selected

env50_85_MC.selected <- subset(environment50_85_MC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_MC.selected

#MP
env50_26_MP.selected <- subset(environment50_26_MP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_MP.selected

env50_45_MP.selected <- subset(environment50_45_MP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_MP.selected

env50_85_MP.selected <- subset(environment50_85_MP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_MP.selected

#MG
env50_26_MG.selected <- subset(environment50_26_MG, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_MG.selected

env50_45_MG.selected <- subset(environment50_45_MG, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_MG.selected

env50_85_MG.selected <- subset(environment50_85_MG, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_MG.selected

#NO
env50_26_NO.selected <- subset(environment50_26_NO, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26_NO.selected

env50_45_NO.selected <- subset(environment50_45_NO, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45_NO.selected

env50_85_NO.selected <- subset(environment50_85_NO, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85_NO.selected

# Name variables (2070)
#BC
env70_26_BC.selected <- subset(environment70_26_BC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_BC.selected

env70_45_BC.selected <- subset(environment70_45_BC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_BC.selected

env70_85_BC.selected <- subset(environment70_85_BC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_BC.selected

#CC
env70_26_CC.selected <- subset(environment70_26_CC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_CC.selected

env70_45_CC.selected <- subset(environment70_45_CC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_CC.selected

env70_85_CC.selected <- subset(environment70_85_CC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_CC.selected

#CN
env70_26_CN.selected <- subset(environment70_26_CN, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_CN.selected

env70_45_CN.selected <- subset(environment70_45_CN, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_CN.selected

env70_85_CN.selected <- subset(environment70_85_CN, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_CN.selected

#GS
env70_26_GS.selected <- subset(environment70_26_GS, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_GS.selected

env70_45_GS.selected <- subset(environment70_45_GS, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_GS.selected

env70_85_GS.selected <- subset(environment70_85_GS, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_GS.selected

#HD
env70_26_HD.selected <- subset(environment70_26_HD, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_HD.selected

env70_45_HD.selected <- subset(environment70_45_HD, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_HD.selected

env70_85_HD.selected <- subset(environment70_85_HD, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_HD.selected

#IP
env70_26_IP.selected <- subset(environment70_26_IP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_IP.selected

env70_45_IP.selected <- subset(environment70_45_IP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_IP.selected

env70_85_IP.selected <- subset(environment70_85_IP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_IP.selected

#MI
env70_26_MI.selected <- subset(environment70_26_MI, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_MI.selected

env70_45_MI.selected <- subset(environment70_45_MI, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_MI.selected

env70_85_MI.selected <- subset(environment70_85_MI, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_MI.selected

#MR
env70_26_MR.selected <- subset(environment70_26_MR, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_MR.selected

env70_45_MR.selected <- subset(environment70_45_MR, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_MR.selected

env70_85_MR.selected <- subset(environment70_85_MR, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_MR.selected

#MC
env70_26_MC.selected <- subset(environment70_26_MC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_MC.selected

env70_45_MC.selected <- subset(environment70_45_MC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_MC.selected

env70_85_MC.selected <- subset(environment70_85_MC, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_MC.selected

#MP
env70_26_MP.selected <- subset(environment70_26_MP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_MP.selected

env70_45_MP.selected <- subset(environment70_45_MP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_MP.selected

env70_85_MP.selected <- subset(environment70_85_MP, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_MP.selected

#MG
env70_26_MG.selected <- subset(environment70_26_MG, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_MG.selected

env70_45_MG.selected <- subset(environment70_45_MG, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_MG.selected

env70_85_MG.selected <- subset(environment70_85_MG, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_MG.selected

#NO
env70_26_NO.selected <- subset(environment70_26_NO, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26_NO.selected

env70_45_NO.selected <- subset(environment70_45_NO, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45_NO.selected

env70_85_NO.selected <- subset(environment70_85_NO, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85_NO.selected


#Save Final Rasters Present
writeRaster(environment, filename="cmip5/environment", overwrite=TRUE)
writeRaster(env.selected, filename="cmip5/env_saved", overwrite=TRUE)

#Save Final Rasters 2050
writeRaster(env50_26_BC.selected, filename="cmip5/env50_26_BC", overwrite=TRUE)
writeRaster(env50_45_BC.selected, filename="cmip5/env50_45_BC", overwrite=TRUE)
writeRaster(env50_85_BC.selected, filename="cmip5/env50_85_BC", overwrite=TRUE)

writeRaster(env50_26_CC.selected, filename="cmip5/env50_26_CC", overwrite=TRUE)
writeRaster(env50_45_CC.selected, filename="cmip5/env50_45_CC", overwrite=TRUE)
writeRaster(env50_85_CC.selected, filename="cmip5/env50_85_CC", overwrite=TRUE)

writeRaster(env50_26_CN.selected, filename="cmip5/env50_26_CN", overwrite=TRUE)
writeRaster(env50_45_CN.selected, filename="cmip5/env50_45_CN", overwrite=TRUE)
writeRaster(env50_85_CN.selected, filename="cmip5/env50_85_CN", overwrite=TRUE)

writeRaster(env50_26_GS.selected, filename="cmip5/env50_26_GS", overwrite=TRUE)
writeRaster(env50_45_GS.selected, filename="cmip5/env50_45_GS", overwrite=TRUE)
writeRaster(env50_85_GS.selected, filename="cmip5/env50_85_GS", overwrite=TRUE)

writeRaster(env50_26_HD.selected, filename="cmip5/env50_26_HD", overwrite=TRUE)
writeRaster(env50_45_HD.selected, filename="cmip5/env50_45_HD", overwrite=TRUE)
writeRaster(env50_85_HD.selected, filename="cmip5/env50_85_HD", overwrite=TRUE)

writeRaster(env50_26_IP.selected, filename="cmip5/env50_26_IP", overwrite=TRUE)
writeRaster(env50_45_IP.selected, filename="cmip5/env50_45_IP", overwrite=TRUE)
writeRaster(env50_85_IP.selected, filename="cmip5/env50_85_IP", overwrite=TRUE)

writeRaster(env50_26_MI.selected, filename="cmip5/env50_26_MI", overwrite=TRUE)
writeRaster(env50_45_MI.selected, filename="cmip5/env50_45_MI", overwrite=TRUE)
writeRaster(env50_85_MI.selected, filename="cmip5/env50_85_MI", overwrite=TRUE)

writeRaster(env50_26_MR.selected, filename="cmip5/env50_26_MR", overwrite=TRUE)
writeRaster(env50_45_MR.selected, filename="cmip5/env50_45_MR", overwrite=TRUE)
writeRaster(env50_85_MR.selected, filename="cmip5/env50_85_MR", overwrite=TRUE)

writeRaster(env50_26_MC.selected, filename="cmip5/env50_26_MC", overwrite=TRUE)
writeRaster(env50_45_MC.selected, filename="cmip5/env50_45_MC", overwrite=TRUE)
writeRaster(env50_85_MC.selected, filename="cmip5/env50_85_MC", overwrite=TRUE)

writeRaster(env50_26_MP.selected, filename="cmip5/env50_26_MP", overwrite=TRUE)
writeRaster(env50_45_MP.selected, filename="cmip5/env50_45_MP", overwrite=TRUE)
writeRaster(env50_85_MP.selected, filename="cmip5/env50_85_MP", overwrite=TRUE)

writeRaster(env50_26_MG.selected, filename="cmip5/env50_26_MG", overwrite=TRUE)
writeRaster(env50_45_MG.selected, filename="cmip5/env50_45_MG", overwrite=TRUE)
writeRaster(env50_85_MG.selected, filename="cmip5/env50_85_MG", overwrite=TRUE)

writeRaster(env50_26_NO.selected, filename="cmip5/env50_26_NO", overwrite=TRUE)
writeRaster(env50_45_NO.selected, filename="cmip5/env50_45_NO", overwrite=TRUE)
writeRaster(env50_85_NO.selected, filename="cmip5/env50_85_NO", overwrite=TRUE)

#Save Final Rasters 2070

writeRaster(env70_26_BC.selected, filename="cmip5/env70_26_BC", overwrite=TRUE)
writeRaster(env70_45_BC.selected, filename="cmip5/env70_45_BC", overwrite=TRUE)
writeRaster(env70_85_BC.selected, filename="cmip5/env70_85_BC", overwrite=TRUE)

writeRaster(env70_26_CC.selected, filename="cmip5/env70_26_CC", overwrite=TRUE)
writeRaster(env70_45_CC.selected, filename="cmip5/env70_45_CC", overwrite=TRUE)
writeRaster(env70_85_CC.selected, filename="cmip5/env70_85_CC", overwrite=TRUE)

writeRaster(env70_26_CN.selected, filename="cmip5/env70_26_CN", overwrite=TRUE)
writeRaster(env70_45_CN.selected, filename="cmip5/env70_45_CN", overwrite=TRUE)
writeRaster(env70_85_CN.selected, filename="cmip5/env70_85_CN", overwrite=TRUE)

writeRaster(env70_26_GS.selected, filename="cmip5/env70_26_GS", overwrite=TRUE)
writeRaster(env70_45_GS.selected, filename="cmip5/env70_45_GS", overwrite=TRUE)
writeRaster(env70_85_GS.selected, filename="cmip5/env70_85_GS", overwrite=TRUE)

writeRaster(env70_26_HD.selected, filename="cmip5/env70_26_HD", overwrite=TRUE)
writeRaster(env70_45_HD.selected, filename="cmip5/env70_45_HD", overwrite=TRUE)
writeRaster(env70_85_HD.selected, filename="cmip5/env70_85_HD", overwrite=TRUE)

writeRaster(env70_26_IP.selected, filename="cmip5/env70_26_IP", overwrite=TRUE)
writeRaster(env70_45_IP.selected, filename="cmip5/env70_45_IP", overwrite=TRUE)
writeRaster(env70_85_IP.selected, filename="cmip5/env70_85_IP", overwrite=TRUE)

writeRaster(env70_26_MI.selected, filename="cmip5/env70_26_MI", overwrite=TRUE)
writeRaster(env70_45_MI.selected, filename="cmip5/env70_45_MI", overwrite=TRUE)
writeRaster(env70_85_MI.selected, filename="cmip5/env70_85_MI", overwrite=TRUE)

writeRaster(env70_26_MR.selected, filename="cmip5/env70_26_MR", overwrite=TRUE)
writeRaster(env70_45_MR.selected, filename="cmip5/env70_45_MR", overwrite=TRUE)
writeRaster(env70_85_MR.selected, filename="cmip5/env70_85_MR", overwrite=TRUE)

writeRaster(env70_26_MC.selected, filename="cmip5/env70_26_MC", overwrite=TRUE)
writeRaster(env70_45_MC.selected, filename="cmip5/env70_45_MC", overwrite=TRUE)
writeRaster(env70_85_MC.selected, filename="cmip5/env70_85_MC", overwrite=TRUE)

writeRaster(env70_26_MP.selected, filename="cmip5/env70_26_MP", overwrite=TRUE)
writeRaster(env70_45_MP.selected, filename="cmip5/env70_45_MP", overwrite=TRUE)
writeRaster(env70_85_MP.selected, filename="cmip5/env70_85_MP", overwrite=TRUE)

writeRaster(env70_26_MG.selected, filename="cmip5/env70_26_MG", overwrite=TRUE)
writeRaster(env70_45_MG.selected, filename="cmip5/env70_45_MG", overwrite=TRUE)
writeRaster(env70_85_MG.selected, filename="cmip5/env70_85_MG", overwrite=TRUE)

writeRaster(env70_26_NO.selected, filename="cmip5/env70_26_NO", overwrite=TRUE)
writeRaster(env70_45_NO.selected, filename="cmip5/env70_45_NO", overwrite=TRUE)
writeRaster(env70_85_NO.selected, filename="cmip5/env70_85_NO", overwrite=TRUE)

#############################################################################################################################
#############################################################################################################################




#################################
####Load Saved Raster Present####
#################################


# Change directory
setwd("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/alternatus")

library(raster)
environment <- stack("cmip5/environment")
env.saved <- stack("cmip5/env_saved")

#Load Saved Stack 2050
env50_26_BC.saved <- stack("cmip5/env50_26_BC")
env50_45_BC.saved<- stack("cmip5/env50_45_BC")
env50_85_BC.saved<- stack("cmip5/env50_85_BC")

env50_26_CC.saved<- stack("cmip5/env50_26_CC")
env50_45_CC.saved<- stack("cmip5/env50_45_CC")
env50_85_CC.saved<- stack("cmip5/env50_85_CC")

env50_26_CN.saved<- stack("cmip5/env50_26_CN")
env50_45_CN.saved<- stack("cmip5/env50_45_CN")
env50_85_CN.saved<- stack("cmip5/env50_85_CN")

env50_26_GS.saved<- stack("cmip5/env50_26_GS")
env50_45_GS.saved<- stack("cmip5/env50_45_GS")
env50_85_GS.saved<- stack("cmip5/env50_85_GS")

env50_26_HD.saved<- stack("cmip5/env50_26_HD")
env50_45_HD.saved<- stack("cmip5/env50_45_HD")
env50_85_HD.saved<- stack("cmip5/env50_85_HD")

env50_26_IP.saved<- stack("cmip5/env50_26_IP")
env50_45_IP.saved<- stack("cmip5/env50_45_IP")
env50_85_IP.saved<- stack("cmip5/env50_85_IP")

env50_26_MI.saved<- stack("cmip5/env50_26_MI")
env50_45_MI.saved<- stack("cmip5/env50_45_MI")
env50_85_MI.saved<- stack("cmip5/env50_85_MI")

env50_26_MR.saved<- stack("cmip5/env50_26_MR")
env50_45_MR.saved<- stack("cmip5/env50_45_MR")
env50_85_MR.saved<- stack("cmip5/env50_85_MR")

env50_26_MC.saved<- stack("cmip5/env50_26_MC")
env50_45_MC.saved<- stack("cmip5/env50_45_MC")
env50_85_MC.saved<- stack("cmip5/env50_85_MC")

env50_26_MP.saved<- stack("cmip5/env50_26_MP")
env50_45_MP.saved<- stack("cmip5/env50_45_MP")
env50_85_MP.saved<- stack("cmip5/env50_85_MP")

env50_26_MG.saved<- stack("cmip5/env50_26_MG")
env50_45_MG.saved<- stack("cmip5/env50_45_MG")
env50_85_MG.saved<- stack("cmip5/env50_85_MG")

env50_26_NO.saved<- stack("cmip5/env50_26_NO")
env50_45_NO.saved<- stack("cmip5/env50_45_NO")
env50_85_NO.saved<- stack("cmip5/env50_85_NO")

#Load Saved stacks 2070
env70_26_BC.saved <- stack("cmip5/env70_26_BC")
env70_45_BC.saved<- stack("cmip5/env70_45_BC")
env70_85_BC.saved<- stack("cmip5/env70_85_BC")

env70_26_CC.saved<- stack("cmip5/env70_26_CC")
env70_45_CC.saved<- stack("cmip5/env70_45_CC")
env70_85_CC.saved<- stack("cmip5/env70_85_CC")

env70_26_CN.saved<- stack("cmip5/env70_26_CN")
env70_45_CN.saved<- stack("cmip5/env70_45_CN")
env70_85_CN.saved<- stack("cmip5/env70_85_CN")

env70_26_GS.saved<- stack("cmip5/env70_26_GS")
env70_45_GS.saved<- stack("cmip5/env70_45_GS")
env70_85_GS.saved<- stack("cmip5/env70_85_GS")

env70_26_HD.saved<- stack("cmip5/env70_26_HD")
env70_45_HD.saved<- stack("cmip5/env70_45_HD")
env70_85_HD.saved<- stack("cmip5/env70_85_HD")

env70_26_IP.saved<- stack("cmip5/env70_26_IP")
env70_45_IP.saved<- stack("cmip5/env70_45_IP")
env70_85_IP.saved<- stack("cmip5/env70_85_IP")

env70_26_MI.saved<- stack("cmip5/env70_26_MI")
env70_45_MI.saved<- stack("cmip5/env70_45_MI")
env70_85_MI.saved<- stack("cmip5/env70_85_MI")

env70_26_MR.saved<- stack("cmip5/env70_26_MR")
env70_45_MR.saved<- stack("cmip5/env70_45_MR")
env70_85_MR.saved<- stack("cmip5/env70_85_MR")

env70_26_MC.saved<- stack("cmip5/env70_26_MC")
env70_45_MC.saved<- stack("cmip5/env70_45_MC")
env70_85_MC.saved<- stack("cmip5/env70_85_MC")

env70_26_MP.saved<- stack("cmip5/env70_26_MP")
env70_45_MP.saved<- stack("cmip5/env70_45_MP")
env70_85_MP.saved<- stack("cmip5/env70_85_MP")

env70_26_MG.saved<- stack("cmip5/env70_26_MG")
env70_45_MG.saved<- stack("cmip5/env70_45_MG")
env70_85_MG.saved<- stack("cmip5/env70_85_MG")

env70_26_NO.saved<- stack("cmip5/env70_26_NO")
env70_45_NO.saved<- stack("cmip5/env70_45_NO")
env70_85_NO.saved<- stack("cmip5/env70_85_NO")


##########################################
#### INPUT AND PLOT DISTRIBUTION DATA ####
##########################################

# Read data
alternatus <- read.csv("alternatus.csv", h = T, sep=";")
str(alternatus)
head(alternatus)

# Remove duplicates
dups2 <- duplicated(alternatus[, 2:3])
sum(dups2) # how many duplicates?
alternatus <- alternatus[!dups2, 2:3] # remove duplicates
str(alternatus)

# Visualize data
library(plotKML)
library(colorRamps)
library(RColorBrewer)
library(rgdal)


#plot(environment[[1]], col = rev(brewer.pal(11, "RdYlBu")), main = "Altitude") #RColorBrewer
#plot(environment[[1]], col = SAGA_pal[[1]], main = "Altitude") #plotKML
#plot(environment[[1]], col = rev(magenta2green(100)), main = "Altitude") #colorRamps
#plot(environment[[1]], col = blue2red(100), main = "Altitude") #colorRamps
#plot(environment[[1]], col = matlab.like2(100), main = "Altitude") #colorRamps


dis.cerrado <- readOGR("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/Shapes","Cerrado")
dis.caatinga <- readOGR("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/Shapes","Caatinga")
dis.chaco <- readOGR("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/Shapes","Chaco")


#x11(w=6, h=6) #Windows only
pdf("alternatus2.pdf", width = 8.267, height= 11.692, paper="a4")
plot(environment[[1]], col = matlab.like(100), main = "Altitude", las=1) #colorRamps
data(wrld_simpl)
plot(wrld_simpl, add = TRUE, col="transparent", border="gray70", lwd = 0.25)
plot(dis.cerrado, col=rgb(1,1,1,0.2), border="gray80", lwd = 0.5, add=T)
plot(dis.caatinga, col=rgb(1,1,1,0.2), border="gray80", lwd = 0.5, add=T)
plot(dis.chaco, col=rgb(1,1,1,0.2), border="gray80", lwd = 0.5, add=T)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 0.7, col = "gray20", bg = "black")
dev.off()



#######################################################
#### ENVIRONMENTAL FILTER OF RAW DISTRIBUTION DATA ####
#######################################################

# From https://github.com/SaraVarela/envSample
# Varela, S., Anderson, R.P., Garcia-Valdes, R., Fernandez-Gonzalez, F., 2014. Environmental filters reduce the effects of sampling bias and improve predictions of ecological niche models. Ecography 37, 1084-1091.

library(maps)
library(raster)
library(rgdal)
library(roxygen2)
library(sqldf)
library(testthat)

# Function by Sarah Varela (EnvSample)
# resample the raw data to eliminate the biases in the environmental space. 
# 
# Ecological Niche Model's predictions could be improved by using unbiased data sets 
# for calibrating the algorithms. 
# With this function users could filter their raw species occurrences to avoid environmental biases.
# The user should select which variables (filters)
#  are adequate for filtering the raw species occurrences:
# e.g. selecting the variables that are important for the species, or, in case there is no
# information about the importance of the variables, selecting variables that are not correlated:
# e.g. annual mean temperature (bio1) and annual precipitation (bio12).  
# 
# @usage envSample (coord, filters, res, do.plot)
# 
# @param coord a dataframe with the coordinates of the raw species occurrences. 
# The first column should be the longitude (x) and the second 
# column the latitude (y). 
# @param filters a list of vectors with the values of the variables for the species occurrences 
# (users can get these vectors by using the function extract from the raster R-package) 
# @param res a list of numbers that set the size of the grid to filter the data for each variable
# @param do.plot TRUE/FALSE. If FALSE, the function does not return a plot showing the raw and filtered data sets.
# 
# @examples \dontrun{
# file <- paste(system.file(package="dismo"), "/ex/bradypus.csv", sep="")
# bradypus <- read.table(file, header=TRUE, sep=',')
# coord<- bradypus [,2:3]
# setwd ("yourdirectory/worldclim)
# var<- list.files (pattern=".bil")
# wc<- stack (var)
# data<- extract (env.selected, coord)
# data<- as.data.frame (data)
# envSample (coord, filters=list (data$bio2, data$bio3), res=list (20, 200), do.plot=TRUE)
# }
# 

envSample<- function (coord, filters, res, do.plot=TRUE){
  
  n<- length (filters)
  pot_points<- list ()
  for (i in 1:n){
    k<- filters [[i]] [!is.na(filters[[i]])]
    ext1<- range (k)
    ext1 [1]<- ext1[1]- 1
    x<- seq(ext1[1],ext1[2], by=res[[i]])
    pot_points[[i]]<- x
  }
  pot_p<- expand.grid(pot_points)
  
  ends<- NULL
  for (i in 1:n){
    fin<- pot_p [,i] + res[[i]]
    ends<- cbind (ends, fin)
  }
  
  pot_pp<- data.frame (pot_p, ends)
  pot_pp<- data.frame (pot_pp, groupID=c(1:nrow (pot_pp)))
  rows<- length (filters[[1]])
  filter<- data.frame(matrix(unlist(filters), nrow=rows))
  real_p<- data.frame (coord, filter)
  
  names_real<- c("lon", "lat")
  names_pot_st<- NULL
  names_pot_end<- NULL
  sql1<- NULL
  for (i in 1:n){
    names_real<- c(names_real, paste ("filter", i, sep=""))
    names_pot_st<- c(names_pot_st, paste ("start_f", i, sep=""))
    names_pot_end<- c(names_pot_end, paste ("end_f", i, sep=""))
    sql1<- paste (sql1, paste ("real_p.filter", i, sep=""), sep=", ")   
  }
  
  names (real_p)<- names_real
  names (pot_pp)<- c(names_pot_st, names_pot_end, "groupID")
  
  conditions<- paste ("(real_p.filter", 1, "<= pot_pp.end_f", 1,") and (real_p.filter", 1, "> pot_pp.start_f", 1, ")", sep="")
  for (i in 2:n){
    conditions<- paste (conditions, 
                        paste ("(real_p.filter", i, "<= pot_pp.end_f", i,") and (real_p.filter", i, "> pot_pp.start_f", i, ")", sep=""), 
                        sep="and")
  }
  
  selection_NA<- sqldf(paste ("select real_p.lon, real_p.lat, pot_pp.groupID",   
                        sql1, "from pot_pp left join real_p on", conditions, sep=" "))

  selection<- selection_NA [complete.cases(selection_NA),]
  
  final_points<- selection[!duplicated(selection$groupID), ]
  coord_filter<- data.frame (final_points$lon, final_points$lat) 
  names (coord_filter)<- c("lon", "lat")
  
  if (do.plot==TRUE){
    par (mfrow=c(1,2), mar=c(4,4,0,0.5))
  plot (filters[[1]], filters[[2]], pch=19, 
        col="grey50", xlab="Filter 1", ylab="Filter 2")
  points (final_points$filter1, final_points$filter2, 
          pch=19, col="#88000090")
  plot (coord, pch=19, col="grey50")
  map(add=T)
  points (coord_filter, pch=19, col="#88000090")
  
  }
  coord_filter
}


# Apply environmental filter to create training data set
env.data <- extract(environment, alternatus)
env.data <- as.data.frame(env.data)
(alternatus.training <- envSample(alternatus, filters=list(env.data$bio2, env.data$bio15, env.data$bio18,
	env.data$bio8), res=list(20, 20, 20, 20), do.plot=TRUE)) # 4 predictors with smallest VIF
                                                                                                 

# Reserve remaining (filtered out) points for testing data set   
library(dplyr)
(alternatus.testing <- alternatus %>% anti_join(alternatus.training)) # filtered out points




####################################
#### GENERATE BACKGROUND POINTS ####
####################################


# Generate background points for training dataset
mask <- environment$bio1
set.seed(22111962)
bg.train <- randomPoints(mask, 204) #Remember to put the number of points after filter application "env.data training" (Number of points held after filter)
plot(!is.na(mask), legend = F)
points(bg.train, cex = 0.5)
bg.df.train <- data.frame(Occurrence = rep(0, 204), lon = bg.train[, 1], lat = bg.train[, 2])
bg.df.train

# Convert training dataset to SpatialPointsDataFrame
df.train <- data.frame(Occurrence = rep(1, length(alternatus.training$lon)), alternatus.training)
merged.dfs.train <- rbind(df.train, bg.df.train)
alternatus.training.spdf <- SpatialPointsDataFrame(coords = merged.dfs.train[, 2:3],	data = data.frame(merged.dfs.train[1]),
	proj4string = crs(environment))
alternatus.training.spdf

# Generate background points for testing dataset
mask <- environment$bio1
set.seed(22111962)
bg <- randomPoints(mask, 194)  #Remember to put the number of points after filter application "env.data testing" (Number of points removed after filter)
plot(!is.na(mask), legend = F)
points(bg, cex = 0.5)
bg.df <- data.frame(Occurrence = rep(0, 194), lon = bg[, 1], lat = bg[, 2])      
bg.df

# Convert testing dataset to SpatialPointsDataFrame
df <- data.frame(Occurrence = rep(1, length(alternatus.testing$lon)), alternatus.testing)
merged.dfs <- rbind(df, bg.df)
alternatus.testing.spdf <- SpatialPointsDataFrame(coords = merged.dfs[, 2:3], data = data.frame(merged.dfs[1]),
	proj4string = crs(environment))
alternatus.testing.spdf




################################################
#### FIT SPECIES DISTRIBUTION MODELS - SDMS ####
################################################

library(biomod2)

occurrence.resp <-  rep(1, length(alternatus.training$lon))

# Prepare data
alternatusBiomodData_PA_equal <- BIOMOD_FormatingData(
	resp.var = occurrence.resp,
	expl.var = env.saved,
	resp.xy = alternatus.training,
	resp.name = "Occurrence",
	PA.nb.rep = 10,
	PA.nb.absences = 204,  #Remember to put the number of points after filter application (Number of points held after filter)        
	PA.strategy = "sre",
	PA.sre.quant = 0.025)
alternatusBiomodData_PA_equal

alternatusBiomodData_PA_10000 <- BIOMOD_FormatingData(
	resp.var = occurrence.resp,
	expl.var = env.saved,
	resp.xy = alternatus.training,
	resp.name = "Occurrence",
	PA.nb.rep = 10,
	PA.nb.absences = 10000,
	PA.strategy = "sre",
	PA.sre.quant = 0.025)
alternatusBiomodData_PA_10000



# Path to MAXENT
myBiomodOption <- BIOMOD_ModelingOptions(MAXENT.Phillips = list(path_to_maxent.jar="C:/Users/sukam/Documents/R/win-library/3.3/dismo/java", memory_allocated = 1024))
#myBiomodOption <- BIOMOD_ModelingOptions()# When MAXENT is not necessary                    

# Parallel processing
library(doParallel)
cl <- makeCluster(4) # number of cores in computer
registerDoParallel(cl)

models = c("GLM","GAM","GBM","CTA","ANN","SRE","FDA","MARS","RF","MAXENT.Phillips","MAXENT.Tsuruoka")   
#Modeling: machine learning methods (using default options)
myBiomodOptions_PA_equal <- BIOMOD_ModelingOptions(GBM = NULL,
	CTA = NULL,
  RF = NULL)
                        
alternatusModelOut_PA_equal <- BIOMOD_Modeling(alternatusBiomodData_PA_equal, 
	models = c("GBM","CTA","RF"), 
	models.options = myBiomodOption, 
	NbRunEval = 10,
	DataSplit = 75, 
	Prevalence = NULL, 
	VarImport = 3,
	models.eval.meth = c("KAPPA","TSS","ROC","ACCURACY","BIAS"),
	SaveObj = TRUE,
	rescal.all.models = FALSE,
	do.full.models = FALSE,
	modeling.id = "alternatus")

# Modeling: machine learning methods (using default options)
myBiomodOptions_PA_10000 <- BIOMOD_ModelingOptions(GLM = NULL,
	GAM = NULL,
	ANN = NULL,
	SRE = NULL,
	FDA = NULL,
	MARS = NULL,
	MAXENT.Phillips = NULL,
	MAXENT.Tsuruoka = NULL)
                        
alternatusModelOut_PA_10000 <- BIOMOD_Modeling( 
	alternatusBiomodData_PA_10000, 
	models = c("GLM","GAM","ANN","SRE","FDA","MARS","MAXENT.Phillips","MAXENT.Tsuruoka"), 
	models.options = myBiomodOption, 
	NbRunEval = 10,
	DataSplit = 75, 
	Prevalence = NULL, 
	VarImport = 3,
	models.eval.meth = c("KAPPA","TSS","ROC","ACCURACY","BIAS"),
	SaveObj = TRUE,
	rescal.all.models = FALSE,
	do.full.models = FALSE,
	modeling.id = "alternatus")




#######################################
#### EVALUATE MODELS USING BIOMOD2 ####
#######################################

#Relative importance of the explanatory variables
#Get Variables Importance
imp.var_PA_equal <- get_variables_importance(alternatusModelOut_PA_equal)
imp.var_PA_10000 <- get_variables_importance(alternatusModelOut_PA_10000)


#Importance of variables
sdm.models <- c("GBM","CTA","RF") #3 models
imp.var <- c("alt","bio2","bio3","bio8","bio9", "bio13", "bio14", "bio15", "bio18", "bio19") #5 evaluation methods

means.i <- numeric(0)
means.j <- numeric(10)
for (i in 1:3){
  for (j in 1:10){
    means.j[j] <- mean(imp.var_PA_equal[paste(imp.var[j]),paste(sdm.models[i]),,],na.rm=T)
  }
  means.i <- c(means.i, means.j)
}


summary.imp.var.equal <- data.frame(rep(sdm.models,each=1), rep(imp.var,1), means.i)
names(summary.imp.var.equal) <- c("Model", "Variable", "Mean")
summary.imp.var.equal
tabla<- xtabs(summary.imp.var.equal$Mean ~ summary.imp.var.equal$Variable + summary.imp.var.equal$Model) # RF, CTA, GBM with best performance
sink("summary.imp.var.equal.txt")
tabla
sink()

# Get evaluations
alternatusModelEval_PA_equal <- get_evaluations(alternatusModelOut_PA_equal)
alternatusModelEval_PA_10000 <- get_evaluations(alternatusModelOut_PA_10000)

# Print ROC scores of all selected models
alternatusModelEval_PA_equal["ROC","Testing.data",,,]

# Get summaries (mean) of model evaluation: one model (MAXENT.Tsuruoka), one method (TSS)
dimnames(alternatusModelEval_PA_10000)
MAXENT.Tsuruoka_Eval<- alternatusModelEval_PA_10000["TSS","Testing.data","MAXENT.Tsuruoka",,]
mean(MAXENT.Tsuruoka_Eval)

# Get summaries (mean) of model evaluation: one model (GLM), all methods
mean(alternatusModelEval_PA_10000["KAPPA","Testing.data","MAXENT.Tsuruoka",,])
mean(alternatusModelEval_PA_10000["TSS","Testing.data","MAXENT.Tsuruoka",,])
mean(alternatusModelEval_PA_10000["ROC","Testing.data","MAXENT.Tsuruoka",,])
mean(alternatusModelEval_PA_10000["ACCURACY","Testing.data","MAXENT.Tsuruoka",,])
mean(alternatusModelEval_PA_10000["BIAS","Testing.data","MAXENT.Tsuruoka",,])


# Get summaries (mean) of model evaluation: machine-learning models, all methods
sdm.models <- c("GBM","CTA","RF") #3 models
eval.methods <- c("KAPPA","TSS","ROC","ACCURACY","BIAS") #5 evaluation methods

means.i <- numeric(0)
means.j <- numeric(5)
for (i in 1:3){
	for (j in 1:5){
	means.j[j] <- mean(alternatusModelEval_PA_equal[paste(eval.methods[j]),"Testing.data",paste(sdm.models[i]),,],na.rm=T)
	}
	means.i <- c(means.i, means.j)
}


summary.eval.equal <- data.frame(rep(sdm.models,each=5), rep(eval.methods,3), means.i)
names(summary.eval.equal) <- c("Model", "Method", "Mean")
summary.eval.equal
xtabs(summary.eval.equal$Mean ~ summary.eval.equal$Model + summary.eval.equal$Method) # RF, CTA, GBM with best performance
sink("alternatus.summary.eval.equal.txt")
summary.eval.equal
sink()

# Get summaries (mean) of model evaluation: regression models, all methods
sdm.models <- c("GLM","GAM","ANN","SRE","FDA","MARS","MAXENT.Phillips","MAXENT.Tsuruoka") #8 models
eval.methods <- c("KAPPA","TSS","ROC","ACCURACY","BIAS") #5 evaluation methods

means.i <- numeric(0)
means.j <- numeric(5)
for (i in 1:8){
	for (j in 1:5){
	means.j[j] <- mean(alternatusModelEval_PA_10000[paste(eval.methods[j]),"Testing.data",paste(sdm.models[i]),,], na.rm=T)
	}
	means.i <- c(means.i, means.j)
}

summary.eval.10000 <- data.frame(rep(sdm.models,each=5), rep(eval.methods,8), means.i)
names(summary.eval.10000) <- c("Model", "Method", "Mean")
summary.eval.10000
xtabs(summary.eval.10000$Mean ~ summary.eval.10000$Model + summary.eval.10000$Method) 
sink("alternatus.summary.eval.10000.txt")
summary.eval.10000
sink()

################################
#### PRODUCE ENSEMBLE MODEL ####
################################


##BIOMOD_Modeling Again###   
##Run again only if the selected models are different ("GBM","RF")
alternatusModelOut_PA_equal.2 <- BIOMOD_Modeling(alternatusBiomodData_PA_equal, 
                                               models = c("RF"),
                                               models.options = myBiomodOption, 
                                               NbRunEval = 10,
                                               DataSplit = 75, 
                                               Prevalence = NULL, 
                                               VarImport = 3,
                                               models.eval.meth = c("KAPPA","TSS","ROC","ACCURACY","BIAS"),
                                               SaveObj = TRUE,
                                               rescal.all.models = FALSE,
                                               do.full.models = FALSE,
                                               modeling.id = "alternatus")


##ENSEMBLE MODEL##
alternatusModelEnsemble <- BIOMOD_EnsembleModeling(
  modeling.output = alternatusModelOut_PA_equal,
  chosen.models = grep("GBM","CTA","RF", names(alternatusModelOut_PA_equal)),
  em.by = "PA_dataset+repet",
  eval.metric = "all",
  eval.metric.quality.threshold = NULL,
  prob.mean = TRUE,
  prob.cv = FALSE,
  prob.ci = FALSE,
  prob.ci.alpha = 0.05,
  prob.median = FALSE,
  committee.averaging = FALSE,
  prob.mean.weight = FALSE,
  VarImport = 3,
  prob.mean.weight.decay = 'proportional')


#Get evaluation EM
alternatus.EM.evaluations <- get_evaluations(alternatusModelEnsemble)
sink("alternatus.EM.evaluations.txt")
alternatus.EM.evaluations
sink()




###################################
#### PRODUCE MODEL PROJECTIONS ####
###################################


alternatus.projections <- BIOMOD_Projection(
  modeling.output = alternatusModelOut_PA_equal,
  new.env = env.saved,
  #If you wanted to predict to a different area, or different
  #conditions you would change the above line
  proj.name = "Current",
  selected.models = "all")

alternatus_EnsembleForecasting<- BIOMOD_EnsembleForecasting( alternatusModelEnsemble,
                                                            projection.output = alternatus.projections,
                                                            selected.models = 'all')

# Stack projections
projections <- stack("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/alternatus/Occurrence/proj_Current/proj_Current_Occurrence_ensemble.grd")
names(projections)
plot(projections[[499]]) #Just an example

# Plot average projections for RF, CTA, GBM
#alternatus.training.spdf <- SpatialPoints(coords = alternatus.training, proj4string = crs(environment))

#x11(w=6, h=6) #Windows only
projections.EM <- subset(projections, grep("EM", names(projections)))
names(projections.EM)
projections.EM.mean <- mean(projections.EM)/1000


##For northarrow##

northarrow <- function(loc,size,bearing=0,cols,cex=1,...) {
  # checking arguments
  if(missing(loc)) stop("loc is missing")
  if(missing(size)) stop("size is missing")
  # default colors are white and black
  if(missing(cols)) cols <- rep(c("white","black"),8)
  # calculating coordinates of polygons
  radii <- rep(size/c(1,4,2,4),4)
  x <- radii[(0:15)+1]*cos((0:15)*pi/8+bearing)+loc[1]
  y <- radii[(0:15)+1]*sin((0:15)*pi/8+bearing)+loc[2]
  # drawing polygons
  for (i in 1:15) {
    x1 <- c(x[i],x[i+1],loc[1])
    y1 <- c(y[i],y[i+1],loc[2])
    polygon(x1,y1,col=cols[i])
  }
  # drawing the last polygon
  polygon(c(x[16],x[1],loc[1]),c(y[16],y[1],loc[2]),col=cols[16])
  # drawing letters
  b <- c("E","N","W","S")
  for (i in 0:3) text((size+par("cxy")[1])*cos(bearing+i*pi/2)+loc[1],
                      (size+par("cxy")[2])*sin(bearing+i*pi/2)+loc[2],b[i+1],
                      cex=cex)
}


#Shapes
caa.col <- adjustcolor("#c7e9c0", alpha.f=0.6)
cerr.col <- adjustcolor("#41ab5d", alpha.f=0.7) 
cha.col <- adjustcolor("#a1d99b", alpha=0.7)

#Map
pdf("alternatus.EM.pdf", width = 8.267, height= 11.692, paper="a4")
plot(projections.EM.mean, col = matlab.like(100), main = "EM_Current", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.caatinga, col=caa.col, border="#c7e9c0", lwd = 0.5, add=T)
plot(dis.cerrado, col=cerr.col, border="#41ab5d", lwd = 0.5, add=T)
plot(dis.chaco, col=cha.col, border="#a1d99b", lwd = 0.5, add=T)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
par(new=TRUE)
northarrow(loc= c(-40,5),size= 2)
par(new=TRUE)
scalebar(1000, xy = c(-60,-50), type = 'bar', divs = 4, below = "km", lonlat = NULL)
dev.off()




###############################################
#### EVALUATE MODELS USING PresenceAbsence ####
###############################################

# The function "extract" will get the values from the projection raster for the actual data points
EvalData <- data.frame(extract(projections.EM.mean, alternatus.training.spdf)) #Remember to create the "alternatus.training.spdf" again in case of error    

# Combine the original data and the predictions into a single data frame
EvalData <- cbind(alternatus.training.spdf@data[, 1], EvalData)  

# Rename the columns so they make sense
colnames(EvalData) <- c("PresAbs", "Pred")

# Create a column to serve as an ID field
EvalData$ID <- seq(1, nrow(EvalData), 1)

# Re-order the data as needd by PresenceAbsence package
EvalData <- EvalData[, c(3, 1, 2)]

head(EvalData) #Make sure it looks right
summary(EvalData) #No NAs!

# There might be some NA-values. In this case, remove them to avoid confusion.
EvalData <- na.omit(EvalData)
head(EvalData)
summary(EvalData) 

# Calculate Area Under the Receiver Operating Curve and plot it
library(PresenceAbsence)
auc.roc.plot(EvalData)
optimal.thresholds(EvalData) # Calculate optimal thresholds          #Warning messages:
                                                                     #1: In optimal.thresholds(EvalData) : req.sens defaults to 0.85
                                                                     #2: In optimal.thresholds(EvalData) : req.spec defaults to 0.85
                                                                     #3: In optimal.thresholds(EvalData) : costs assumed to be equal

# Create a column "Class" with the Predicted Probabilities
EvalData$Class <- EvalData$Pred

# Assign all values of "Class" that are greater than or equal to 0.4800000
# (optimal threshold MaxSens+Spec = 0.4800000) to 1 (i.e., predicted presence), and
# all values less than 0.4900000 to 0 (i.e, predicted absence)
EvalData$Class[EvalData$Class >= 0.4800000] <- 1
EvalData$Class[EvalData$Class < 0.4800000] <- 0

# Calculate confusion matrix and threshold dependent metrics of model fit
# Calculate the Confusion Matrix
ConfMat <- cmx(EvalData)       
ConfMat
# Sensitivity
sensitivity(ConfMat)
# Specificity
specificity(ConfMat)
# Kappa
Kappa(ConfMat)




###########################################################
#### CONVERT TO BINARY AND CALCULATE AREA OF OCCUPANCY ####
###########################################################

## Find the threshold to convert continuous values into binary with BIOMOD2
## ************************************************************************

# The function "extract" will get the values from the projection raster for the actual data points
FitData <- extract(projections.EM.mean, alternatus.training.spdf) #Remember to create the "alternatus.training.spdf" again in case of error
head(FitData)
summary(FitData)

ObsData <- alternatus.training.spdf@data[, 1]
head(ObsData)
summary(ObsData)

Find.Optim.Stat(Stat="ROC", FitData, ObsData, Nb.thresh.test=100, Fixed.thresh = NULL)
Find.Optim.Stat(Stat="TSS", FitData, ObsData, Nb.thresh.test=100, Fixed.thresh = NULL)
Find.Optim.Stat(Stat="KAPPA", FitData, ObsData, Nb.thresh.test=100, Fixed.thresh = NULL)


## Find the threshold to convert continuous values into binary with PresenceAbsence
## ********************************************************************************

# The function "extract" will get the values from the projection raster for the actual data points
EvalData <- data.frame(extract(projections.EM.mean, alternatus.training.spdf))

# Combine the original data and the predictions into a single data frame
EvalData <- cbind(alternatus.training.spdf@data[, 1], EvalData)

# Rename the columns so they make sense
colnames(EvalData) <- c("PresAbs", "Pred")

# Create a column to serve as an ID field
EvalData$ID <- seq(1, nrow(EvalData), 1)

# Re-order the data as needd by PresenceAbsence package
EvalData <- EvalData[, c(3, 1, 2)]

head(EvalData) #Make sure it looks right
summary(EvalData) #No NAs!

# There might be some NA-values. In this case, remove them to avoid confusion.
EvalData <- na.omit(EvalData)
head(EvalData)
summary(EvalData) 

# Calculate Area Under the Receiver Operating Curve and plot it
library(PresenceAbsence)
optimal.thresholds(EvalData) # Calculate optimal thresholds      #Warning messages:
                                                                 #2: In optimal.thresholds(EvalData) : req.spec defaults to 0.85
                                                                 #3: In optimal.thresholds(EvalData) : costs assumed to be equal


## Find the threshold to convert continuous values into binary with sdmTools
## *************************************************************************

library(SDMTools)
optim.thresh(ObsData, FitData, threshold = 101)


## Convert to binary
## *****************

projections.EM.mean.binary <- BinaryTransformation(projections.EM.mean, 0.48)
class(projections.EM.mean.binary) #This is a raster layer!
str(values(projections.EM.mean.binary)) #These are only the binary values!
summary(values(projections.EM.mean.binary))

##Create GRID and ASC Files
library(raster)
writeRaster(projections.EM.mean.binary,filename='Occurrence/proj_Current/alternatus.EM.Binary.grd',overwrite=TRUE) #grid
writeRaster(projections.EM.mean.binary,filename='Occurrence/proj_Current/alternatus.EM.Binary.asc',overwrite=TRUE) #Asc

##Create Map

#Map
pdf("alternatus.EM.Binary.pdf", width = 8.267, height= 11.692, paper="a4")
plot(projections.EM.mean.binary,main = "alternatus.EM.Binary", col=colorRampPalette(c("white","red"))(255))
plot(wrld_simpl, add = TRUE, col="transparent", border="Black", lwd = 0.5)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
par(new=TRUE)
northarrow(loc= c(-40,5),size= 2)
par(new=TRUE)
scalebar(1000, xy = c(-60,-50), type = 'bar', divs = 4, below = "km", lonlat = NULL)
dev.off()


## Calculate area of occupancy from binary unprojected area
## ********************************************************

area_EM <- area(projections.EM.mean.binary)
class(area_EM)
str(values(area_EM))            
summary(values(area_EM))

area_total <- data.frame(values(projections.EM.mean.binary), values(area_EM)) #Combine binary and area info for each cell
names(area_total) <- c("Pres_Abs", "Area")
head(area_total)
area_current = tapply(area_total$Area, area_total$Pres_Abs, sum) 
area_current_presence = area_current[2]
area_current_presence                     #Area of occupancy = 3,247,257 km2 (will vary every time!)




#########################################
#### Model projection for the future ####
#########################################

weathermod <- c(env50_26_BC.saved, env50_45_BC.saved, env50_85_BC.saved,
                env50_26_CC.saved, env50_45_CC.saved, env50_85_CC.saved,
                env50_26_CN.saved, env50_45_CN.saved, env50_85_CN.saved,
                env50_26_GS.saved, env50_45_GS.saved, env50_85_GS.saved,
                env50_26_HD.saved, env50_45_HD.saved, env50_85_HD.saved,
                env50_26_IP.saved, env50_45_IP.saved, env50_85_IP.saved,
                env50_26_MI.saved, env50_45_MI.saved, env50_85_MI.saved,
                env50_26_MR.saved, env50_45_MR.saved, env50_85_MR.saved,
                env50_26_MC.saved, env50_45_MC.saved, env50_85_MC.saved,
                env50_26_MP.saved, env50_45_MP.saved, env50_85_MP.saved,
                env50_26_MG.saved, env50_45_MG.saved, env50_85_MG.saved,
                env50_26_NO.saved, env50_45_NO.saved, env50_85_NO.saved,
                env70_26_BC.saved, env70_45_BC.saved, env70_85_BC.saved,
                env70_26_CC.saved, env70_45_CC.saved, env70_85_CC.saved,
                env70_26_CN.saved, env70_45_CN.saved, env70_85_CN.saved,
                env70_26_GS.saved, env70_45_GS.saved, env70_85_GS.saved,
                env70_26_HD.saved, env70_45_HD.saved, env70_85_HD.saved,
                env70_26_IP.saved, env70_45_IP.saved, env70_85_IP.saved,
                env70_26_MI.saved, env70_45_MI.saved, env70_85_MI.saved,
                env70_26_MR.saved, env70_45_MR.saved, env70_85_MR.saved,
                env70_26_MC.saved, env70_45_MC.saved, env70_85_MC.saved,
                env70_26_MP.saved, env70_45_MP.saved, env70_85_MP.saved,
                env70_26_MG.saved, env70_45_MG.saved, env70_85_MG.saved,
                env70_26_NO.saved, env70_45_NO.saved, env70_85_NO.saved)


short <- c("_50_26_BC", "_50_45_BC", "_50_85_BC",
           "_50_26_CC", "_50_45_CC", "_50_85_CC",
           "_50_26_CN", "_50_45_CN", "_50_85_CN",
           "_50_26_GS", "_50_45_GS", "_50_85_GS",
           "_50_26_HD", "_50_45_HD", "_50_85_HD",
           "_50_26_IP", "_50_45_IP", "_50_85_IP",
           "_50_26_MI", "_50_45_MI", "_50_85_MI",
           "_50_26_MR", "_50_45_MR", "_50_85_MR",
           "_50_26_MC", "_50_45_MC", "_50_85_MC",
           "_50_26_MP", "_50_45_MP", "_50_85_MP",
           "_50_26_MG", "_50_45_MG", "_50_85_MG",
           "_50_26_NO", "_50_45_NO", "_50_85_NO",
           "_70_26_BC", "_70_45_BC", "_70_85_BC",
           "_70_26_CC", "_70_45_CC", "_70_85_CC",
           "_70_26_CN", "_70_45_CN", "_70_85_CN",
           "_70_26_GS", "_70_45_GS", "_70_85_GS",
           "_70_26_HD", "_70_45_HD", "_70_85_HD",
           "_70_26_IP", "_70_45_IP", "_70_85_IP",
           "_70_26_MI", "_70_45_MI", "_70_85_MI",
           "_70_26_MR", "_70_45_MR", "_70_85_MR",
           "_70_26_MC", "_70_45_MC", "_70_85_MC",
           "_70_26_MP", "_70_45_MP", "_70_85_MP",
           "_70_26_MG", "_70_45_MG", "_70_85_MG",
           "_70_26_NO", "_70_45_NO", "_70_85_NO")



#Loop Step 1
nam <- NULL
for(k in c(1:length(short))){
  nam[k] <- paste0("ammodytoides.proj", short[k], sep = "")  
  assign(nam[k], BIOMOD_Projection(
    modeling.output = ammodytoidesModelOut_PA_equal,
    new.env = stack(wmod[k]),
    proj.name =  paste0("futuro", short[k] , sep=""),
    selected.models = "all"))
}

#Loop Step 2

lista.bio <- NULL
###find projection files
for(k in 1:length(short)){
  lista.bio[k] <- mixedsort(list.files(paste(getwd(), paste0("/Occurrence/proj_futuro", short[k], sep=""), sep = ""), full.names = T, 
                                       pattern = "Occurrence.grd"))
}

#Loop Step 3
nam2 <- NULL
# Stack projections  
for(k in 1:length(short)){
  nam2[k] <- paste("projections",short[k], sep="")
  assign(nam2[k], stack(lista.bio[k]))
}


lista.proj <- c(projections_50_26_BC, projections_50_45_BC, projections_50_85_BC,
                projections_50_26_CC, projections_50_45_CC, projections_50_85_CC,
                projections_50_26_CN, projections_50_45_CN, projections_50_85_CN,
                projections_50_26_GS, projections_50_45_GS, projections_50_85_GS,
                projections_50_26_HD, projections_50_45_HD, projections_50_85_HD,
                projections_50_26_IP, projections_50_45_IP, projections_50_85_IP,
                projections_50_26_MI, projections_50_45_MI, projections_50_85_MI,
                projections_50_26_MR, projections_50_45_MR, projections_50_85_MR,
                projections_50_26_MC, projections_50_45_MC, projections_50_85_MC,
                projections_50_26_MP, projections_50_45_MP, projections_50_85_MP,
                projections_50_26_MG, projections_50_45_MG, projections_50_85_MG,
                projections_50_26_NO, projections_50_45_NO, projections_50_85_NO,
                projections_70_26_BC, projections_70_45_BC, projections_70_85_BC,
                projections_70_26_CC, projections_70_45_CC, projections_70_85_CC,
                projections_70_26_CN, projections_70_45_CN, projections_70_85_CN,
                projections_70_26_GS, projections_70_45_GS, projections_70_85_GS,
                projections_70_26_HD, projections_70_45_HD, projections_70_85_HD,
                projections_70_26_IP, projections_70_45_IP, projections_70_85_IP,
                projections_70_26_MI, projections_70_45_MI, projections_70_85_MI,
                projections_70_26_MR, projections_70_45_MR, projections_70_85_MR,
                projections_70_26_MC, projections_70_45_MC, projections_70_85_MC,
                projections_70_26_MP, projections_70_45_MP, projections_70_85_MP,
                projections_70_26_MG, projections_70_45_MG, projections_70_85_MG,
                projections_70_26_NO, projections_70_45_NO, projections_70_85_NO)



nam3 <- NULL
for(o in lista.proj){
  for(k in 1:length(short)){
    nam3[k] <- paste0("projections",short[k],".mean", sep="")
    assign(nam3[k], mean(o)/1000)
  }
}


#Loop Step 4
#Maps
library(colorRamps)
library(maptools)
data("wrld_simpl")

lista.mean <- c(projections_50_26_BC.mean, projections_50_45_BC.mean, projections_50_85_BC.mean,
                projections_50_26_CC.mean, projections_50_45_CC.mean, projections_50_85_CC.mean,
                projections_50_26_CN.mean, projections_50_45_CN.mean, projections_50_85_CN.mean,
                projections_50_26_GS.mean, projections_50_45_GS.mean, projections_50_85_GS.mean,
                projections_50_26_HD.mean, projections_50_45_HD.mean, projections_50_85_HD.mean,
                projections_50_26_IP.mean, projections_50_45_IP.mean, projections_50_85_IP.mean,
                projections_50_26_MI.mean, projections_50_45_MI.mean, projections_50_85_MI.mean,
                projections_50_26_MR.mean, projections_50_45_MR.mean, projections_50_85_MR.mean,
                projections_50_26_MC.mean, projections_50_45_MC.mean, projections_50_85_MC.mean,
                projections_50_26_MP.mean, projections_50_45_MP.mean, projections_50_85_MP.mean,
                projections_50_26_MG.mean, projections_50_45_MG.mean, projections_50_85_MG.mean,
                projections_50_26_NO.mean, projections_50_45_NO.mean, projections_50_85_NO.mean,
                projections_70_26_BC.mean, projections_70_45_BC.mean, projections_70_85_BC.mean,
                projections_70_26_CC.mean, projections_70_45_CC.mean, projections_70_85_CC.mean,
                projections_70_26_CN.mean, projections_70_45_CN.mean, projections_70_85_CN.mean,
                projections_70_26_GS.mean, projections_70_45_GS.mean, projections_70_85_GS.mean,
                projections_70_26_HD.mean, projections_70_45_HD.mean, projections_70_85_HD.mean,
                projections_70_26_IP.mean, projections_70_45_IP.mean, projections_70_85_IP.mean,
                projections_70_26_MI.mean, projections_70_45_MI.mean, projections_70_85_MI.mean,
                projections_70_26_MR.mean, projections_70_45_MR.mean, projections_70_85_MR.mean,
                projections_70_26_MC.mean, projections_70_45_MC.mean, projections_70_85_MC.mean,
                projections_70_26_MP.mean, projections_70_45_MP.mean, projections_70_85_MP.mean,
                projections_70_26_MG.mean, projections_70_45_MG.mean, projections_70_85_MG.mean,
                projections_70_26_NO.mean, projections_70_45_NO.mean, projections_70_85_NO.mean)



for(s in lista.mean){
  for(k in 1:length(short)){
    source("northarrow.R") 
    pdf(paste0("ammodytoides",short[k], ".pdf", sep=""), width = 8.267, height= 11.692, paper="a4")   
    plot(s, col = matlab.like(100), main = short[k], las = 1, ylim=c(-60, 15), xlim=c(-85, -30))
    plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
    plot(dis.caatinga, col=caa.col, border="#c7e9c0", lwd = 0.5, add=T)
    plot(dis.cerrado, col=cerr.col, border="#41ab5d", lwd = 0.5, add=T)
    plot(dis.chaco, col=cha.col, border="#a1d99b", lwd = 0.5, add=T)
    points(ammodytoides$lon, ammodytoides$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
    par(new=TRUE)
    northarrow(loc= c(-40,5),size= 2)
    par(new=TRUE)
    scalebar(1000, xy = c(-60,-50), type = 'bar', divs = 4, below = "km", lonlat = NULL)
    dev.off()
  }
}



#Loop Step 5
## Convert to binary

nam4 <- NULL
for(s in lista.mean){
  for(k in 1:length(short)){
    nam4[k] <- paste0("projections", short[k], ".binary", sep="")
    assign(nam4[k], BinaryTransformation(s, 0.48))
  }
}

##Create GRID and ASC Files
library(raster)

list.binary <- c(projections_50_26_BC.binary, projections_50_45_BC.binary, projections_50_85_BC.binary,
                 projections_50_26_CC.binary, projections_50_45_CC.binary, projections_50_85_CC.binary,
                 projections_50_26_CN.binary, projections_50_45_CN.binary, projections_50_85_CN.binary,
                 projections_50_26_GS.binary, projections_50_45_GS.binary, projections_50_85_GS.binary,
                 projections_50_26_HD.binary, projections_50_45_HD.binary, projections_50_85_HD.binary,
                 projections_50_26_IP.binary, projections_50_45_IP.binary, projections_50_85_IP.binary,
                 projections_50_26_MI.binary, projections_50_45_MI.binary, projections_50_85_MI.binary,
                 projections_50_26_MR.binary, projections_50_45_MR.binary, projections_50_85_MR.binary,
                 projections_50_26_MC.binary, projections_50_45_MC.binary, projections_50_85_MC.binary,
                 projections_50_26_MP.binary, projections_50_45_MP.binary, projections_50_85_MP.binary,
                 projections_50_26_MG.binary, projections_50_45_MG.binary, projections_50_85_MG.binary,
                 projections_50_26_NO.binary, projections_50_45_NO.binary, projections_50_85_NO.binary,
                 projections_70_26_BC.binary, projections_70_45_BC.binary, projections_70_85_BC.binary,
                 projections_70_26_CC.binary, projections_70_45_CC.binary, projections_70_85_CC.binary,
                 projections_70_26_CN.binary, projections_70_45_CN.binary, projections_70_85_CN.binary,
                 projections_70_26_GS.binary, projections_70_45_GS.binary, projections_70_85_GS.binary,
                 projections_70_26_HD.binary, projections_70_45_HD.binary, projections_70_85_HD.binary,
                 projections_70_26_IP.binary, projections_70_45_IP.binary, projections_70_85_IP.binary,
                 projections_70_26_MI.binary, projections_70_45_MI.binary, projections_70_85_MI.binary,
                 projections_70_26_MR.binary, projections_70_45_MR.binary, projections_70_85_MR.binary,
                 projections_70_26_MC.binary, projections_70_45_MC.binary, projections_70_85_MC.binary,
                 projections_70_26_MP.binary, projections_70_45_MP.binary, projections_70_85_MP.binary,
                 projections_70_26_MG.binary, projections_70_45_MG.binary, projections_70_85_MG.binary,
                 projections_70_26_NO.binary, projections_70_45_NO.binary, projections_70_85_NO.binary)

for(n in list.binary){
  for(k in 1:length(short)){
    writeRaster(n, filename= paste0("ammodytoides.Binary.",short[k],".grd", sep=""), overwrite=TRUE) #grid
    writeRaster(n, filename= paste0("ammodytoides.Binary.",short[k],".asc", sep=""),overwrite=TRUE) #Asc
  }
}  

##Create Map
#Map
for(k in 1:length(short)){
  pdf(paste0("ammodytoides.Binary",short[k],".pdf", sep=""), width = 8.267, height= 11.692, paper="a4")
  plot(n, main = paste0("ammodytoides", short[k], ".Binary", sep=""), col=colorRampPalette(c("white","red"))(255), ylim=c(-60, 15), xlim=c(-85, -30))
  plot(wrld_simpl, add = TRUE, col="transparent", border="Black", lwd = 0.5)
  points(ammodytoides$lon, ammodytoides$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
  par(new=TRUE)
  northarrow(loc= c(-40,5),size= 2)
  par(new=TRUE)
  scalebar(1000, xy = c(-60,-50), type = 'bar', divs = 4, below = "km", lonlat = NULL)
  dev.off()
}

#Loop Step 5
## Calculate area of occupancy from binary unprojected area


nam5 <- NULL

for(k in 1:length(short)){
  nam5[k] <- paste0("area", short[k], sep="")
  assign(nam5[k], area(n))
}    

list.areas <- c(area_50_26_BC, area_50_45_BC, area_50_85_BC,
                area_50_26_CC, area_50_45_CC, area_50_85_CC,
                area_50_26_CN, area_50_45_CN, area_50_85_CN,
                area_50_26_GS, area_50_45_GS, area_50_85_GS,
                area_50_26_HD, area_50_45_HD, area_50_85_HD,
                area_50_26_IP, area_50_45_IP, area_50_85_IP,
                area_50_26_MI, area_50_45_MI, area_50_85_MI,
                area_50_26_MR, area_50_45_MR, area_50_85_MR,
                area_50_26_MC, area_50_45_MC, area_50_85_MC,
                area_50_26_MP, area_50_45_MP, area_50_85_MP,
                area_50_26_MG, area_50_45_MG, area_50_85_MG,
                area_50_26_NO, area_50_45_NO, area_50_85_NO,
                area_70_26_BC, area_70_45_BC, area_70_85_BC,
                area_70_26_CC, area_70_45_CC, area_70_85_CC,
                area_70_26_CN, area_70_45_CN, area_70_85_CN,
                area_70_26_GS, area_70_45_GS, area_70_85_GS,
                area_70_26_HD, area_70_45_HD, area_70_85_HD,
                area_70_26_IP, area_70_45_IP, area_70_85_IP,
                area_70_26_MI, area_70_45_MI, area_70_85_MI,
                area_70_26_MR, area_70_45_MR, area_70_85_MR,
                area_70_26_MC, area_70_45_MC, area_70_85_MC,
                area_70_26_MP, area_70_45_MP, area_70_85_MP,
                area_70_26_MG, area_70_45_MG, area_70_85_MG,
                area_70_26_NO, area_70_45_NO, area_70_85_NO)


nam6 <- NULL

for(a in list.areas){   
  for(k in 1:length(short)){
    for(n in list.binary){
      nam6[k] <- paste0("area_total", short[k], sep="")
      assign(nam6[k], data.frame(Pres_Abs=list.binary[[k]]@data@values, Area=list.areas[[k]]@data@values)) #Combine binary and area info for each cell
    }  
  } 
}


nam7 <- character(length(short))


list.area.tot <- c(area_total_50_26_BC, area_total_50_45_BC, area_total_50_85_BC,
                   area_total_50_26_CC, area_total_50_45_CC, area_total_50_85_CC,
                   area_total_50_26_CN, area_total_50_45_CN, area_total_50_85_CN,
                   area_total_50_26_GS, area_total_50_45_GS, area_total_50_85_GS,
                   area_total_50_26_HD, area_total_50_45_HD, area_total_50_85_HD,
                   area_total_50_26_IP, area_total_50_45_IP, area_total_50_85_IP,
                   area_total_50_26_MI, area_total_50_45_MI, area_total_50_85_MI,
                   area_total_50_26_MR, area_total_50_45_MR, area_total_50_85_MR,
                   area_total_50_26_MC, area_total_50_45_MC, area_total_50_85_MC,
                   area_total_50_26_MP, area_total_50_45_MP, area_total_50_85_MP,
                   area_total_50_26_MG, area_total_50_45_MG, area_total_50_85_MG,
                   area_total_50_26_NO, area_total_50_45_NO, area_total_50_85_NO,
                   area_total_70_26_BC, area_total_70_45_BC, area_total_70_85_BC,
                   area_total_70_26_CC, area_total_70_45_CC, area_total_70_85_CC,
                   area_total_70_26_CN, area_total_70_45_CN, area_total_70_85_CN,
                   area_total_70_26_GS, area_total_70_45_GS, area_total_70_85_GS,
                   area_total_70_26_HD, area_total_70_45_HD, area_total_70_85_HD,
                   area_total_70_26_IP, area_total_70_45_IP, area_total_70_85_IP,
                   area_total_70_26_MI, area_total_70_45_MI, area_total_70_85_MI,
                   area_total_70_26_MR, area_total_70_45_MR, area_total_70_85_MR,
                   area_total_70_26_MC, area_total_70_45_MC, area_total_70_85_MC,
                   area_total_70_26_MP, area_total_70_45_MP, area_total_70_85_MP,
                   area_total_70_26_MG, area_total_70_45_MG, area_total_70_85_MG,
                   area_total_70_26_NO, area_total_70_45_NO, area_total_70_85_NO)


for(t in list.area.tot){
  for(k in 1:length(short)){
    nam7[k] <- paste0("area", short[k], sep="")
    assign(nam7[k], tapply(t[k[2]], t[k[1]], sum))
  }
}

list.presence <- c(area_futuro_50_26_BC, area_futuro_50_45_BC, area_futuro_50_85_BC,
                   area_futuro_50_26_CC, area_futuro_50_45_CC, area_futuro_50_85_CC,
                   area_futuro_50_26_CN, area_futuro_50_45_CN, area_futuro_50_85_CN,
                   area_futuro_50_26_GS, area_futuro_50_45_GS, area_futuro_50_85_GS,
                   area_futuro_50_26_HD, area_futuro_50_45_HD, area_futuro_50_85_HD,
                   area_futuro_50_26_IP, area_futuro_50_45_IP, area_futuro_50_85_IP,
                   area_futuro_50_26_MI, area_futuro_50_45_MI, area_futuro_50_85_MI,
                   area_futuro_50_26_MR, area_futuro_50_45_MR, area_futuro_50_85_MR,
                   area_futuro_50_26_MC, area_futuro_50_45_MC, area_futuro_50_85_MC,
                   area_futuro_50_26_MP, area_futuro_50_45_MP, area_futuro_50_85_MP,
                   area_futuro_50_26_MG, area_futuro_50_45_MG, area_futuro_50_85_MG,
                   area_futuro_50_26_NO, area_futuro_50_45_NO, area_futuro_50_85_NO,
                   area_futuro_70_26_BC, area_futuro_70_45_BC, area_futuro_70_85_BC,
                   area_futuro_70_26_CC, area_futuro_70_45_CC, area_futuro_70_85_CC,
                   area_futuro_70_26_CN, area_futuro_70_45_CN, area_futuro_70_85_CN,
                   area_futuro_70_26_GS, area_futuro_70_45_GS, area_futuro_70_85_GS,
                   area_futuro_70_26_HD, area_futuro_70_45_HD, area_futuro_70_85_HD,
                   area_futuro_70_26_IP, area_futuro_70_45_IP, area_futuro_70_85_IP,
                   area_futuro_70_26_MI, area_futuro_70_45_MI, area_futuro_70_85_MI,
                   area_futuro_70_26_MR, area_futuro_70_45_MR, area_futuro_70_85_MR,
                   area_futuro_70_26_MC, area_futuro_70_45_MC, area_futuro_70_85_MC,
                   area_futuro_70_26_MP, area_futuro_70_45_MP, area_futuro_70_85_MP,
                   area_futuro_70_26_MG, area_futuro_70_45_MG, area_futuro_70_85_MG,
                   area_futuro_70_26_NO, area_futuro_70_45_NO, area_futuro_70_85_NO)

nam8 <- NULL
for(p in list.presence){
  for(k in 1:length(short)){
    nam8[k] <- paste0("area", short[k], "_presence")
    assign(nam8[k], list.presence[k[2]])
    #area_2050_rcp26_presence   #Area of occupancy = 1,192,400 km2 (will vary every time!)
  }
}


##############################################################################################################################
##############
#### 2050 ####
##############

#Fazer um loop aqui para rodar os 12 GCM's com os 3 cenários escolhidos (26/45/85)

##2050_rcp26##

alternatus.projections <- BIOMOD_Projection(
  modeling.output = alternatusModelOut_PA_equal,
  new.env = env50_26.saved,
  proj.name = "EM.2050_rcp26",
  selected.models = "all")

# Stack projections                          
projections.EM_2050_rcp26 <- stack("c:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/Occurrence/proj_EM.2050_rcp26/proj_EM.2050_rcp26_Occurrence.grd")
names(projections.EM_2050_rcp26)
plot(projections.EM_2050_rcp26[[100]]) #Just an example

# Plot average projections for EM
alternatus.training.spdf <- SpatialPoints(coords = alternatus.training, proj4string = crs(environment))

#x11(w=6, h=6) #Windows only
# projections.EM <- subset(projections, grep("EM", names(projections)))
# names(projections.EM)

caa.col <- adjustcolor("#31a354", alpha.f=0.6)
cerr.col <- adjustcolor("#74c476", alpha.f=0.7) 
cha.col <- adjustcolor("#bae4b3", alpha=0.7)

pdf("alternatus_2050_rcp26.pdf", width = 8.267, height= 11.692, paper="a4")
projections.EM_2050_rcp26.mean <- mean(projections.EM_2050_rcp26)/1000
plot(projections.EM_2050_rcp26.mean, col = matlab.like(100), main = "RF 2050 rcp 26", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.caatinga, col=caa.col, border="#31a354", lwd = 0.5, add=T)
plot(dis.cerrado, col=cerr.col, border="#74c476", lwd = 0.5, add=T)
plot(dis.chaco, col=cha.col, border="#bae4b3", lwd = 0.5, add=T)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
dev.off()


## Convert to binary
## *****************

projections.EM_2050_rcp26.mean.binary <- BinaryTransformation(projections.EM_2050_rcp26.mean, 0.92)
class(projections.EM_2050_rcp26.mean.binary) #This is a raster layer!
str(values(projections.EM_2050_rcp26.mean.binary)) #These are only the binary values!
summary(values(projections.EM_2050_rcp26.mean.binary))


## Calculate area of occupancy from binary unprojected area
## ********************************************************

area_EM_2050_rcp26 <- area(projections.EM_2050_rcp26.mean.binary)
class(area_EM_2050_rcp26)
str(values(area_EM_2050_rcp26))
summary(values(area_EM_2050_rcp26))

area_total_EM_2050_rcp26 <- data.frame(values(projections.EM_2050_rcp26.mean.binary), values(area_EM_2050_rcp26)) #Combine binary and area info for each cell
names(area_total_EM_2050_rcp26) <- c("Pres_Abs", "Area")
head(area_total_EM_2050_rcp26)
area_2050_rcp26 = tapply(area_total_EM_2050_rcp26$Area, area_total_EM_2050_rcp26$Pres_Abs, sum) 
area_2050_rcp26_presence = area_2050_rcp45[2]
area_2050_rcp26_presence   #Area of occupancy = 1,192,400 km2 (will vary every time!)

#Criar um mapa aqui e salvar um ASC...


##2050_rcp45##

alternatus.projections <- BIOMOD_Projection(
  modeling.output = alternatusModelOut_PA_equal,
  new.env = env50_45.saved,
  proj.name = "EM.2050_rcp45",
  selected.models = "all")

# Stack projections                          
projections.EM_2050_rcp45 <- stack("c:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/Occurrence/proj_EM.2050_rcp45/proj_EM.2050_rcp45_Occurrence.grd")
names(projections.EM_2050_rcp45)
plot(projections.EM_2050_rcp45[[100]]) #Just an example

# Plot average projections for EM
alternatus.training.spdf <- SpatialPoints(coords = alternatus.training, proj4string = crs(environment))

#x11(w=6, h=6) #Windows only
# projections.EM <- subset(projections, grep("EM", names(projections)))
# names(projections.EM)

caa.col <- adjustcolor("#31a354", alpha.f=0.6)
cerr.col <- adjustcolor("#74c476", alpha.f=0.7) 
cha.col <- adjustcolor("#bae4b3", alpha=0.7)

pdf("alternatus_2050_rcp45.pdf", width = 8.267, height= 11.692, paper="a4")
projections.EM_2050_rcp45.mean <- mean(projections.EM_2050_rcp45)/1000
plot(projections.EM_2050_rcp45.mean, col = matlab.like(100), main = "RF 2050 rcp 45", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.caatinga, col=caa.col, border="#31a354", lwd = 0.5, add=T)
plot(dis.cerrado, col=cerr.col, border="#74c476", lwd = 0.5, add=T)
plot(dis.chaco, col=cha.col, border="#bae4b3", lwd = 0.5, add=T)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
dev.off()


## Convert to binary
## *****************

projections.EM_2050_rcp45.mean.binary <- BinaryTransformation(projections.EM_2050_rcp45.mean, 0.92)
class(projections.EM_2050_rcp45.mean.binary) #This is a raster layer!
str(values(projections.EM_2050_rcp45.mean.binary)) #These are only the binary values!
summary(values(projections.EM_2050_rcp45.mean.binary))


## Calculate area of occupancy from binary unprojected area
## ********************************************************

area_EM_2050_rcp45 <- area(projections.EM_2050_rcp45.mean.binary)
class(area_EM_2050_rcp45)
str(values(area_EM_2050_rcp45))
summary(values(area_EM_2050_rcp45))

area_total_EM_2050_rcp45 <- data.frame(values(projections.EM_2050_rcp45.mean.binary), values(area_EM_2050_rcp45)) #Combine binary and area info for each cell
names(area_total_EM_2050_rcp45) <- c("Pres_Abs", "Area")
head(area_total_EM_2050_rcp45)
area_2050_rcp45 = tapply(area_total_EM_2050_rcp45$Area, area_total_EM_2050_rcp45$Pres_Abs, sum) 
area_2050_rcp45_presence = area_2050_rcp45[2]
area_2050_rcp45_presence  #Area of occupancy = 1,299,410 km2 (will vary every time!)

#Criar um mapa aqui e salvar um ASC...

##2050_rcp85##

alternatus.projections <- BIOMOD_Projection(
	modeling.output = alternatusModelOut_PA_equal,
	new.env = env50_85.saved,
	proj.name = "EM.2050_rcp85",
	selected.models = "all")

# Stack projections                          
projections.EM_2050_rcp85 <- stack("c:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/Occurrence/proj_EM.2050_rcp85/proj_EM.2050_rcp85_Occurrence.grd")
names(projections.EM_2050_rcp85)
plot(projections.EM_2050_rcp85[[100]]) #Just an example

# Plot average projections for EM
alternatus.training.spdf <- SpatialPoints(coords = alternatus.training, proj4string = crs(environment))

#x11(w=6, h=6) #Windows only
# projections.EM <- subset(projections, grep("EM", names(projections)))
# names(projections.EM)

caa.col <- adjustcolor("#31a354", alpha.f=0.6)
cerr.col <- adjustcolor("#74c476", alpha.f=0.7) 
cha.col <- adjustcolor("#bae4b3", alpha=0.7)

pdf("alternatus_2050_rcp85.pdf", width = 8.267, height= 11.692, paper="a4")
projections.EM_2050_rcp85.mean <- mean(projections.EM_2050_rcp85)/1000
plot(projections.EM_2050_rcp85.mean, col = matlab.like(100), main = "RF 2050 rcp 85", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.caatinga, col=caa.col, border="#31a354", lwd = 0.5, add=T)
plot(dis.cerrado, col=cerr.col, border="#74c476", lwd = 0.5, add=T)
plot(dis.chaco, col=cha.col, border="#bae4b3", lwd = 0.5, add=T)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
dev.off()


## Convert to binary
## *****************

projections.EM_2050_rcp85.mean.binary <- BinaryTransformation(projections.EM_2050_rcp85.mean, 0.92)
class(projections.EM_2050_rcp85.mean.binary) #This is a raster layer!
str(values(projections.EM_2050_rcp85.mean.binary)) #These are only the binary values!
summary(values(projections.EM_2050_rcp85.mean.binary))


## Calculate area of occupancy from binary unprojected area
## ********************************************************

area_EM_2050_rcp85 <- area(projections.EM_2050_rcp85.mean.binary)
class(area_EM_2050_rcp85)
str(values(area_EM_2050_rcp85))
summary(values(area_EM_2050_rcp85))

area_total_EM_2050_rcp85 <- data.frame(values(projections.EM_2050_rcp85.mean.binary), values(area_EM_2050_rcp85)) #Combine binary and area info for each cell
names(area_total_EM_2050_rcp85) <- c("Pres_Abs", "Area")
head(area_total_EM_2050_rcp85)
area_2050_rcp85 = tapply(area_total_EM_2050_rcp85$Area, area_total_EM_2050_rcp85$Pres_Abs, sum) 
area_2050_rcp85_presence = area_2050_rcp45[2]
area_2050_rcp85_presence   #Area of occupancy = 1,192,400 km2 (will vary every time!)

#Criar um mapa aqui e salvar um ASC...


## Calculating the diference between present and future areas 
## ********************************************************

predict_area_2050_rcp85 =log(area_2050_rcp85_presence/area_current_presence)  #Aqui dá erro. É - ou /? Pq log?
predict_area_2050_rcp26 # result = -0.01589181, -32181.2 km2
predict_area_2050_rcp45 # result = -0.1000519,  -194337 km2
predict_area_2050_rcp85 # result = -0.3275401,  -570104.8 km2



##############
#### 2070 ####
##############

#Fazer um loop aqui para rodar os 14 GCM's com os 3 cenários escolhidos (26/45/85)

##2070_rcp26##

alternatus.projections_2070_26 <- BIOMOD_Projection(
	modeling.output = alternatusModelOut_PA_equal,
	new.env = env70_26.saved,
	#If you wanted to predict to a different area, or different
	#conditions you would change the above line
	proj.name = "EM.2070_rcp26",
	selected.models = "all")

# Stack projections
projections.EM_2070_rcp26 <- stack("c:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/Occurrence/proj_EM.2070_rcp26/proj_EM.2070_rcp26_Occurrence.grd")
names(projections.EM_2070_rcp26)
plot(projections.EM_2070_rcp26[[99]]) #Just an example


# Plot average projections for EM 
alternatus.training.spdf <- SpatialPoints(coords = alternatus.training, proj4string = crs(environment))

pdf("alternatus_2070_rcp26.pdf", width = 8.267, height= 11.692, paper="a4")
projections.EM_2070_rcp26.mean <- mean(projections.EM_2070_rcp26)/1000
plot(projections.EM_2070_rcp26.mean, col = matlab.like(100), main = "RF 2070 rcp 26", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.caatinga, col=caa.col, border="#31a354", lwd = 0.5, add=T)
plot(dis.cerrado, col=cerr.col, border="#74c476", lwd = 0.5, add=T)
plot(dis.chaco, col=cha.col, border="#bae4b3", lwd = 0.5, add=T)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
dev.off()

## Convert to binary
## *****************

projections.EM_2070_rcp26.mean.binary <- BinaryTransformation(projections.EM_2070_rcp26.mean, 0.92)
class(projections.EM_2070_rcp26.mean.binary ) #This is a raster layer!
str(values(projections.EM_2070_rcp26.mean.binary )) #These are only the binary values!
summary(values(projections.EM_2070_rcp26.mean.binary ))

## Calculate area of occupancy from binary unprojected area
## ********************************************************

area_EM_2070_rcp26 <- area(projections.EM_2070_rcp26.mean.binary )
class(area_EM_2070_rcp26)
str(values(area_EM_2070_rcp26))
summary(values(area_EM_2070_rcp26))

area_total_EM_2070_rcp26 <- data.frame(values(projections.EM_2070_rcp26.mean.binary ), values(area_EM_2070_rcp26)) #Combine binary and area info for each cell
names(area_total_EM_2070_rcp26) <- c("Pres_Abs", "Area")
head(area_total_EM_2070_rcp26)
area_2070_rcp26_total = tapply(area_total_EM_2070_rcp26$Area, area_total_EM_2070_rcp26$Pres_Abs, sum) 
area_2070_rcp26_total_presence = area_2070_rcp26_total[2]
area_2070_rcp26_total_presence   #Area of occupancy = 1,640,932 km2 (will vary every time!)

#Criar um mapa aqui e salvar um ASC...

##2070_rcp45##

alternatus.projections_2070_45 <- BIOMOD_Projection(
  modeling.output = alternatusModelOut_PA_equal,
  new.env = env70_45.saved,
  #If you wanted to predict to a different area, or different
  #conditions you would change the above line
  proj.name = "EM.2070_rcp45",
  selected.models = "all")

# Stack projections
projections.EM_2070_rcp45 <- stack("c:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/Occurrence/proj_EM.2070_rcp45/proj_EM.2070_rcp45_Occurrence.grd")
names(projections.EM_2070_rcp45)
plot(projections.EM_2070_rcp45[[99]]) #Just an example


# Plot average projections for EM 
alternatus.training.spdf <- SpatialPoints(coords = alternatus.training, proj4string = crs(environment))

pdf("alternatus_2070_rcp45.pdf", width = 8.267, height= 11.692, paper="a4")
projections.EM_2070_rcp45.mean <- mean(projections.EM_2070_rcp45)/1000
plot(projections.EM_2070_rcp45.mean, col = matlab.like(100), main = "RF 2070 rcp 45", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.caatinga, col=caa.col, border="#31a354", lwd = 0.5, add=T)
plot(dis.cerrado, col=cerr.col, border="#74c476", lwd = 0.5, add=T)
plot(dis.chaco, col=cha.col, border="#bae4b3", lwd = 0.5, add=T)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
dev.off()

## Convert to binary
## *****************

projections.EM_2070_rcp45.mean.binary <- BinaryTransformation(projections.EM_2070_rcp45.mean, 0.92)
class(projections.EM_2070_rcp45.mean.binary ) #This is a raster layer!
str(values(projections.EM_2070_rcp45.mean.binary )) #These are only the binary values!
summary(values(projections.EM_2070_rcp45.mean.binary ))

## Calculate area of occupancy from binary unprojected area
## ********************************************************

area_EM_2070_rcp45 <- area(projections.EM_2070_rcp45.mean.binary )
class(area_EM_2070_rcp45)
str(values(area_EM_2070_rcp45))
summary(values(area_EM_2070_rcp45))

area_total_EM_2070_rcp45 <- data.frame(values(projections.EM_2070_rcp45.mean.binary ), values(area_EM_2070_rcp45)) #Combine binary and area info for each cell
names(area_total_EM_2070_rcp45) <- c("Pres_Abs", "Area")
head(area_total_EM_2070_rcp45)
area_2070_rcp45_total = tapply(area_total_EM_2070_rcp45$Area, area_total_EM_2070_rcp45$Pres_Abs, sum) #Area of occupancy = 2,041,151 km2 (will vary every time!)
area_2070_rcp45_total_presence = area_2070_rcp45_total[2]
area_2070_rcp45_total_presence

#Criar um mapa aqui e salvar um ASC...

##2070_rcp85##

alternatus.projections_2070_85 <- BIOMOD_Projection(
  modeling.output = alternatusModelOut_PA_equal,
  new.env = env70_85.saved,
  #If you wanted to predict to a different area, or different
  #conditions you would change the above line
  proj.name = "EM.2070_rcp85",
  selected.models = "all")

# Stack projections
projections.EM_2070_rcp85 <- stack("c:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/Occurrence/proj_EM.2070_rcp85/proj_EM.2070_rcp85_Occurrence.grd")
names(projections.EM_2070_rcp85)
plot(projections.EM_2070_rcp85[[99]]) #Just an example


# Plot average projections for EM 
alternatus.training.spdf <- SpatialPoints(coords = alternatus.training, proj4string = crs(environment))

pdf("alternatus_2070_rcp85.pdf", width = 8.267, height= 11.692, paper="a4")
projections.EM_2070_rcp85.mean <- mean(projections.EM_2070_rcp85)/1000
plot(projections.EM_2070_rcp85.mean, col = matlab.like(100), main = "RF 2070 rcp 85", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.caatinga, col=caa.col, border="#31a354", lwd = 0.5, add=T)
plot(dis.cerrado, col=cerr.col, border="#74c476", lwd = 0.5, add=T)
plot(dis.chaco, col=cha.col, border="#bae4b3", lwd = 0.5, add=T)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
dev.off()

## Convert to binary
## *****************

projections.EM_2070_rcp85.mean.binary <- BinaryTransformation(projections.EM_2070_rcp85.mean, 0.92)
class(projections.EM_2070_rcp85.mean.binary ) #This is a raster layer!
str(values(projections.EM_2070_rcp85.mean.binary )) #These are only the binary values!
summary(values(projections.EM_2070_rcp85.mean.binary ))

## Calculate area of occupancy from binary unprojected area
## ********************************************************

area_EM_2070_rcp85 <- area(projections.EM_2070_rcp85.mean.binary )
class(area_EM_2070_rcp85)
str(values(area_EM_2070_rcp85))
summary(values(area_EM_2070_rcp85))

area_total_EM_2070_rcp85 <- data.frame(values(projections.EM_2070_rcp85.mean.binary ), values(area_EM_2070_rcp85)) #Combine binary and area info for each cell
names(area_total_EM_2070_rcp85) <- c("Pres_Abs", "Area")
head(area_total_EM_2070_rcp85)
area_2070_rcp85_total = tapply(area_total_EM_2070_rcp85$Area, area_total_EM_2070_rcp85$Pres_Abs, sum) #Area of occupancy = 2,041,151 km2 (will vary every time!)
area_2070_rcp85_total_presence = area_2070_rcp85_total[2]
area_2070_rcp85_total_presence

#Criar um mapa aqui e salvar um ASC...

## Calculating the diference between present and future areas 
## ********************************************************
predict_area_2070_rcp26 =log(area_2070_rcp26_total_presence/area_current_presence )

predict_area_2070_rcp26 # result = -0.05286374, - 107598.9 km2
predict_area_2070_rcp45 # result = -0.3725469, - 649936 km2
predict_area_2070_rcp85 # result = -0.5381555, - 869672.2 km2










