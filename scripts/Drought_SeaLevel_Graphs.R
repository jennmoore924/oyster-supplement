#############
## Create plots
## Palmer Drought Severity Index
## Sea Level Trends
## Jennifer Moore
## August 19, 2019
#############

#Palmer Drought Severity Index
#Southeast Georgia
#North Florida

gdi <- read.csv("data/GeorgiaDroughtIndex.csv", header = T)
#georgia
#column PDSI 
#data is monthly from January 2010 to July 2019 (column YearMonth)
fdi <- read.csv("data/FloridaDroughtIndex.csv", header = T)
#florida

#create a Date column from the column YearMonth 
#have to have a day so just add 01
gdi$Date <- paste(substr(gdi$YearMonth,1,4),"-",substr(gdi$YearMonth,5,6),"-01", sep = '')
gdi$Date <- as.Date(gdi$Date, "%Y-%m-%d")
fdi$Date <- paste(substr(fdi$YearMonth,1,4),"-",substr(fdi$YearMonth,5,6),"-01", sep = '')
fdi$Date <- as.Date(fdi$Date, "%Y-%m-%d")

#plot
plot(gdi$Date, gdi$PDSI, xlab = "Date", ylab = "PDSI", type = 'l', ylim = c(-6,6), lwd = 2, cex.lab = 1.2, cex.axis = 1.2)
lines(fdi$Date, fdi$PDSI, col = "red", lwd = 2)
legend("topleft", legend = c("North Florida", "Southeast Georgia"), col = c("red", "black"), lty = 1, lwd = 2, bty = 'n', cex = 1.2)


#Percipitation Index
#Southeast Georgia
#North Florida
plot(gdi$Date, gdi$PCP, xlab = "Date", ylab = "Precipitation", type = 'l', ylim = c(0,20), lwd = 2, cex.lab = 1.2, cex.axis = 1.2)
lines(fdi$Date, fdi$PCP, col = "red", lwd = 2)
legend("topleft", legend = c("North Florida", "Southeast Georgia"), col = c("red", "black"), lty = 1, lwd = 2, bty = 'n', cex = 1.2)


#Sea Level Trends
#Cedar Key, Florida 8727520
sl <- read.csv("data/sealeveltrend.csv", header = T)
#Monthly_MSL - monthly mean sea level
#create date column
#have to add day - so just 01 for every month
sl$Date <- paste(sl$Year, "-0", sl$Month, "-01", sep = "")
sl$Date <- as.Date(sl$Date, "%Y-%m-%d")

#plot
plot(sl$Date, sl$Monthly_MSL, type = 'l', xlab = "Date", ylab = "Monthly Mean Sea Level", cex.lab = 1.2, cex.axis = 1.2, lwd = 1.5)
lines(sl$Date, sl$Linear_Trend, lwd = 2)



#####put all plots on the same page
layout(matrix(c(2,3,1,1), 2, 2, byrow = TRUE))
plot(sl$Date, sl$Monthly_MSL, type = 'l', xlab = "Date", ylab = "Monthly Mean Sea Level", cex.lab = 1.2, cex.axis = 1.2, lwd = 1.5)
lines(sl$Date, sl$Linear_Trend, lwd = 2)
plot(gdi$Date, gdi$PDSI, xlab = "Date", ylab = "PDSI", type = 'l', ylim = c(-6,6), lwd = 2, cex.lab = 1.2, cex.axis = 1.2)
lines(fdi$Date, fdi$PDSI, col = "red", lwd = 2)
legend("topleft", legend = c("North Florida", "Southeast Georgia"), col = c("red", "black"), lty = 1, lwd = 2, bty = 'n', cex = 1)
plot(gdi$Date, gdi$PCP, xlab = "Date", ylab = "Precipitation", type = 'l', ylim = c(0,20), lwd = 2, cex.lab = 1.2, cex.axis = 1.2)
lines(fdi$Date, fdi$PCP, col = "red", lwd = 2)
legend("topleft", legend = c("North Florida", "Southeast Georgia"), col = c("red", "black"), lty = 1, lwd = 2, bty = 'n', cex = 1)


