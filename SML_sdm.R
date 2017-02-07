###########################
## SET WORKING DIRECTORY ##
###########################

# Each user should adjust this!
setwd("/Users/guarinoonleptophis/Documents/Manuscritos/Em prepara??o/Ecofisiologia Micrablepharus atticolus")
setwd("C:/Users/Vitor/Documents/GitHub/Extinction-risk-Micrablepharus-atticolus")




###############################
## INSTALL REQUIRED PACKAGES ##
###############################


install.packages("biomod2", dep=T)
install.packages("car", dep=T)
install.packages("colorRamps", dep=T)
install.packages("corrplot", dep=T)
install.packages("dismo", dep=T)
install.packages("doParallel", dep=T)
install.packages("dplyr", dep=T)
install.packages("maps", dep=T)
install.packages("maptools", dep=T)
install.packages("plotKML", dep=T)
install.packages("PresenceAbsence", dep=T)
install.packages("raster", dep=T)
install.packages("rgdal", dep=T)
install.packages("roxygen2", dep=T)
install.packages("sdm", dep=T)
install.packages("SDMTools", dep=T)
install.packages("sqldf", dep=T)
install.packages("testthat", dep=T)
install.packages("usdm", dep=T)





###################################
## GET AND CROP WORLDCLIM LAYERS ##
###################################

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
plot(wrld_simpl, xlim = c(-80, -30), ylim = c(-40, 10), axes = TRUE, col = "light grey")

# Set boundaries
ext <- extent(-80, -30, -40, 10)

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




##################################
## COLLINEARITY CHECK - PRESENT ##
##################################

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
M <- cor(env.data.std[, c("alt", "bio2", "bio3","bio8","bio9","bio13","bio14", "bio15", "bio18", "bio19")])
corrplot.mixed(M, upper="ellipse", lower="number")

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




######################################
## INPUT AND PLOT DISTRIBUTION DATA ##
######################################

# Read data
M.atticolus <- read.table("MicraDistribution.txt", h = T)
str(M.atticolus)
head(M.atticolus)

# Remove duplicates
dups2 <- duplicated(M.atticolus[, 2:3])
sum(dups2) # how many duplicates?
M.atticolus <- M.atticolus[!dups2, 2:3] # remove duplicates
str(M.atticolus)

# Visualize data
library(plotKML)
library(colorRamps)
library(RColorBrewer)
library(rgdal)

dis.cerrado <- readOGR("/Users/guarinoonleptophis/Documents/Manuscritos/Em preparação/Ecofisiologia Micrablepharus atticolus/Analyses/Cerrado shapefiles",
  "Cerrado_Eco_merge_Clip") #Guarino
dis.cerrado <- readOGR("/Users/izabellapaim/Documents/GitHub/cerradoshape",
  "Cerrado_Eco_merge_Clip") #Izabella

plot(environment[[1]], col = rev(brewer.pal(11, "RdYlBu")), main = "Altitude") #RColorBrewer
plot(environment[[1]], col = SAGA_pal[[1]], main = "Altitude") #plotKML
plot(environment[[1]], col = rev(magenta2green(100)), main = "Altitude") #colorRamps
plot(environment[[1]], col = blue2red(100), main = "Altitude") #colorRamps
plot(environment[[1]], col = matlab.like2(100), main = "Altitude") #colorRamps

quartz(w=6, h=6) #macOS only
window(w=6, h=6) #Windows only
plot(environment[[1]], col = matlab.like(100), main = "Altitude", las=1) #colorRamps
plot(wrld_simpl, add = TRUE, col="transparent", border="gray70", lwd = 0.25)
plot(dis.cerrado, col=rgb(1,1,1,0.2), border="gray80", lwd = 0.5, add=T)
points(M.atticolus$lon, M.atticolus$lat, pch = 21, cex = 1.25, col = "gray20", bg = "red")




###################################################
## ENVIRONMENTAL FILTER OF RAW DISTRIBUTION DATA ##
###################################################

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
env.data <- extract(env.selected, M.atticolus)
env.data <- as.data.frame(env.data)
(M.atticolus.training <- envSample(M.atticolus, filters=list(env.data$bio2, env.data$bio15,
	env.data$bio18, env.data$bio19), res=list(20, 20, 20, 20), do.plot=TRUE)) # 4 predictors with smallest VIF

