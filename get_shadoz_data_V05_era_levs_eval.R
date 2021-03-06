# R script to read in and average the SHADOZ ozone sonde data.

# You just need to pass in a path directory and you will be returned with
# a set of 12 monthly averaged height binned O3 data.

# Alex Archbiald, CAS, May 2012

# List all the files in the folder
setwd(dir.path)
files     <- list.files()

# convert file names into dates
#datetimes <- as.Date(files, "fiji_%Y%m%d")
tmp1  <- unlist(strsplit(files, "_", fixed=T))
tmp2  <- unlist(strsplit(tmp1, ".", fixed=T))
tmp3  <- as.numeric(tmp2)
tmp4  <- tmp3[complete.cases(tmp3)]
datetimes <- strptime(tmp4, format="%Y%m%d")
rm(tmp1, tmp2, tmp3, tmp4)  # clean up

# read in the data (skip the first 19 rows) and combine into a data frame 
dat       <- lapply(files, read.table, skip=24, na.strings="9000.0")

# loop over the number of files and add the Date to the data
for (i in 1:length(files)) {
    dat[[i]]$Date = rep(datetimes[i], nrow(dat[[i]]))
}

# combine the data into one data.frame
dat <- do.call("rbind", dat)

# subset the master data.frame by the pressure (hPa) that the measurment was made at
dat0  <- subset(dat, dat$V2>=1000)
dat1  <- subset(dat, dat$V2>=975 & dat$V2<=1000)
dat2  <- subset(dat, dat$V2>=950 & dat$V2<=975)
dat3  <- subset(dat, dat$V2>=925 & dat$V2<=950)
dat4  <- subset(dat, dat$V2>=900 & dat$V2<=925)
dat5  <- subset(dat, dat$V2>=875 & dat$V2<=900)
dat6  <- subset(dat, dat$V2>=850 & dat$V2<=875)
dat7  <- subset(dat, dat$V2>=825 & dat$V2<=850)
dat8  <- subset(dat, dat$V2>=800 & dat$V2<=825)
dat9  <- subset(dat, dat$V2>=775 & dat$V2<=800)
dat10 <- subset(dat, dat$V2>=750 & dat$V2<=775)
dat11 <- subset(dat, dat$V2>=700 & dat$V2<=750)
dat12 <- subset(dat, dat$V2>=650 & dat$V2<=700)
dat13 <- subset(dat, dat$V2>=600 & dat$V2<=650)
dat14 <- subset(dat, dat$V2>=550 & dat$V2<=600)
dat15 <- subset(dat, dat$V2>=500 & dat$V2<=550)
dat16 <- subset(dat, dat$V2>=450 & dat$V2<=500)
dat17 <- subset(dat, dat$V2>=400 & dat$V2<=450)
dat18 <- subset(dat, dat$V2>=350 & dat$V2<=400)
dat19 <- subset(dat, dat$V2>=300 & dat$V2<=350)
dat20 <- subset(dat, dat$V2>=250 & dat$V2<=300)
dat21 <- subset(dat, dat$V2>=225 & dat$V2<=250)
dat22 <- subset(dat, dat$V2>=200 & dat$V2<=225)
dat23 <- subset(dat, dat$V2>=175 & dat$V2<=200)
dat24 <- subset(dat, dat$V2>=150 & dat$V2<=175)
dat25 <- subset(dat, dat$V2>=125 & dat$V2<=150)
dat26 <- subset(dat, dat$V2>=100 & dat$V2<=125)
dat27 <- subset(dat, dat$V2>=70 & dat$V2<=100)
dat28 <- subset(dat, dat$V2>=50 & dat$V2<=70)
dat29 <- subset(dat, dat$V2>=30 & dat$V2<=50)
dat30 <- subset(dat, dat$V2>=20 & dat$V2<=30)
dat31 <- subset(dat, dat$V2>=10 & dat$V2<=20)
#dat32 <- subset(dat, dat$V2>=7 & dat$V2<=10)
#dat33 <- subset(dat, dat$V2>=5 & dat$V2<=7)
#dat34 <- subset(dat, dat$V2>=3 & dat$V2<=5)
#dat35 <- subset(dat, dat$V2>=2 & dat$V2<=3)
#dat36 <- subset(dat, dat$V2>=1 & dat$V2<=2)

