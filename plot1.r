fname = "epd_assign1_trim.txt"
colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
df <- read.csv(fname,header=TRUE,sep=";",colClasses=colClasses,na.strings="?")

df <- within(df, datetime <- paste(Date,Time,sep=" "))
df <- transform(df, datetime = strptime(datetime,format="%d/%m/%Y %H:%M:%S"))

png(filename="plot1.png",width=480,height=480,units="px")

with( df, hist(Global_active_power,col="red",
               xlab="Global Active Power [Kilowatt]",
               ylab="Frequency",
               main="Global Active Power",
               ylim=c(0,1200)))

dev.off()