# Reserve remaining (filtered out) points for testing data set
library(dplyr)
(M.atticolus.testing <- M.atticolus %>% anti_join(M.atticolus.training)) # filtered out points




################################
## GENERATE BACKGROUND POINTS ##
################################

# Generate background points for training dataset
mask <- environment$bio1
set.seed(22111962)
bg.train <- randomPoints(mask, 35)
plot(!is.na(mask), legend = F)
points(bg.train, cex = 0.5)
bg.df.train <- data.frame(Occurrence = rep(0, 35), lon = bg.train[, 1], lat = bg.train[, 2])
bg.df.train

# Convert training dataset to SpatialPointsDataFrame
df.train <- data.frame(Occurrence = rep(1, length(M.atticolus.training$lon)), M.atticolus.training)
merged.dfs.train <- rbind(df.train, bg.df.train)
M.atticolus.training.spdf <- SpatialPointsDataFrame(coords = merged.dfs.train[, 2:3],	data = data.frame(merged.dfs.train[1]),
	proj4string = crs(environment))
M.atticolus.training.spdf

# Generate background points for testing dataset
mask <- environment$bio1
set.seed(22111962)
bg <- randomPoints(mask, 13)
plot(!is.na(mask), legend = F)
points(bg, cex = 0.5)
bg.df <- data.frame(Occurrence = rep(0, 13), lon = bg[, 1], lat = bg[, 2])
bg.df

# Convert testing dataset to SpatialPointsDataFrame
df <- data.frame(Occurrence = rep(1, length(M.atticolus.testing$lon)), M.atticolus.testing)
merged.dfs <- rbind(df, bg.df)
M.atticolus.testing.spdf <- SpatialPointsDataFrame(coords = merged.dfs[, 2:3], data = data.frame(merged.dfs[1]),
	proj4string = crs(environment))
M.atticolus.testing.spdf




############################################
## FIT SPECIES DISTRIBUTION MODELS - SDMS ##
############################################

library(biomod2)

occurrence.resp <-  rep(1, length(M.atticolus.training$lon))

# Prepare data
MatticolusBiomodData_PA_equal <- BIOMOD_FormatingData(
	resp.var = occurrence.resp,
	expl.var = env.selected,
	resp.xy = M.atticolus.training,
	resp.name = "Occurrence",
	PA.nb.rep = 10,
	PA.nb.absences = 35,
	PA.strategy = "sre",
	PA.sre.quant = 0.025)
MatticolusBiomodData_PA_equal

MatticolusBiomodData_PA_10000 <- BIOMOD_FormatingData(
	resp.var = occurrence.resp,
	expl.var = env.selected,
	resp.xy = M.atticolus.training,
	resp.name = "Occurrence",
	PA.nb.rep = 10,
	PA.nb.absences = 10000,
	PA.strategy = "sre",
	PA.sre.quant = 0.025)
MatticolusBiomodData_PA_10000



# Path to MAXENT
myBiomodOption <- BIOMOD_ModelingOptions(MAXENT.Phillips = list(path_to_maxent.jar="C:/Users/Vitor/Documents/R/win-library/3.3/dismo/java", memory_allocated = 1024))
myBiomodOption <- BIOMOD_ModelingOptions(MAXENT.Phillips = list(path_to_maxent.jar="/Users/vitorhugolacerdacavalcante/Library/R/3.3/library/dismo/java", memory_allocated = 1024))
myBiomodOption <- BIOMOD_ModelingOptions(MAXENT.Phillips = list(path_to_maxent.jar="C:/Users/izabellapaim/Documents/R/win-library/3.3/dismo/java", memory_allocated = 1024))
myBiomodOption <- BIOMOD_ModelingOptions(MAXENT.Phillips = list(path_to_maxent.jar="/Users/guarinoonleptophis/Library/R/3.3/library/dismo/java", memory_allocated = 1024))
myBiomodOption <- BIOMOD_ModelingOptions()# When MAXENT is not necessary 

# Parallel processing
library(doParallel)
cl <- makeCluster(4) # number of cores in computer
registerDoParallel(cl)

# models = c("GLM","GAM","GBM","CTA","ANN","SRE","FDA","MARS","RF","MAXENT.Phillips","MAXENT.Tsuruoka"),
# Modeling: machine learning methods (using default options)
# myBiomodOptions_PA_equal <- BIOMOD_ModelingOptions(GBM = NULL,
	CTA = NULL,
	RF = NULL)
                        
