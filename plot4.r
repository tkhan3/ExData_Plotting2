require(ggplot2)
require(plyr)
## Set the working directory to read the files
setwd("C:\\Users\\tanveer.khan\\Desktop\\Data Science\\exdata-data-NEI_data")
## Check if working directory is changed.
getwd()
## Read the data from .rds files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##check the type of class of variables and their distributions.
str(NEI)
## Since we want to go an aggregation based on years we can change into factor and for all level of years we can dp the summation.
NEI <- transform(NEI,year=as.factor(year))

full_data <- join(NEI,SCC)
coal_data <- full_data[grep("coal",full_data[,c("EI.Sector")],ignore.case=TRUE),]

names(coal_data)
attach(coal_data)

require(ggplot2)
require(plyr)

plot_df <- ddply(coal_data,.(year),summarize,Total=sum(Emissions))

png(filename = "C:\\Data Science\\ExData_Plotting2\\ExData_Plotting2\\plot4.png",
    width = 480, height = 480, units = "px",
    bg = "white")


ggplot(plot_df,aes(year,Total)) + geom_bar(stat="identity",fill="steelblue",width=0.5) + labs(y=expression("Total " * PM[2.5] * " Emissions ")) + labs(x="Year") + labs(title=expression( "Emissions from coal combustion related sources 1999-2008")) 
##+  guides(fill=FALSE) 

dev.off()