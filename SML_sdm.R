###############################
#### SET WORKING DIRECTORY ####
###############################

# Clean everything that was loaded before
rm(list=ls())


# My directory
setwd("D:/Dropbox/Dropbox/Doutorado/Gis/Modelado/Futuro/alternatus")




#Rotate this part only in the first time, after that skip to "LOAD SAVED RASTERS"
###########################################################################################################################
###########################################################################################################################



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


# Stack environmental layers
environment <- stack(alt.crop, mean(tmin.crop), mean(tmax.crop), mean(tmean.crop), mean(prec.crop), bio.crop)


# Name variables (present)
names(environment) <- c("alt", "tmin", "tmax", "tmean", "prec", "bio1", "bio2", "bio3",
                        "bio4", "bio5", "bio6", "bio7", "bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
                        "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment)


# Optional: add NDVI raster to stack
# ndvi.raster <- raster("ndvi2010_5kmwgs84.asc")
# projection(ndvi.raster) <- "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"
# ndvi.crop <- crop(ndvi.raster, ext)
# ndvi.crop.s <- resample(ndvi.crop, altitude.crop, method="bilinear")
# environment <- stack(ndvi.crop.s, environment)


# Make sure the layer Names (rasterStack) perfectly
# match with the names of variables used to build the models




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


## Get WorldClim layers for future for all GCMs (with rcp 26, 45 and 85 to compare), only selected
## environmental variables. GCMs selected: BC, CC, CN, GF, GS, HD, HE, IP, MI, MR, MC, "MP", MG, NO
#  ************************************************************************************************

# Parallel processing
library(foreach)
library(doParallel)

cl <- makeCluster(detectCores(7)) # number of cores in computer
registerDoParallel(cl)
getDoParWorkers()

GCM <- c("BC", "CC", "CN", "GS", "HD", "IP", "MI", "MR", "MC", "MP", "MG", "NO")  #GCM - ("GF"-50_85/70_85, "HE"-50_26/70_26) - reading problem

GCM.raster.list <- list()


## Get WorldClim layers - "INSERT foreach ???"
for (i in 1:length(GCM)) {
  
  bio50.26 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = GCM[i], year = 50)
  bio50.45 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = GCM[i], year = 50)
  bio50.85 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = GCM[i], year = 50)
  
  bio70.26 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = GCM[i], year = 70)
  bio70.45 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = GCM[i], year = 70)
  bio70.85 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = GCM[i], year = 70)
  
  
  # Crop WorldClim layers
  bio50.26.crop <- crop(bio50.26, ext)
  bio50.45.crop <- crop(bio50.45, ext)
  bio50.85.crop <- crop(bio50.85, ext)
  
  bio70.26.crop <- crop(bio70.26, ext)
  bio70.45.crop <- crop(bio70.45, ext)
  bio70.85.crop <- crop(bio70.85, ext)
  
  
  # Stack environmental layers
  environment50.26 <- stack(alt.crop, bio50.26.crop)
  environment50.45 <- stack(alt.crop, bio50.45.crop)
  environment50.85 <- stack(alt.crop, bio50.85.crop)
  
  environment70.26 <- stack(alt.crop, bio70.26.crop)
  environment70.45 <- stack(alt.crop, bio70.45.crop)
  environment70.85 <- stack(alt.crop, bio70.85.crop)
  
}



writeRaster(environment50.26, filename="Variables/environment50_26", overwrite=TRUE)
writeRaster(environment50.45, filename="Variables/environment50_45", overwrite=TRUE)
writeRaster(environment50.85, filename="Variables/environment50_85", overwrite=TRUE)
writeRaster(environment70.26, filename="Variables/environment70_26", overwrite=TRUE)
writeRaster(environment70.45, filename="Variables/environment70_45", overwrite=TRUE)
writeRaster(environment70.85, filename="Variables/environment70_85", overwrite=TRUE)


############################################################################################
############################################################################################

###########################
####LOAD SAVED RASTERS ####
###########################

library(raster)
library(sp)

environment <- stack("Variables/environment")
env.saved <- stack("Variables/env_saved")

environment50.26<- stack("Variables/environment50_26")
environment50.45<- stack("Variables/environment50_45")
environment50.85<- stack("Variables/environment50_85")