MatticolusModelOut_PA_equal <- BIOMOD_Modeling(MatticolusBiomodData_PA_equal, 
	models = c("RF"), 
	models.options = myBiomodOption, 
	NbRunEval = 10,
	DataSplit = 75, 
	Prevalence = NULL, 
	VarImport = 0,
	models.eval.meth = c("KAPPA","TSS","ROC","ACCURACY","BIAS"),
	SaveObj = TRUE,
	rescal.all.models = FALSE,
	do.full.models = FALSE,
	modeling.id = "Matticolus")

# Modeling: machine learning methods (using default options)
# myBiomodOptions_PA_10000 <- BIOMOD_ModelingOptions(GLM = NULL,
	GAM = NULL,
	ANN = NULL,
	SRE = NULL,
	FDA = NULL,
	MARS = NULL,
	MAXENT.Phillips = NULL,
	MAXENT.Tsuruoka = NULL)
                        
MatticolusModelOut_PA_10000 <- BIOMOD_Modeling( 
	MatticolusBiomodData_PA_10000, 
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
	modeling.id = "Matticolus")




###################################
## EVALUATE MODELS USING BIOMOD2 ##
###################################

# Get evaluations
MatticolusModelEval_PA_equal <- get_evaluations(MatticolusModelOut_PA_equal)
MatticolusModelEval_PA_10000 <- get_evaluations(MatticolusModelOut_PA_10000)

# Print ROC scores of all selected models
MatticolusModelEval_PA_equal["ROC","Testing.data",,,]

# Get summaries (mean) of model evaluation: one model (MAXENT.Tsuruoka), one method (TSS)
dimnames(MatticolusModelEval_PA_10000)
MAXENT.Tsuruoka_Eval<- MatticolusModelEval_PA_10000["TSS","Testing.data","MAXENT.Tsuruoka",,]
mean(MAXENT.Tsuruoka_Eval)

# Get summaries (mean) of model evaluation: one model (GLM), all methods
mean(MatticolusModelEval_PA_10000["KAPPA","Testing.data","GLM",,])
mean(MatticolusModelEval_PA_10000["TSS","Testing.data","GLM",,])
mean(MatticolusModelEval_PA_10000["ROC","Testing.data","GLM",,])
mean(MatticolusModelEval_PA_10000["ACCURACY","Testing.data","GLM",,])
mean(MatticolusModelEval_PA_10000["BIAS","Testing.data","GLM",,])

# Get summaries (mean) of model evaluation: machine-learning models, all methods
sdm.models <- c("GBM","CTA","RF") #3 models
eval.methods <- c("KAPPA","TSS","ROC","ACCURACY","BIAS") #5 evaluation methods

means.i <- numeric(0)
means.j <- numeric(5)
for (i in 1:3){
	for (j in 1:5){
	means.j[j] <- mean(MatticolusModelEval_PA_equal[paste(eval.methods[j]),"Testing.data",paste(sdm.models[i]),,])
	}
	means.i <- c(means.i, means.j)
}

summary.eval.equal <- data.frame(rep(sdm.models,each=5), rep(eval.methods,3), means.i)
names(summary.eval.equal) <- c("Model", "Method", "Mean")
summary.eval.equal
xtabs(summary.eval.equal$Mean ~ summary.eval.equal$Model + summary.eval.equal$Method) #RF with best performance


# Get summaries (mean) of model evaluation: regression models, all methods
sdm.models <- c("GLM","GAM","ANN","SRE","FDA","MARS","MAXENT.Phillips","MAXENT.Tsuruoka") #8 models
eval.methods <- c("KAPPA","TSS","ROC","ACCURACY","BIAS") #5 evaluation methods

means.i <- numeric(0)
means.j <- numeric(5)
for (i in 1:8){
	for (j in 1:5){
	means.j[j] <- mean(MatticolusModelEval_PA_10000[paste(eval.methods[j]),"Testing.data",paste(sdm.models[i]),,], na.rm=T)
	}
	means.i <- c(means.i, means.j)
}

summary.eval.10000 <- data.frame(rep(sdm.models,each=5), rep(eval.methods,8), means.i)
names(summary.eval.10000) <- c("Model", "Method", "Mean")
summary.eval.10000
xtabs(summary.eval.10000$Mean ~ summary.eval.10000$Model + summary.eval.10000$Method) #MAXENT.Phillips with best performance


