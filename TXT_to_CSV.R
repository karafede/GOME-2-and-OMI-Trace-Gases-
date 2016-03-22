
#setwd("G:/processed_data/feb2015/no2/") #### Change here month and trace gas (no2, so2, o3)
#setwd("G:/processed_data/feb2015/so2/")
setwd("G:/processed_data/feb2015/o3/")

#setwd("G:/processed_data/feb2015/no2/monthly/")
#setwd("G:/processed_data/feb2015/so2/monthly/")
#setwd("G:/processed_data/feb2015/o3/monthly/")

FILES <- list.files( pattern = ".txt")

for (i in 1:length(FILES)) {
  FILE=read.table(file=FILES[i],sep="",header=FALSE)
  colnames(FILE) <- c("lat", "lon", "GOME2a")
  write.csv(FILE,file=paste0("G:/processed_data/feb2015/o3/",
          sub(".txt","",FILES[i]),".csv"),row.names=FALSE)
}

### N.B. Error message is for the LISTA_NO2, SO2, O3.TXT files...
### so, don't worry abouth that message.