environment70.26<- stack("Variables/environment70_26")
environment70.45<- stack("Variables/environment70_45")
environment70.85<- stack("Variables/environment70_85")



GCM <- c("BC", "CC", "CN", "GS", "HD", "IP", "MI", "MR", "MC", "MP", "MG", "NO")  #GCM - ("GF"-50_85/70_85, "HE"-50_26/70_26) - reading problem

GCM.raster.list <- list()


## Get WorldClim layers - "INSERT foreach ???"
for (i in 1:length(GCM)) {
  
# Name variables
names(environment50.26) <- c("alt", "bio1", "bio2", "bio3", "bio4", "bio5", "bio6", "bio7", "bio8", "bio9", "bio10", 
                             "bio11", "bio12", "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

names(environment50.45) <- c("alt", "bio1", "bio2", "bio3", "bio4", "bio5", "bio6", "bio7", "bio8", "bio9", "bio10",
                             "bio11", "bio12", "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

names(environment50.85) <- c("alt", "bio1", "bio2", "bio3", "bio4", "bio5", "bio6", "bio7", "bio8", "bio9", "bio10",
                             "bio11", "bio12", "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

names(environment70.26) <- c("alt", "bio1", "bio2", "bio3", "bio4", "bio5", "bio6", "bio7", "bio8", "bio9", "bio10",
                             "bio11", "bio12", "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

names(environment70.45) <- c("alt", "bio1", "bio2", "bio3", "bio4", "bio5", "bio6", "bio7", "bio8", "bio9", "bio10",
                             "bio11", "bio12", "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

names(environment70.85) <- c("alt", "bio1", "bio2", "bio3", "bio4", "bio5", "bio6", "bio7", "bio8", "bio9", "bio10",
                             "bio11", "bio12", "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")


# Subset environmental stack for future scenarios
env50.26.selected <- subset(environment50.26, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50.45.selected <- subset(environment50.45, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50.85.selected <- subset(environment50.85, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))

env70.26.selected <- subset(environment70.26, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70.45.selected <- subset(environment70.45, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70.85.selected <- subset(environment70.85, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))


scenario.list<-list(env50.26.selected, env50.45.selected, env50.85.selected, env70.26.selected, env70.45.selected, env70.85.selected)
names(scenario.list)<-c("env50.26", "env50.45", "env50.85", "env70.26", "env70.45", "env70.85")
GCM.raster.list[[i]]<-scenario.list
} 


names(GCM.raster.list)<-GCM
GCM.raster.list



##########################################
#### INPUT AND PLOT DISTRIBUTION DATA ####
##########################################

# Read data
alternatus <- read.csv("alternatus.csv", h = T, sep=";")
str(alternatus)
head(alternatus)

# Remove duplicates
dups2 <- duplicated(alternatus[, 2:3])
sum(dups2) # how many duplicates? 26
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


dis.cerrado <- readOGR("D:/Dropbox/Dropbox/Doutorado/Gis/Modelado/Futuro/alternatus/Shapes","Cerrado")
dis.caatinga <- readOGR("D:/Dropbox/Dropbox/Doutorado/Gis/Modelado/Futuro/alternatus/Shapes","Caatinga")
dis.chaco <- readOGR("D:/Dropbox/Dropbox/Doutorado/Gis/Modelado/Futuro/alternatus/Shapes","Chaco")


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
library(dismo)

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
#myBiomodOption <- BIOMOD_ModelingOptions(MAXENT.Phillips = list(path_to_maxent.jar="C:/Users/sukam/Documents/R/win-library/3.3/dismo/java", memory_allocated = 1024))
myBiomodOption <- BIOMOD_ModelingOptions()# When MAXENT is not necessary                    

# Parallel processing
library(doParallel)
cl <- makeCluster(detectCores(7)) # number of cores in computer
registerDoParallel(cl)
getDoParWorkers()

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
mean(alternatusModelEval_PA_equal["KAPPA","Testing.data","RF",,])
mean(alternatusModelEval_PA_equal["TSS","Testing.data","RF",,])
mean(alternatusModelEval_PA_equal["ROC","Testing.data","RF",,])
mean(alternatusModelEval_PA_equal["ACCURACY","Testing.data","RF",,])
mean(alternatusModelEval_PA_equal["BIAS","Testing.data","RF",,])


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
##Run again only if the selected models are different ("GBM", "CTA","RF")
alternatusModelOut_PA_equal.2 <- BIOMOD_Modeling(alternatusBiomodData_PA_equal, 
                                               models = c("RF"),
                                               models.options = myBiomodOption, 
                                               NbRunEval = 10,
                                               DataSplit = 75, 
                                               Prevalence = NULL, 
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




###################################################################################
###################################################################################
#### Produce model projections for the future for all GCMs and calculate areas ####
###################################################################################
###################################################################################


# Parallel processing
library(foreach)
library(doParallel)

cl <- makeCluster(detectCores(4)) # number of cores in computer
registerDoParallel(cl)
getDoParWorkers()


## Produce model projections - "INSERT foreach ???"
for(j in 1:length(GCM.raster.list)){
  for(k in 1:length(GCM.raster.list[[j]])){
    
    alternatus.projections <- BIOMOD_Projection(
      modeling.output = alternatusModelOut_PA_equal,
      new.env = GCM.raster.list[[3]][[5]],
      proj.name = paste(names(GCM.raster.list)[[3]],names(GCM.raster.list[[3]])[[5]],sep='.'),
      selected.models = "all")
  } 
}


# Find and stack projections
gcm <- c("BC", "CC", "CN") #, "GS", "HD", "IP", "MI", "MR", "MC", "MP", "MG", "NO")
year <- c("env50", "env70")
rcp <- c("26", "45", "85")

projection.name.list <- list()
i <- 1
for (j in 1:length(gcm)){
  for (k in 1:length(year)){
    for (l in 1:length(rcp)){
      projection.name.list[[i]] <- paste(gcm[j], year[k], rcp[l], sep = "_")
      i <- i + 1
    }
  }
}

projection.name.list
projection.name.list.df <- data.frame(matrix(unlist(projection.name.list)))
names(projection.name.list.df) <- "gcm.year.rcp"


# Stack projections
projections.list <- list()

                               
for(i in 1:length(projection.name.list)){
                                  
  a <- stack(list.files(paste("D:/Dropbox/Dropbox/Doutorado/Gis/Modelado/Futuro/alternatus/Occurrence/proj", 
                              projection.name.list[i], sep = "_"), full.names = T,  pattern = "Occurrence.grd"))
  projections.list[[i]] <- assign(paste("projection", i, sep = ""), a) 
  
}
projections.list



# Average projections for projections_list with doParallel and foreach
# ********************************************************************

# Parallel processing
library(doParallel)
library(foreach)

cl <- makeCluster(detectCores()) # number of cores in computer
registerDoParallel(cl)
getDoParWorkers()

projections.list2 <- foreach (i = 1:length(projections.list)) %dopar% {
  assign(paste("projection", i, sep = ""), mean(projections.list[[i]])/1000)
}

projections.list2
plot(projections.list2[[2]]) #Just an example

registerDoSEQ()


# Plot projections
# ****************

pdf(file = "Projection.future%02d.pdf", onefile = F, paper = "a4")
for(i in 1:length(projections.list2)){
  alternatus.training.spdf <- SpatialPoints(coords = M.atticolus.training, proj4string = crs(environment))
  plot(projections.list2[[i]], col = matlab.like(100), main = paste("projection", i, sep = " "), las = 1)
  plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
  plot(dis.cerrado, col="transparent", border="black", lwd = 0.5, add=T)
  plot(alternatus.training.spdf, pch = 21, cex = 1.25, col = "gray20", bg = "green", add = T)
}
dev.off()



# Convert to binary and calculate area of occupancy
# *************************************************
projections.list3 <- list()
projections.list4 <- list()
projections.list5 <- list()
projections.list6 <- list()

for(i in 1:length(projections.list2)){
  
  ## Convert to binary
  projections.binary <- BinaryTransformation(projections.list2[[i]], 0.67)
  class(projections.binary ) #This is a raster layer!
  str(values(projections.binary )) #These are only the binary values!
  summary(values(projections.binary ))
  
  
  ## Calculate area of occupancy from binary unprojected area
  area <- area(projections.binary)
  class(area)
  str(values(area))
  summary(values(area))
  
  area.future <- data.frame(values(projections.binary), values(area)) #Combine binary and area info for each cell
  names(area.future) <- c("Pres.Abs", "Area")
  head(area.future)
  area.future.2 = tapply(area.future$Area, area.future$Pres.Abs, sum) #Area of occupancy = xxx km2 (will vary every time!)
  area.future.presence = area.future.2[2]
  area.future.presence
  
  projections.list3[[i]] <- assign(paste("area", i, sep = ""), area.future.presence)
  
  
  ## Calculating the ratio between present and future areas 
  predict.area.log = log(area.future.presence/area.current.presence)
  predict.area.ratio = (area.future.presence/area.current.presence)
  predict.area.percent = (area.future.presence/area.current.presence)/100
  
  projections.list4[[i]] <- assign(paste("projection", i, sep = ""), predict.area.log)
  projections.list5[[i]] <- assign(paste("projection", i, sep = ""), predict.area.ratio)
  projections.list6[[i]] <- assign(paste("projection", i, sep = ""), predict.area.percent)
}

projections.list3.df <- data.frame(matrix(unlist(projections.list3)))
names(projections.list3.df) <- "area.adequability"

projections.list4.df <- data.frame(matrix(unlist(projections.list4)))
names(projections.list4.df) <- "area.reduced.log"

projections.list5.df <- data.frame(matrix(unlist(projections.list5)))
names(projections.list5.df) <- "area.reduced.ratio"

projections.list6.df <- data.frame(matrix(unlist(projections.list6)))
names(projections.list6.df) <- "area.reduced.percent"

summary.results <- data.frame(projection.name.list.df, projections.list3.df, projections.list4.df, projections.list5.df, projections.list6.df)
head(summary.results)
summary(summary.results)




#################################################################################
## Calculating the diference between projections presence and deforested areas ##
#################################################################################

## Cerrado Remanescent Layer 
## *************************

## With "nativas2013_250m"
reman_cer_2013 <- raster("nativas2013_250m.tif") 
plot(reman_cer_2013)
reman_cer_2013[reman_cer_2013 > 1] = 0
plot(reman_cer_2013)


## Transfers values between non matching Raster in terms of origin and resolution
projections.RF.mean.binary1 <- resample(projections.RF.mean.binary, reman_cer_2013)


## Calculating areas 
projections.RF.mean.binary2 <- projections.RF.mean.binary1 * reman_cer_2013
area_occurrence_final <- area(projections.RF.mean.binary2)

area_total_with_defor <- data.frame(values(area_occurrence_final), values(projections.RF.mean.binary2))
names(area_total_with_defor) <- c("Area", "Pres_Abs")
head(area_total_with_defor)
area_current_2 = tapply(area_total_with_defor$Area, area_total_with_defor$Pres_Abs, sum) #Area of occupancy = 2,039,038 km2
area_current_presence_defor = area_current_2[2]
area_current_presence_defor 


## With "veg_cerrado_mdbbs_2010_a"
deforest_cer_2010 <- readOGR("/Users/vitorcavalcante1/Documents/GitHub/Extinction-risk-alternatus-atticolus/veg_cerrado_mdbbs_2010_a",
                             "veg_cerrado_mdbbs_2010_a")
plot(deforest_cer_2010)
class(deforest_cer_2010)


## Transforming to raster
deforest_cer_2010r <- rasterize(deforest_cer_2010, environment,0,background=1,filename="deforest_cer_2010r", overwrite=T)
plot(deforest_cer_2010r)
writeRaster(deforest_cer_2010r,"deforest_cer_2010r.tif",format="GTiff") # For viewing on Qgis


## Calculating areas
area_deforest <- area(deforest_cer_2010r)
area_deforest
area_occurrence <- (deforest_cer_2010r*projections.RF.mean.binary)
area_occurrence_final <- area(area_occurrence)

area_total_with_defor <- data.frame(values(area_occurrence_final), values(deforest_cer_2010r)) #Combine binary and area info for each cell
names(area_total_with_defor) <- c("Area", "Pres_Abs")
head(area_total_with_defor)
area_current_2 = tapply(area_total_with_defor$Area, area_total_with_defor$Pres_Abs, sum) #Area of occupancy = 2,041,151 km2 (will vary every time!)
area_current_presence_defor = area_current_2[2]
area_current_presence_defor 




## End
## ***

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