# format the data.frame such that the monthly avergaes (Jan-Dec) for each height are calculated
dat0  <- tapply(dat0$V7, format(dat0$Date, "%m"), mean, na.rm=T)
dat1  <- tapply(dat1$V7, format(dat1$Date, "%m"), mean, na.rm=T)
dat2  <- tapply(dat2$V7, format(dat2$Date, "%m"), mean, na.rm=T)
dat3  <- tapply(dat3$V7, format(dat3$Date, "%m"), mean, na.rm=T)
dat4  <- tapply(dat4$V7, format(dat4$Date, "%m"), mean, na.rm=T)
dat5  <- tapply(dat5$V7, format(dat5$Date, "%m"), mean, na.rm=T)
dat6  <- tapply(dat6$V7, format(dat6$Date, "%m"), mean, na.rm=T)
dat7  <- tapply(dat7$V7, format(dat7$Date, "%m"), mean, na.rm=T)
dat8  <- tapply(dat8$V7, format(dat8$Date, "%m"), mean, na.rm=T)
dat9  <- tapply(dat9$V7, format(dat9$Date, "%m"), mean, na.rm=T)
dat10 <- tapply(dat10$V7, format(dat10$Date, "%m"), mean, na.rm=T)
dat11 <- tapply(dat11$V7, format(dat11$Date, "%m"), mean, na.rm=T)
dat12 <- tapply(dat12$V7, format(dat12$Date, "%m"), mean, na.rm=T)
dat13 <- tapply(dat13$V7, format(dat13$Date, "%m"), mean, na.rm=T)
dat14 <- tapply(dat14$V7, format(dat14$Date, "%m"), mean, na.rm=T)
dat15 <- tapply(dat15$V7, format(dat15$Date, "%m"), mean, na.rm=T)
dat16 <- tapply(dat16$V7, format(dat16$Date, "%m"), mean, na.rm=T)
dat17 <- tapply(dat17$V7, format(dat17$Date, "%m"), mean, na.rm=T)
dat18 <- tapply(dat18$V7, format(dat18$Date, "%m"), mean, na.rm=T)
dat19 <- tapply(dat19$V7, format(dat19$Date, "%m"), mean, na.rm=T)
dat20 <- tapply(dat20$V7, format(dat20$Date, "%m"), mean, na.rm=T)
dat21 <- tapply(dat21$V7, format(dat21$Date, "%m"), mean, na.rm=T)
dat22 <- tapply(dat22$V7, format(dat22$Date, "%m"), mean, na.rm=T)
dat23 <- tapply(dat23$V7, format(dat23$Date, "%m"), mean, na.rm=T)
dat24 <- tapply(dat24$V7, format(dat24$Date, "%m"), mean, na.rm=T)
dat25 <- tapply(dat25$V7, format(dat25$Date, "%m"), mean, na.rm=T)
dat26 <- tapply(dat26$V7, format(dat26$Date, "%m"), mean, na.rm=T)
dat27 <- tapply(dat27$V7, format(dat27$Date, "%m"), mean, na.rm=T)
dat28 <- tapply(dat28$V7, format(dat28$Date, "%m"), mean, na.rm=T)
dat29 <- tapply(dat29$V7, format(dat29$Date, "%m"), mean, na.rm=T)
dat30 <- tapply(dat30$V7, format(dat30$Date, "%m"), mean, na.rm=T)
dat31 <- tapply(dat31$V7, format(dat31$Date, "%m"), mean, na.rm=T)
#dat32 <- tapply(dat32$V7, format(dat32$Date, "%m"), mean, na.rm=T)
#dat33 <- tapply(dat33$V7, format(dat33$Date, "%m"), mean, na.rm=T)
#dat34 <- tapply(dat34$V7, format(dat34$Date, "%m"), mean, na.rm=T)
#dat35 <- tapply(dat35$V7, format(dat35$Date, "%m"), mean, na.rm=T)
#dat36 <- tapply(dat36$V7, format(dat36$Date, "%m"), mean, na.rm=T)

# combine the heights and reform the data
data <- rbind(dat0, dat1, dat2, dat3, dat4, dat5, dat6, dat7, dat8, dat9, dat10, dat11, dat12, dat13, 
dat14, dat15, dat16, dat17, dat18, dat19, dat20, dat21, dat22, dat23, dat24, dat25, dat26, dat27, 
dat28, dat29, dat30, dat31)#, dat32, dat33, dat34, dat35, dat36)

#plot(data[,i], 1:35, xlim=c(0,0.15))

