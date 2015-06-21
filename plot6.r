require(ggplot2)
require(plyr)
setwd("C:\\Users\\tanveer.khan\\Desktop\\Data Science\\exdata-data-NEI_data")
getwd()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
str(SCC)
la_balt_data <- subset(NEI,fips == "24510" | fips =="06037")
la_balt_data <- transform(la_balt_data,year=as.factor(year))
la_balt_full <- join(la_balt_data,SCC)
##rm(list=c("la_balt_data","NEI"))
la_balt_vehicle <- la_balt_full[grep("vehicle",la_balt_full[,c("SCC.Level.Two")],ignore.case=TRUE),]

plot_df <- ddply(la_balt_vehicle,.(year,fips),summarize,Total=sum(Emissions))
plot_df <- transform(plot_df,fips=as.factor(fips))
str(plot_df)
levels(plot_df$fips)
levels(plot_df$fips) <- c("Los Angeles","Baltimore")
levels(plot_df$fips)

png(filename="C:\\Data Science\\ExData_Plotting2\\ExData_Plotting2\\plot6.png",height=480,width=480,units="px",bg="white")

ggplot(plot_df,aes(year,Total)) + geom_bar(stat="identity",fill="steelblue",width=0.6) + labs(x="Year") + labs(y=expression("Total " * PM[2.5] * "Emissions (Tons)")) + labs(title=expression(PM[2.5] * "Emissions by Motor Vehicle in LA & Baltimore from 1999-2008")) + facet_wrap(~fips,nrow=1)

dev.off()

