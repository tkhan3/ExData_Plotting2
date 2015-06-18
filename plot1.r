## Set the working directory to read the files
setwd("C:\\Users\\tanveer.khan\\Desktop\\Data Science\\exdata-data-NEI_data")
## Check if working directory is changed.
getwd()
## Read the data from .rds files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##check the type of class of variables and their distributions
str(NEI)
## Since we want to go an aggregation based on years we can change into factor and for all level of years we can dp the summation.
NEI <- transform(NEI,year=as.factor(year))
## verify if year is a categorical variable now
str(NEI)
names(NEI)
names(SCC)
## split the dataframe baltimore for each year and emissions drop values which are null
attach(NEI)
s <- split(Emissions,year,drop=T)
v1 <- sapply(s,sum)
##open the graphic device to save the plot.
setwd("C:\\Data Science\\ExData_Plotting2\\ExData_Plotting2")
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

##plot(names(v1),v1,type="l",xlim=c(1999,2008),xlab="Year",ylab="Total PM 2Emissions",col="red",main="Total Emission/Year")
plot(names(v1),v1,type="l",xlim=c(1999,2008),xlab="Year",ylab=expression("Total " * PM[2.5] * " Emissions"),col="red",main=expression("Total " * PM[2.5] * "  Emissions/Year Baltimore City"))

dev.off()