############################
## PRODUCE ENSEMBLE MODEL ##
############################

MatticolusModelEnsemble <- BIOMOD_EnsembleModeling(
                            modeling.output = MatticolusModelOut,
                            chosen.models = c("RF", "GBM"),
                            em.by = "PA_dataset+repet",
                            eval.metric = "all",
                            eval.metric.quality.threshold = c(0.67), # This must be calculated BEFORE this step!
                            prob.mean = TRUE,
                            prob.cv = FALSE,
                            prob.ci = FALSE,
                            prob.ci.alpha = 0.05,
                            prob.median = FALSE,
                            committee.averaging = FALSE,
                            prob.mean.weight = FALSE,
                            prob.mean.weight.decay = 'proportional')


###############################
## PRODUCE MODEL PROJECTIONS ##
###############################

Matticolus.projections <- BIOMOD_Projection(
	modeling.output = MatticolusModelOut_PA_equal,
	new.env = env.selected,
	#If you wanted to predict to a different area, or different
	#conditions you would change the above line
	proj.name = "Current",
	selected.models = "all")

# Stack projections
projections <- stack("C:/Users/Vitor/Documents/GitHub/Extinction-risk-Micrablepharus-atticolus/Occurrence/proj_Current/proj_Current_Occurrence.grd")
projections <- stack("C:/Users/izabellapaim/Documents/GitHub/Extinction-risk-Micrablepharus-atticolus/Occurrence/proj_Current/proj_Current_Occurrence.grd")
projections <- stack("/Users/guarinoonleptophis/Documents/Manuscritos/Em preparação/Ecofisiologia Micrablepharus atticolus/Analyses/Occurrence/proj_Current/proj_Current_Occurrence.grd")
names(projections)
plot(projections[[99]]) #Just an example

# Plot average projections for RF
Matticolus.training.spdf <- SpatialPoints(coords = M.atticolus.training, proj4string = crs(environment))

quartz(w=9, h=9) #macos only
window(w=6, h=6) #Windows only

projections.RF <- subset(projections, grep("RF", names(projections)))
names(projections.RF)
projections.RF.mean <- mean(projections.RF)/1000
plot(projections.RF.mean, col = matlab.like(100), main = "RF_Current", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.cerrado, col="transparent", border="black", lwd = 0.5, add=T)
plot(Matticolus.training.spdf, pch = 21, cex = 1.25, col = "gray20", bg = "green", add = T)




###########################################
## EVALUATE MODELS USING PresenceAbsence ##
###########################################

# The function "extract" will get the values from the projection raster for the actual data points
EvalData <- data.frame(extract(projections.RF.mean, M.atticolus.training.spdf))

# Combine the original data and the predictions into a single data frame
EvalData <- cbind(M.atticolus.training.spdf@data[, 1], EvalData)

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
optimal.thresholds(EvalData) # Calculate optimal thresholds

# Create a column "Class" with the Predicted Probabilities
EvalData$Class <- EvalData$Pred

# Assign all values of "Class" that are greater than or equal to 0.6700000
# (optimal threshold MaxSens+Spec = 0.6700000) to 1 (i.e., predicted presence), and
# all values less than 0.6700000 to 0 (i.e, predicted absence)
EvalData$Class[EvalData$Class >= 0.65] <- 1
EvalData$Class[EvalData$Class < 0.65] <- 0

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




#######################################################
## CONVERT TO BINARY AND CALCULATE AREA OF OCCUPANCY ##
#######################################################

## Find the threshold to convert continuous values into binary with BIOMOD2
## ************************************************************************

# The function "extract" will get the values from the projection raster for the actual data points
FitData <- extract(projections.RF.mean, M.atticolus.training.spdf)
head(FitData)
summary(FitData)

ObsData <- M.atticolus.training.spdf@data[, 1]
head(ObsData)
summary(ObsData)

Find.Optim.Stat(Stat="ROC", FitData, ObsData, Nb.thresh.test=100, Fixed.thresh = NULL)
Find.Optim.Stat(Stat="TSS", FitData, ObsData, Nb.thresh.test=100, Fixed.thresh = NULL)
Find.Optim.Stat(Stat="KAPPA", FitData, ObsData, Nb.thresh.test=100, Fixed.thresh = NULL)


