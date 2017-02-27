###############################
#### SET WORKING DIRECTORY ####
###############################

# Clean everything that was loaded before
rm(list=ls())

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
tmin50_26 <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MP", year = 50)
tmax50_26 <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MP", year = 50)
prec50_26 <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MP", year = 50)
bio50_26 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MP", year = 50)

tmin50_45 <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MP", year = 50)
tmax50_45 <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MP", year = 50)
prec50_45 <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MP", year = 50)
bio50_45 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MP", year = 50)

tmin50_85 <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MP", year = 50)
tmax50_85 <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MP", year = 50)
prec50_85 <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MP", year = 50)
bio50_85 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MP", year = 50)

# 2070
tmin70_26 <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 26, model = "MP", year = 70)
tmax70_26 <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 26, model = "MP", year = 70)
prec70_26 <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 26, model = "MP", year = 70)
bio70_26 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 26, model = "MP", year = 70)

tmin70_45 <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 45, model = "MP", year = 70)
tmax70_45 <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 45, model = "MP", year = 70)
prec70_45 <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 45, model = "MP", year = 70)
bio70_45 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 45, model = "MP", year = 70)

tmin70_85 <- raster::getData("CMIP5", var = "tmin", res = 2.5, rcp = 85, model = "MP", year = 70)
tmax70_85 <- raster::getData("CMIP5", var = "tmax", res = 2.5, rcp = 85, model = "MP", year = 70)
prec70_85 <- raster::getData("CMIP5", var = "prec", res = 2.5, rcp = 85, model = "MP", year = 70)
bio70_85 <- raster::getData("CMIP5", var = "bio", res = 2.5, rcp = 85, model = "MP", year = 70)


## Crop WorldClim layers
#  *********************

library(maptools)

# Visualize boundaries
data(wrld_simpl)
plot(wrld_simpl, xlim = c(-85, -30), ylim = c(-60, 15), axes = TRUE, col = "light grey")


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
tmin50_26.crop <- crop(tmin50_26, ext)
tmax50_26.crop <- crop(tmax50_26, ext)
prec50_26.crop <- crop(prec50_26, ext)
bio50_26.crop <- crop(bio50_26, ext)

tmin50_45.crop <- crop(tmin50_45, ext)
tmax50_45.crop <- crop(tmax50_45, ext)
prec50_45.crop <- crop(prec50_45, ext)
bio50_45.crop <- crop(bio50_45, ext)

tmin50_85.crop <- crop(tmin50_85, ext)
tmax50_85.crop <- crop(tmax50_85, ext)
prec50_85.crop <- crop(prec50_85, ext)
bio50_85.crop <- crop(bio50_85, ext)

# Crop layers (2070)
tmin70_26.crop <- crop(tmin70_26, ext)
tmax70_26.crop <- crop(tmax70_26, ext)
prec70_26.crop <- crop(prec70_26, ext)
bio70_26.crop <- crop(bio70_26, ext)

tmin70_45.crop <- crop(tmin70_45, ext)
tmax70_45.crop <- crop(tmax70_45, ext)
prec70_45.crop <- crop(prec70_45, ext)
bio70_45.crop <- crop(bio70_45, ext)

tmin70_85.crop <- crop(tmin70_85, ext)
tmax70_85.crop <- crop(tmax70_85, ext)
prec70_85.crop <- crop(prec70_85, ext)
bio70_85.crop <- crop(bio70_85, ext)

# Stack environmental layers
environment <- stack(alt.crop, mean(tmin.crop), mean(tmax.crop), mean(tmean.crop), mean(prec.crop), bio.crop)
environment50_26 <- stack(alt.crop, mean(tmin50_26.crop), mean(tmax50_26.crop), mean(prec50_26.crop), bio50_26.crop)
environment50_45 <- stack(alt.crop, mean(tmin50_45.crop), mean(tmax50_45.crop), mean(prec50_45.crop), bio50_45.crop)
environment50_85 <- stack(alt.crop, mean(tmin50_85.crop), mean(tmax50_85.crop), mean(prec50_85.crop), bio50_85.crop)

environment70_26 <- stack(alt.crop, mean(tmin70_26.crop), mean(tmax70_26.crop), mean(prec70_26.crop), bio70_26.crop)
environment70_45 <- stack(alt.crop, mean(tmin70_45.crop), mean(tmax70_45.crop), mean(prec70_45.crop), bio70_45.crop)
environment70_85 <- stack(alt.crop, mean(tmin70_85.crop), mean(tmax70_85.crop), mean(prec70_85.crop), bio70_85.crop)


