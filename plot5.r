require(ggplot2)
require(plyr)
setwd("C:\\Users\\tanveer.khan\\Desktop\\Data Science\\exdata-data-NEI_data")
getwd()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)
str(SCC)
baltimore <- subset(NEI,fips == "24510")
baltimore <- transform(baltimore,year=as.factor(year))
baltimore_full <- join(baltimore,SCC)
rm(list=c("baltimore","NEI"))
baltimore_vehicle <- baltimore_full[grep("vehicle",baltimore_full[,c("SCC.Level.Two")],ignore.case=TRUE),]
rm(baltimore_full)
plot_df <- ddply(baltimore_vehicle,.(year),summarize,Total=sum(Emissions))
png(filename="C:\\Data Science\\ExData_Plotting2\\ExData_Plotting2\\plot5.png",height=480,width=480,units="px",bg="white")
ggplot(plot_df,aes(year,Total)) + geom_bar(stat="identity",fill="steelblue",width=0.6) + labs(x="Year") + labs(y=expression("Total " * PM[2.5] * "Emissions (Tons)")) + labs(title=expression(PM[2.5] * "Emissions by Motor Vehicle in Baltimore from 1999-2008"))
dev.off()



