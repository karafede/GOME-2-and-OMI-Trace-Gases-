setwd ("G:/near_real_time/2015/01/01/")

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
library(maps)


###required functions
source("image.scale.R") #http://menugget.blogspot.de/2011/08/adding-scale-to-image-plot.html
source("val2col.R") # http://menugget.blogspot.de/2011/09/converting-values-to-color-levels.html

#fname <- "S-O3M_GOME_O3-NO2-NO2Tropo-SO2_L2_20150101001158_003_METOPA_42554_DLR_03.HDF5"
filenames <- list.files(pattern = "\\.HDF5$")
length(filenames)


LAT = NULL
LON = NULL
NO2 = NULL

for (i in 1:length(filenames)) {
  tmp <- h5ls(filenames[i])
  lat <- as.matrix(h5read(filenames[i], "/GEOLOCATION/LatitudeCentre"))
  lon <- as.matrix(h5read(filenames[i], "/GEOLOCATION/LongitudeCentre"))
  NO2_column <- h5read(filenames[i], "/TOTAL_COLUMNS/NO2")
  LAT = rbind(LAT, data.frame(lat))
  LON = rbind(LON, data.frame(lon))
  NO2 = rbind(NO2, data.frame(NO2_column))
}



#List the content of the HDF5 file.
tmp <- h5ls(fname)
lat <- h5read(fname, "/GEOLOCATION/LatitudeCentre")
lon <- h5read(fname, "/GEOLOCATION/LongitudeCentre")
NO2_column <- h5read(fname, "/TOTAL_COLUMNS/NO2")
dim(NO2_column)

#crop to desired area
# lonRan <- c(-180, +180)
# latRan <- c(20, 50)
# lonKeep <- which(lon > lonRan[1] & lon < lonRan[2])
# latKeep <- which(lat> latRan[1] & lat< latRan[2])

