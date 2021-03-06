# R script to extract profiles from Zonal Mean
# UARS data
 
# open data
#nc0 <- open.ncdf(paste(obs.dir, "UARS/uars_data_on_height.nc", sep=""))
nc0 <- open.ncdf(paste(obs.dir, "UARS/uars_clim.nc", sep=""))
# extract variables (UARS height in km's)
uars.hgt <- get.var.ncdf(nc0,"z")
uars.lat <- get.var.ncdf(nc0, "latitude")
uars.lon <- get.var.ncdf(nc0, "longitude")
uars.time<- get.var.ncdf(nc0, "time")

start.lat<- find.lat(uars.lat, first.lat)
end.lat  <- find.lat(uars.lat,  last.lat)

# extract observed variables (these are already zonal means so only need to average
# over the latitude dimension -- keep height)

assign(paste(location,".uars.o3.z",sep=""), apply( (get.var.ncdf(nc0, "tr16", start=c(1, start.lat, 1, 1), count=c(length(uars.lon), end.lat-start.lat, length(uars.hgt), length(uars.time)))), c(2), mean, na.rm=T) )
assign(paste(location,".uars.no.z",sep=""), apply( (get.var.ncdf(nc0, "tr08", start=c(1, start.lat, 1, 1), count=c(length(uars.lon), end.lat-start.lat, length(uars.hgt), length(uars.time)))), c(2), mean, na.rm=T) )
assign(paste(location,".uars.hno3.z",sep=""), apply( (get.var.ncdf(nc0, "tr13", start=c(1, start.lat, 1, 1), count=c(length(uars.lon), end.lat-start.lat, length(uars.hgt), length(uars.time)))), c(2), mean, na.rm=T) )
assign(paste(location,".uars.no2.z",sep=""), apply( (get.var.ncdf(nc0, "tr06", start=c(1, start.lat, 1, 1), count=c(length(uars.lon), end.lat-start.lat, length(uars.hgt), length(uars.time)))), c(2), mean, na.rm=T) )
assign(paste(location,".uars.hcl.z",sep=""), apply( (get.var.ncdf(nc0, "tr05", start=c(1, start.lat, 1, 1), count=c(length(uars.lon), end.lat-start.lat, length(uars.hgt), length(uars.time)))), c(2), mean, na.rm=T) )
assign(paste(location,".uars.n2o.z",sep=""), apply( (get.var.ncdf(nc0, "tr12", start=c(1, start.lat, 1, 1), count=c(length(uars.lon), end.lat-start.lat, length(uars.hgt), length(uars.time)))), c(2), mean, na.rm=T) )
assign(paste(location,".uars.h2o.z",sep=""), apply( (get.var.ncdf(nc0, "tr15", start=c(1, start.lat, 1, 1), count=c(length(uars.lon), end.lat-start.lat, length(uars.hgt), length(uars.time)))), c(2), mean, na.rm=T) )

