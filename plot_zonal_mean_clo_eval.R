# R Script to plot zonal mean model ClO

# Alex Archibald, June 2012


# extract obs
nc0 <- open.ncdf("/data/ata27/MLS/mls_clo_2005-2011.nc")

mls.hgt <- get.var.ncdf(nc0,"Pressure")
mls.hgt <- -7.2*log(mls.hgt/1000.0) # MLS height in hPa's

mls.lat <- get.var.ncdf(nc0, "latitude")
mls.clo <- get.var.ncdf(nc0, "MLS_ClO")
mls.clo <- apply(mls.clo, c(1,2), mean)*1E9

# extract/define variables
lat    <- get.var.ncdf(nc1, "latitude")
hgt    <- get.var.ncdf(nc1, "hybrid_ht")*1E-3
conv   <- 1E9 # ppb

# ###################################################################################################################################
# set axis'
axis_x <- seq(-90,90,15)
axis_y <- seq(0,65,5)

# set limits for plots and data
zmin <- 0.0
zmax <- 1.0
clo.zm <- apply( (get.var.ncdf(nc1, clo.code)*conv/mm.clo), c(2,3), mean)
clo.zm[clo.zm>=zmax] <- zmax
clo.zm[clo.zm<=zmin] <- zmin
# ###################################################################################################################################
pdf(file=paste(out.dir,mod1.name,"_ClO_Zonal_mean.pdf", sep=""),width=8,height=6,paper="special",onefile=TRUE,pointsize=12)

# overplot the data 
filled.contour(lat, hgt, clo.zm, ylab="Altitude (km)", xlab="Latitude (degrees)", main=paste("MLS - UKCA",mod1.name,"ClO comparison",sep=" "), zlim=c(zmin,0.6), col=col.cols(12),
key.title = title("ppm"),
ylim=c(0,65), 
plot.axes= {
contour(lat, hgt, clo.zm, method = "edge", labcex = 1, col = "gray", cex=0.7, add = TRUE, lty=1, levels=seq(0,0.5,0.05)) 
contour(mls.lat, mls.hgt, mls.clo, method = "edge", labcex = 1, col = "black", add = TRUE, lty=1, levels=seq(0,0.5,0.05)) # obs
axis(side=1, axis_x, labels=TRUE, tick=TRUE)
axis(side=2, axis_y, labels=TRUE, tick=TRUE)
grid() } )

par(xpd=T)
text(-70,67, paste("Min =",sprintf("%1.3g", min(clo.zm) ), "Max =", sprintf("%1.3g", max(clo.zm) ), sep=" ") )
par(xpd=F)

dev.off()

# ###################################################################################################################################
