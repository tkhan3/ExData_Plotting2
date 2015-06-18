## Set the working directory to read the files
setwd("C:\\Users\\tanveer.khan\\Desktop\\Data Science\\exdata-data-NEI_data")
## Check if working directory is changed.
getwd()
## Read the data from .rds files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##check the type of class of variables and their distributions.
str(NEI)
##check range of variables inside NEI
summary(NEI)
## Since we want to go an aggregation based on years we can change into factor and for all level of years we can dp the summation.
NEI <- transform(NEI,year=as.factor(year))
str(NEI)
names(NEI)
## verify if year is a categorical variable now
names(SCC)
## Get just the baltimore data from original dataset
baltimore <- subset(NEI,fips == "24510")
##attach baltimore data so that variables can be referred directly.
attach(baltimore)
## split the dataframe baltimore for each year and emissions drop values which are null
s <- split(Emissions,year,drop=T)
v1 <- sapply(s,sum) ##calculate sum for each year 
setwd("C:\\Data Science\\ExData_Plotting2\\ExData_Plotting2")
##open the graphic device to save the plot.
png(filename = "C:\\Data Science\\ExData_Plotting2\\ExData_Plotting2\\plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
##generate the plot.
plot(names(v1),v1,type="l",xlim=c(1999,2008),xlab="Year",ylab=expression("Total " * PM[2.5] * " Emissions"),col="red",main=expression("Total " * PM[2.5] * " Emissions in Baltimore City from 1998-2008"))
dev.off()