## Find the threshold to convert continuous values into binary with PresenceAbsence
## ********************************************************************************

# The function "extract" will get the values from the projection raster for the actual data points
EvalData <- data.frame(extract(projections.RF.mean, M.atticolus.training.spdf))

# Combine the original data and the predictions into a single data frame
EvalData <- cbind(M.atticolus.training.spdf@data[, 1], EvalData)

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
optimal.thresholds(EvalData) # Calculate optimal thresholds


## Find the threshold to convert continuous values into binary with sdmTools
## *************************************************************************

library(SDMTools)
optim.thresh(ObsData, FitData, threshold = 101)


## Convert to binary
## *****************

projections.RF.mean.binary <- BinaryTransformation(projections.RF.mean, 0.66)
class(projections.RF.mean.binary) #This is a raster layer!
str(values(projections.RF.mean.binary)) #These are only the binary values!
summary(values(projections.RF.mean.binary))


## Calculate area of occupancy from binary unprojected area
## ********************************************************

area_RF <- area(projections.RF.mean.binary)
class(area_RF)
str(values(area_RF))
summary(values(area_RF))

area_total <- data.frame(values(projections.RF.mean.binary), values(area_RF)) #Combine binary and area info for each cell
names(area_total) <- c("Pres_Abs", "Area")
head(area_total)
area_current = tapply(area_total$Area, area_total$Pres_Abs, sum) #Area of occupancy = 2,041,151 km2 (will vary every time!)
area_current_presence = area_current[2]
area_current_presence 


#####################################
## Model projection for the future ##
#####################################

##########
## 2050 ##
##########

Matticolus.projections <- BIOMOD_Projection(
	modeling.output = MatticolusModelOut_PA_equal,
	new.env = env50_85.selected,
	proj.name = "RF.2050_rcp85",
	selected.models = "all")

# Stack projections
projections.RF_2050_rcp85 <- stack("/Users/vitorcavalcante1/Documents/GitHub/Extinction-risk-Micrablepharus-atticolus/Occurrence/proj_RF.2050_rcp85/proj_RF.2050_rcp85_Occurrence.grd")
names(projections.RF_2050_rcp85)
plot(projections.RF_2050_rcp85[[100]]) #Just an example

# Plot average projections for RF
Matticolus.training.spdf <- SpatialPoints(coords = M.atticolus.training, proj4string = crs(environment))

quartz(w=9, h=9) #macos only
window(w=6, h=6) #Windows only

# projections.RF <- subset(projections, grep("RF", names(projections)))
# names(projections.RF)
projections.RF_2050_rcp85.mean <- mean(projections.RF_2050_rcp85)/1000
plot(projections.RF_2050_rcp85.mean, col = matlab.like(100), main = "RF 2050 rcp 85", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.cerrado, col="transparent", border="black", lwd = 0.5, add=T)
plot(Matticolus.training.spdf, pch = 21, cex = 1.25, col = "gray20", bg = "green", add = T)

## Convert to binary
## *****************

projections.RF_2050_rcp85.mean.binary <- BinaryTransformation(projections.RF_2050_rcp85.mean, 0.66)
class(projections.RF_2050_rcp85.mean.binary) #This is a raster layer!
str(values(projections.RF_2050_rcp85.mean.binary)) #These are only the binary values!
summary(values(projections.RF_2050_rcp85.mean.binary))


## Calculate area of occupancy from binary unprojected area
## ********************************************************

area_RF_2050_rcp85 <- area(projections.RF_2050_rcp85.mean.binary)
class(area_RF_2050_rcp85)
str(values(area_RF_2050_rcp85))
summary(values(area_RF_2050_rcp85))

area_total_RF_2050_rcp85 <- data.frame(values(projections.RF_2050_rcp85.mean.binary), values(area_RF_2050_rcp85)) #Combine binary and area info for each cell
names(area_total_RF_2050_rcp85) <- c("Pres_Abs", "Area")
head(area_total_RF_2050_rcp85)
area_2050_rcp45 = tapply(area_total_RF_2050_rcp45$Area, area_total_RF_2050_rcp45$Pres_Abs, sum) #Area of occupancy = 2,008,969 km2 (will vary every time!)
area_2050_rcp45_presence = area_2050_rcp45[2]
area_2050_rcp45_presence

## Calculating the diference between present and future areas 
## ********************************************************