# Name variables (present)
names(environment) <- c("alt", "tmin", "tmax", "tmean", "prec", "bio1", "bio2", "bio3",
	"bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
	"bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment)

# Make sure the layer Names (rasterStack) perfectly
# match with the names of variables used to build the models
# Name variables (2050) 
names(environment50_26) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
	"bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
	"bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_26)

names(environment50_45) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
	"bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
	"bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_45)

names(environment50_85) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
	"bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
	"bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment50_85)

# Name variables (2070)
names(environment70_26) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
	"bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
	"bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_26)

names(environment70_45) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
	"bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
	"bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_45)

names(environment70_85) <- c("alt", "tmin", "tmax", "prec", "bio1", "bio2", "bio3",
	"bio4", "bio5", "bio6", "bio7", 	"bio8", "bio9", "bio10", "bio11", "bio12", "bio13",
	"bio14", "bio15", "bio16", "bio17", "bio18", "bio19")
names(environment70_85)

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

# Variance Inflation Factors (VIF) of environmental variables    # Aqui só não entendi ainda pq escolher o v2 (VIF) ao invés do v1? É pq o v2 é mais conservador?
                                                                 
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
env50_26.selected <- subset(environment50_26, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_26.selected

env50_45.selected <- subset(environment50_45, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_45.selected

env50_85.selected <- subset(environment50_85, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env50_85.selected

env70_26.selected <- subset(environment70_26, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_26.selected

env70_45.selected <- subset(environment70_45, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_45.selected

env70_85.selected <- subset(environment70_85, c("alt", "bio2", "bio3", "bio8", "bio9", "bio13", "bio14", "bio15", "bio18", "bio19"))
env70_85.selected




##########################################
#### INPUT AND PLOT DISTRIBUTION DATA ####
##########################################

# My directory
setwd("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/alternatus")

# Read data
alternatus <- read.csv("alternatus.csv", h = T)
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


plot(environment[[1]], col = rev(brewer.pal(11, "RdYlBu")), main = "Altitude") #RColorBrewer
plot(environment[[1]], col = SAGA_pal[[1]], main = "Altitude") #plotKML
plot(environment[[1]], col = rev(magenta2green(100)), main = "Altitude") #colorRamps
plot(environment[[1]], col = blue2red(100), main = "Altitude") #colorRamps
plot(environment[[1]], col = matlab.like2(100), main = "Altitude") #colorRamps


dis.cerrado <- readOGR("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado","Cerrado")
dis.caatinga <- readOGR("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado","Caatinga")
dis.chaco <- readOGR("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado","Chaco")


#x11(w=6, h=6) #Windows only
plot(environment[[1]], col = matlab.like(100), main = "Altitude", las=1) #colorRamps
plot(wrld_simpl, add = TRUE, col="transparent", border="gray70", lwd = 0.25)
plot(dis.cerrado, col=rgb(1,1,1,0.2), border="gray80", lwd = 0.5, add=T)
plot(dis.caatinga, col=rgb(1,1,1,0.2), border="gray80", lwd = 0.5, add=T)
plot(dis.chaco, col=rgb(1,1,1,0.2), border="gray80", lwd = 0.5, add=T)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 1, col = "gray20", bg = "black")




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


library(tcltk2)  #me deu uma mensagem de erro ao aplicar o filtro abaixo e dizia p instalar este pacote
                 #Agora funciona, mas ainda me da essa mensagem: 
                 #Warning message: Quoted identifiers should have class SQL, use DBI::SQL() if the caller performs the quoting.    

# Apply environmental filter to create training data set
env.data <- extract(env.selected, alternatus)
env.data <- as.data.frame(env.data)
(alternatus.training <- envSample(alternatus, filters=list(env.data$bio2, env.data$bio8, env.data$bio15,
	env.data$bio18), res=list(20, 20, 20, 20), do.plot=TRUE)) # 4 predictors with smallest VIF
                                                                                                 

# Reserve remaining (filtered out) points for testing data set   
library(dplyr)
(alternatus.testing <- alternatus %>% anti_join(alternatus.training)) # filtered out points




####################################
#### GENERATE BACKGROUND POINTS ####
####################################


# Generate background points for training dataset
mask <- environment$bio1
set.seed(22111962)
bg.train <- randomPoints(mask, 204) #Remember to put the number of points after filter application (Number of points held after filter)
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
bg <- randomPoints(mask, 194)  #Remember to put the number of points after filter application (Number of points removed after filter)
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
	expl.var = env.selected,
	resp.xy = alternatus.training,
	resp.name = "Occurrence",
	PA.nb.rep = 10,
	PA.nb.absences = 204,  #Remember to put the number of points after filter application (Number of points held after filter)        
	PA.strategy = "sre",
	PA.sre.quant = 0.025)
alternatusBiomodData_PA_equal

alternatusBiomodData_PA_10000 <- BIOMOD_FormatingData(
	resp.var = occurrence.resp,
	expl.var = env.selected,
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
	VarImport = 0,
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
	VarImport = 0,
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
mean(alternatusModelEval_PA_10000["KAPPA","Testing.data","GLM",,])
mean(alternatusModelEval_PA_10000["TSS","Testing.data","GLM",,])
mean(alternatusModelEval_PA_10000["ROC","Testing.data","GLM",,])
mean(alternatusModelEval_PA_10000["ACCURACY","Testing.data","GLM",,])
mean(alternatusModelEval_PA_10000["BIAS","Testing.data","GLM",,])


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
xtabs(summary.eval.equal$Mean ~ summary.eval.equal$Model + summary.eval.equal$Method) #RF and GBM with best performance


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


################################
#### PRODUCE ENSEMBLE MODEL ####
################################

##Finding the  eval.metric.quality.threshold??? Li muito sobre isso, mas não consegui encontrar uma boa explicação de como calcular este número
## extract TSS scores
(scores_all <- get_evaluations(alternatusModelOut_PA_equal))
scores_TSS <- as.numeric(scores_all["TSS","Testing.data",,,])
scores_TSS
mean(scores_TSS)

## select a threshold to keep a single model
score_thresh <- mean(tail(sort(scores_TSS),3))   #não consegui encontrar nenhuma explicação de que numero colocar. Escolhi 300 pq é o total de corridas.
score_thresh                                     #Mas com 300 é o mesmo que a média, acho q não faz sentido. No exemplo que encontrei tinha um 2.
                                                 #e usava 2 models com 2 corridas, mas se eu coloco qualquer valor menos que 10 da = 1 pq muitos TSS foram iguais a 1



##BIOMOD_Modeling Again###   
##Run again only with the selected models ("GBM","RF")  #não sei se era necessário, mas me pareceu lógico ter que fazer isso e sem isso nem funcionava a parte do ensemble
alternatusModelOut_PA_equal <- BIOMOD_Modeling(alternatusBiomodData_PA_equal, 
                                               models = c("GBM","RF"), 
                                               models.options = myBiomodOption, 
                                               NbRunEval = 10,
                                               DataSplit = 75, 
                                               Prevalence = NULL, 
                                               VarImport = 0,
                                               models.eval.meth = c("KAPPA","TSS","ROC","ACCURACY","BIAS"),
                                               SaveObj = TRUE,
                                               rescal.all.models = FALSE,
                                               do.full.models = FALSE,
                                               modeling.id = "alternatus")


##ENSEMBLE MODEL##
#Essa parte dava erros e só consegui quando coloquei "all" para chosen.models e NULL para eval.metric.quality.threshold
alternatusModelEnsemble <- BIOMOD_EnsembleModeling(
  modeling.output = alternatusModelOut_PA_equal,
  chosen.models = grep("GBM","RF", names(alternatusModelOut_PA_equal)),
  em.by = "PA_dataset+repet",
  eval.metric = "all",
  eval.metric.quality.threshold = NULL,  # This must be calculated BEFORE this step!
  prob.mean = TRUE,
  prob.cv = FALSE,
  prob.ci = FALSE,
  prob.ci.alpha = 0.05,
  prob.median = FALSE,
  committee.averaging = FALSE,
  prob.mean.weight = FALSE,
  prob.mean.weight.decay = 'proportional')

get_evaluations(alternatusModelEnsemble)




###################################
#### PRODUCE MODEL PROJECTIONS ####
###################################


alternatus.projections <- BIOMOD_Projection(
  modeling.output = alternatusModelOut_PA_equal,
  new.env = env.selected,
  #If you wanted to predict to a different area, or different
  #conditions you would change the above line
  proj.name = "Current",
  selected.models = "all")

alternatus_EnsembleForecasting<- BIOMOD_EnsembleForecasting( alternatusModelEnsemble,
                                                            projection.output = alternatus.projections,
                                                            selected.models = 'all')

# Stack projections
projections <- stack("C:/Users/sukam/Dropbox/Doutorado/Gis/Modelado/Occurrence/proj_Current/proj_Current_Occurrence_ensemble.grd")
names(projections)
plot(projections[[499]]) #Just an example

# Plot average projections for RF and GBM
alternatus.training.spdf <- SpatialPoints(coords = alternatus.training, proj4string = crs(environment))

#x11(w=6, h=6) #Windows only
projections.EM <- subset(projections, grep("EM", names(projections)))
names(projections.EM)
projections.EM.mean <- mean(projections.EM)/1000

caa.col <- adjustcolor("#31a354", alpha.f=0.6)
cerr.col <- adjustcolor("#74c476", alpha.f=0.7) 
cha.col <- adjustcolor("#bae4b3", alpha=0.7)

pdf("alternatus.pdf", width = 8.267, height= 11.692, paper="a4")
plot(projections.EM.mean, col = matlab.like(100), main = "EM_Current", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.caatinga, col=caa.col, border="#31a354", lwd = 0.5, add=T)
plot(dis.cerrado, col=cerr.col, border="#74c476", lwd = 0.5, add=T)
plot(dis.chaco, col=cha.col, border="#bae4b3", lwd = 0.5, add=T)
points(alternatus$lon, alternatus$lat, pch = 21, cex = 0.7, col = "gray10", bg = "gray")
dev.off()




###############################################
#### EVALUATE MODELS USING PresenceAbsence ####
###############################################

# The function "extract" will get the values from the projection raster for the actual data points
EvalData <- data.frame(extract(projections.EM.mean, alternatus.training.spdf))      #Remember to create the "alternatus.training.spdf" again in case of error    

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

# Assign all values of "Class" that are greater than or equal to 0.9200000
# (optimal threshold MaxSens+Spec = 0.9200000) to 1 (i.e., predicted presence), and
# all values less than 0.9200000 to 0 (i.e, predicted absence)
EvalData$Class[EvalData$Class >= 0.9200000] <- 1
EvalData$Class[EvalData$Class < 0.9200000] <- 0

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
FitData <- extract(projections.EM.mean, alternatus.training.spdf)    #Remember to create the "alternatus.training.spdf" again in case of error
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

projections.EM.mean.binary <- BinaryTransformation(projections.EM.mean, 0.92)
class(projections.EM.mean.binary) #This is a raster layer!
str(values(projections.EM.mean.binary)) #These are only the binary values!      #If have an error here must follow these steps: #search() #Shows used packages
                                                                                #value      #shows the package are using  "value"
                                                                                #.rs.unloadPackage("tcltk2")     #Unloads the package
summary(values(projections.EM.mean.binary))


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
area_current_presence                     #Area of occupancy = 2,129,557 km2 (will vary every time!)


#Criar um mapa aqui e salvar um ASC...

#########################################
#### Model projection for the future ####
#########################################

##############
#### 2050 ####
##############


##2050_rcp26##

alternatus.projections <- BIOMOD_Projection(
  modeling.output = alternatusModelOut_PA_equal,
  new.env = env50_26.selected,
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
  new.env = env50_45.selected,
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
	new.env = env50_85.selected,
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

predict_area_2050_rcp85 =log(area_2050_rcp85_presence-area_current_presence)  #Aqui dá erro. É - ou /? Pq log?
predict_area_2050_rcp26 # result = -0.01589181, -32181.2 km2
predict_area_2050_rcp45 # result = -0.1000519,  -194337 km2
predict_area_2050_rcp85 # result = -0.3275401,  -570104.8 km2



##############
#### 2070 ####
##############


##2070_rcp26##

alternatus.projections_2070_26 <- BIOMOD_Projection(
	modeling.output = alternatusModelOut_PA_equal,
	new.env = env70_26.selected,
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
  new.env = env70_45.selected,
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
  new.env = env70_85.selected,
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










