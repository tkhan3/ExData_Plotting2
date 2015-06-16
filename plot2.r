setwd("C:\\Users\\tanveer.khan\\Desktop\\Data Science\\exdata-data-NEI_data")
getwd()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
NEI <- transform(NEI,year=as.factor(year))
str(NEI)
names(NEI)
names(SCC)
##attach(NEI)
baltimore <- subset(NEI,fips == "24510")
attach(baltimore)
s <- split(Emissions,year,drop=T)
v1 <- sapply(s,sum)
##setwd("C:\\Data Science\\ExData_Plotting2\\ExData_Plotting2")
png(filename = "C:\\Data Science\\ExData_Plotting2\\ExData_Plotting2\\plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

plot(names(v1),v1,type="l",xlim=c(1999,2008),xlab="Year",ylab="Total Emissions",col="red",main="Total Emission/Year Baltimore City")
dev.off()


