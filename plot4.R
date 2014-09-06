setwd('/Users/lywen/Desktop')
data=read.table('household_power_consumption.txt',sep=";",header=T)
data1=data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
data1=data.frame(strptime(paste(data1[,1],data1[,2]),'%d/%m/%Y %H:%M:%S'),
                 Global_active_power=as.numeric(as.character(data1$Global_active_power)),
                 as.numeric(as.character(data1$Global_reactive_power)),
                 as.numeric(as.character(data1$Voltage)),
                 as.numeric(as.character(data1$Global_intensity)),
                 as.numeric(as.character(data1$Sub_metering_1)),
                 as.numeric(as.character(data1$Sub_metering_2)),
                 as.numeric(as.character(data1$Sub_metering_3)))

names(data1)=c('DateTime',names(data[,c(-1,-2)]))
png(file="plot4.png",width = 480, height = 480, bg="transparent")
attach(data1)
opar=par(no.readonly=TRUE)
#op=par(mar = rep(0, 4))
par(mfrow=c(2,2))

plot(DateTime,Global_active_power,type='l',xlab='',ylab='Global active power')

plot(DateTime,Voltage,type='l',xlab='datetime')
plot(DateTime,Sub_metering_1,type='l',xlab='',ylab='Energy sub meterring',col='black')
lines(DateTime,Sub_metering_2,col='red')
lines(DateTime,Sub_metering_3,col='blue')
legend('topright',inset=0.01,legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=c(1,1,1),col=c('black','red','blue'),cex=0.5)
plot(DateTime,Global_reactive_power,type='l',xlab='datetime')
par(opar)
detach(data1)
dev.off()

