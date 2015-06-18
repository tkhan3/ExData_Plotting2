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
require(ggplot2)
require(plyr)
plot_df <- ddply(baltimore,.(year,type),summarize,Total=sum(Emissions))

png(filename = "C:\\Data Science\\ExData_Plotting2\\ExData_Plotting2\\plot3.png",
    width = 580, height = 480, units = "px",
    bg = "white")

ggplot(plot_df,aes(year,Total,fill=type)) + facet_wrap(~type,nrow=1) + geom_bar(stat="identity") + labs(y=expression("Total " * PM[2.5] * " Emissions")) + labs(x="Year") + labs(title=expression("Total " * PM[2.5] * " Emissions/Year per Type")) +  guides(fill=FALSE) 

dev.off()

 

 