predict_area_2050_rcp85 =log(area_2050_rcp85_presence-area_current_presence)
predict_area_2050_rcp26 # result = -0.01589181, -32181.2 km2
predict_area_2050_rcp45 # result = -0.1000519,  -194337 km2
predict_area_2050_rcp85 # result = -0.3275401,  -570104.8 km2



##########
## 2070 ##
##########

Matticolus.projections_2070_45 <- BIOMOD_Projection(
	modeling.output = MatticolusModelOut_PA_equal,
	new.env = env70_45.selected,
	#If you wanted to predict to a different area, or different
	#conditions you would change the above line
	proj.name = "RF.2070_rcp45",
	selected.models = "all")

# Stack projections
projections.RF_2070_rcp26 <- stack("C:/Users/izabellapaim/Documents/GitHub/Extinction-risk-Micrablepharus-atticolus/Occurrence/proj_Future_2070_rcp26/proj_Future_2070_rcp26_Occurrence")
names(projections.RF_2070_rcp26)
plot(projections.RF_2070_rcp26[[99]]) #Just an example

projections.RF_2070_rcp45 <- stack("C:/Users/izabellapaim/Documents/GitHub/Extinction-risk-Micrablepharus-atticolus/Occurrence/proj_RF.2070_rcp45/proj_RF.2070_rcp45_Occurrence")
names(projections.RF_2070_rcp45)

projections.RF_2070_rcp85 <- stack("C:/Users/izabellapaim/Documents/GitHub/Extinction-risk-Micrablepharus-atticolus/Occurrence/proj_RF.2070_rcp85/proj_RF.2070_rcp85_Occurrence")
names(projections.RF_2070_rcp85)


# Plot average projections for RF 
Matticolus.training.spdf <- SpatialPoints(coords = M.atticolus.training, proj4string = crs(environment))

quartz(w=9, h=9) #macos only
window(w=6, h=6) #Windows only

projections.RF_2070_rcp85 <- subset(projections.RF_2070_rcp85, grep("RF", names(projections.RF_2070_rcp85)))
names(projections.RF_2070_rcp85)
projections.RF_2070_rcp85.mean <- mean(projections.RF_2070_rcp85)/1000
plot(projections.RF_2070_rcp85.mean, col = matlab.like(100), main = "RF_2070_rcp85", las = 1)
plot(wrld_simpl, add = TRUE, col="transparent", border="white", lwd = 0.5)
plot(dis.cerrado, col="transparent", border="black", lwd = 0.5, add=T)
plot(Matticolus.training.spdf, pch = 21, cex = 1.25, col = "gray20", bg = "green", add = T)

## Convert to binary
## *****************

projections.RF_2070_rcp85.mean.binary <- BinaryTransformation(projections.RF_2070_rcp85.mean, 0.66)
class(projections.RF_2070_rcp85.mean.binary ) #This is a raster layer!
str(values(projections.RF_2070_rcp85.mean.binary )) #These are only the binary values!
summary(values(projections.RF_2070_rcp85.mean.binary ))

## Calculate area of occupancy from binary unprojected area
## ********************************************************

area_RF_2070_rcp85 <- area(projections.RF_2070_rcp85.mean.binary )
class(area_RF_2070_rcp85)
str(values(area_RF_2070_rcp85))
summary(values(area_RF_2070_rcp85))

area_total_RF_2070_rcp85 <- data.frame(values(projections.RF_2070_rcp85.mean.binary ), values(area_RF_2070_rcp85)) #Combine binary and area info for each cell
names(area_total_RF_2070_rcp85) <- c("Pres_Abs", "Area")
head(area_total_RF_2070_rcp85)
area_2070_rcp85_total = tapply(area_total_RF_2070_rcp85$Area, area_total_RF_2070_rcp85$Pres_Abs, sum) #Area of occupancy = 2,041,151 km2 (will vary every time!)
area_2070_rcp85_total_presence = area_2070_rcp85_total[2]
area_2070_rcp85_total_presence


## Calculating the diference between present and future areas 
## ********************************************************
predict_area_2070_rcp85 =log(area_2070_rcp85_total_presence/area_current_presence )

predict_area_2070_rcp26 # result = -0.05286374, - 107598.9 km2
predict_area_2070_rcp45 # result = -0.3725469, - 649936 km2
predict_area_2070_rcp85 # result = -0.5381555, - 869672.2 km2










