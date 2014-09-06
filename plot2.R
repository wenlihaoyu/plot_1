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
png(file="plot2.png",width = 480, height = 480, bg="transparent")
plot(x=data1$DateTime,y=data1$Global_active_power,type='l',xlab='',ylab='Global Active Power(kilowatts)')
dev.off()

