setwd("/Users/randale/Data/R_datasets")
colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
df <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses=colClasses,na.strings="?")
idx = df["Date"] == "1/2/2007" | df["Date"] == "2/2/2007"
df <- df[idx,]
write.table(df, file = "epd_assign1_trim.txt", row.names = FALSE,
            sep=";")