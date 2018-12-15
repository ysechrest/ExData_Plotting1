fname = "epd_assign1_trim.txt"
colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
df <- read.csv(fname,header=TRUE,sep=";",colClasses=colClasses,na.strings="?")

df <- within(df, datetime <- paste(Date,Time,sep=" "))
df <- transform(df, datetime = strptime(datetime,format="%d/%m/%Y %H:%M:%S"))

png(filename="plot2.png",width=480,height=480,units="px")

with(df, plot(datetime,Global_active_power,
              type="l",xlab="",
              ylab="Global Active Power [Kilowattt]"))

dev.off()