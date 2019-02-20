library(dplyr) # for data cleaning
library(ISLR) # for college dataset
library(cluster) # for gower similarity and pam
library(Rtsne) # for t-SNE plot
library(ggplot2) # for visualization
library(klaR)

data <- read.table('C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/RawData/i210_E_2018_parse.csv', sep=',', header=TRUE)
dayAttributes <- read.table('C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/DayAttributes.csv', sep=',', header=TRUE, stringsAsFactors = FALSE)
stationAM <- fread('C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/ActualMiles.csv', select=c(1,2, 4))
dataMaster <- left_join(data, stationAM, by = c("Station" = "Station"))


dataMaster <-  separate(dataMaster, col="Time.Stamp", into = c("Date", "Time"), sep=" ", remove = FALSE)
dataMaster <- dataMaster[which(dataMaster$Type=='ML'), ]
dataMaster <- left_join(dataMaster, dayAttributes, by = c("Date" = "Date"))
dataMaster$Time_n <- as.numeric(substring(dataMaster$Time, 1, 2))*60*60+
  as.numeric(substring(dataMaster$Time, 4, 5))*60+
  as.numeric(substring(dataMaster$Time, 7, 8))
dataMaster$Hour <- as.numeric(substring(dataMaster$Time, 1, 2))



# select the fields needed for clustering

dataCluster <- dataMaster[,c("Station","Hour","Day", "Month", "WWH", "Avg.Speed", "Total.Flow")]
dataCluster <- aggregate(.~ Station + Hour+Day+Month+WWH, data = dataCluster, 
                        FUN= 'median')


summary(lm(Avg.Speed~factor(Station, exclude=NA)+factor(Hour)+factor(Day)+factor(Month)+factor(WWH), data=dataCluster))

summary(lm(Avg.Speed~factor(Station)+factor(Hour)+factor(Day)+factor(Month)+factor(WWH), data=dataCluster))
summary(lm(Avg.Speed~factor(Station)+factor(Hour)+factor(Day), data=dataCluster))



#cluster1
cluster.results.kmodes <-kmodes(dataCluster, 40, iter.max = 1000, weighted = FALSE )
dataCluster$cluster10 <- NA
dataCluster$cluster10 <- cluster.results.kmodes$cluster

dataCluster %>% group_by(cluster10) %>% summarize()
dataCluster %>% group_by(cluster10) %>% summarize(
  Hour1 = sum(cluster10[Hour=='1']), 
  Hour2 = sum(cluster10[Hour=='2']),
  Hour3 = sum(cluster10[Hour=='3']),
  Hour4 = sum(cluster10[Hour=='4']),
  Hour5 = sum(cluster10[Hour=='5']),
  Hour6 = sum(cluster10[Hour=='6']),
  Hour7 = sum(cluster10[Hour=='7']),
  Hour8 = sum(cluster10[Hour=='8']),
  Hour9 = sum(cluster10[Hour=='9']),
  Hour10 = sum(cluster10[Hour=='10']),
  Hour11 = sum(cluster10[Hour=='11']),
  Hour12 = sum(cluster10[Hour=='12']),
  Hour13 = sum(cluster10[Hour=='13'])
  )


clusterResult <- as.data.frame(dataCluster %>% group_by(cluster10) %>% summarize(
  Sun = sum(cluster10[Day=='Sunday']), 
  Mon = sum(cluster10[Day=='Monday']),
  Tue = sum(cluster10[Day=='Tuesday']),
  Wed = sum(cluster10[Day=='Wednesday']),
  Thu = sum(cluster10[Day=='Thursday']),
  Fri = sum(cluster10[Day=='Friday']),
  Sat = sum(cluster10[Day=='Saturday']),
  AvgSpeed = mean(Avg.Speed),
  AvgSpeed.25 = quantile(Avg.Speed, .25),
  AvgSpeed.50 = quantile(Avg.Speed, .50),
  AvgSpeed.75 = quantile(Avg.Speed, .75),
  AvgFlow = mean(Total.Flow)
))

write.csv(clusterResult, 'C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/clusterResult.csv')

plot(dataCluster$Avg.Speed, dataCluster$Total.Flow, main="AvgSpeed vs Flow", type='p' , pch=20, cex=.02, ylab='TotalFlow', xlab='AvgSpeed (MPH)')


plot(jitter(dataCluster), col = cluster.results.kmodes$cluster)
points(cl$modes, col = 1:5, pch = 8)





#cluster.results.rock <-rockCluster(as.matrix(dataCluster), 3 )
