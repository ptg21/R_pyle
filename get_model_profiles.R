# R script to extract model variables at given latitudes

lat       <- get.var.ncdf(nc1, "latitude")
start.lat <- find.lat(lat, first.lat)
end.lat   <- find.lat(lat,  last.lat)

assign(paste(location,".mod.o3.z",sep=""), apply( (get.var.ncdf(nc1, o3.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppm/mm.o3)), c(3), mean) )
assign(paste(location,".mod.co.z",sep=""), apply( (get.var.ncdf(nc1, co.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.co)), c(3), mean) )
assign(paste(location,".mod.hno3.z",sep=""), apply( (get.var.ncdf(nc1, hono2.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.hono2)), c(3), mean) )
assign(paste(location,".mod.h2o2.z",sep=""), apply( (get.var.ncdf(nc1, h2o2.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppt/mm.h2o2)), c(3), mean) )
assign(paste(location,".mod.no.z",sep=""), apply( (get.var.ncdf(nc1, no.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.no)), c(3), mean) )
assign(paste(location,".mod.no2.z",sep=""), apply( (get.var.ncdf(nc1, no2.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.no2)), c(3), mean) )
assign(paste(location,".mod.h2co.z",sep=""), apply( (get.var.ncdf(nc1, hcho.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppt/mm.hcho)), c(3), mean) )
if ( (mod1.type=="CheS") | (mod1.type=="CheST") ) {
assign(paste(location,".mod.n2o.z",sep=""), apply( (get.var.ncdf(nc1, n2o.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.n2o)), c(3), mean) )
assign(paste(location,".mod.h2o.z",sep=""), apply( (get.var.ncdf(nc1, h2o.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppm/mm.h2o)), c(3), mean) )
assign(paste(location,".mod.clono2.z",sep=""), apply( (get.var.ncdf(nc1, clono2.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppt/mm.clono2)), c(3), mean) )
assign(paste(location,".mod.hcl.z",sep=""), apply( (get.var.ncdf(nc1, hcl.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.hcl)), c(3), mean) )
assign(paste(location,".mod.cly.z",sep=""), apply( (get.var.ncdf(nc1, cly.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.hcl)), c(3), mean) )
assign(paste(location,".mod.noy.z",sep=""), apply( (get.var.ncdf(nc1, noy.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.no2)), c(3), mean) )
}

assign(paste(location,".mod.o3.z.sd",sep=""), apply( (get.var.ncdf(nc1, o3.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppm/mm.o3)), c(3), sd) )
assign(paste(location,".mod.co.z.sd",sep=""), apply( (get.var.ncdf(nc1, co.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.co)), c(3), sd) )
assign(paste(location,".mod.hno3.z.sd",sep=""), apply( (get.var.ncdf(nc1, hono2.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.hono2)), c(3), sd) )
assign(paste(location,".mod.h2o2.z.sd",sep=""), apply( (get.var.ncdf(nc1, h2o2.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppt/mm.h2o2)), c(3), sd) )
assign(paste(location,".mod.no.z.sd",sep=""), apply( (get.var.ncdf(nc1, no.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.no)), c(3), sd) )
assign(paste(location,".mod.no2.z.sd",sep=""), apply( (get.var.ncdf(nc1, no2.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.no2)), c(3), sd) )
assign(paste(location,".mod.h2co.z.sd",sep=""), apply( (get.var.ncdf(nc1, hcho.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppt/mm.hcho)), c(3), sd) )
if ( (mod1.type=="CheS") | (mod1.type=="CheST") ) {
assign(paste(location,".mod.n2o.z.sd",sep=""), apply( (get.var.ncdf(nc1, n2o.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.n2o)), c(3), sd) )
assign(paste(location,".mod.h2o.z.sd",sep=""), apply( (get.var.ncdf(nc1, h2o.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppm/mm.h2o)), c(3), sd) )
assign(paste(location,".mod.clono2.z.sd",sep=""), apply( (get.var.ncdf(nc1, clono2.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppt/mm.clono2)), c(3), sd) )
assign(paste(location,".mod.hcl.z.sd",sep=""), apply( (get.var.ncdf(nc1, hcl.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.hcl)), c(3), sd) )
assign(paste(location,".mod.cly.z.sd",sep=""), apply( (get.var.ncdf(nc1, cly.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.hcl)), c(3), sd) )
assign(paste(location,".mod.noy.z.sd",sep=""), apply( (get.var.ncdf(nc1, noy.code, start=c(1, start.lat, 1, 1), count=c(length(lon), end.lat-start.lat, length(hgt), length(time)) )*(ppb/mm.no2)), c(3), sd) )
}