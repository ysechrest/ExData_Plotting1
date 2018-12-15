fname = "epd_assign1_trim.txt"
colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
df <- read.csv(fname,header=TRUE,sep=";",colClasses=colClasses,na.strings="?")

df <- within(df, datetime <- paste(Date,Time,sep=" "))
df <- transform(df, datetime = strptime(datetime,format="%d/%m/%Y %H:%M:%S"))

png(filename="plot3.png",width=480,height=480,units="px")

with(df, plot(datetime,Sub_metering_1,
              type="l",xlab="",
              ylab="Energy Sub Metering"))
with(df, lines(datetime,Sub_metering_2,
              col="red"))
with(df, lines(datetime,Sub_metering_3,
               col="blue"))
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=c(1,1,1),col=c("black","red","blue"))

dev.off()