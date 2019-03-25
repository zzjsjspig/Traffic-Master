library(data.table)
library(dplyr)
library(tidyr)
library(reshape2)
library(ggplot2)
data <- read.table('C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/date_Jan_01_2018_to_Mar_31_2018.csv', sep=',', header=TRUE)
stationPM <- fread('C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/stationsDetails.csv', select=c(6,8, 11))
dataMaster <- left_join(data, stationPM, by = c("Station" = "ID"))
dataMaster <-  separate(dataMaster, col="Time.Stamp", into = c("Date", "Time"), sep=" ", remove = FALSE)
dataMaster$Time_n <- as.numeric(substring(dataMaster$Time, 1, 2))*60*60+
  as.numeric(substring(dataMaster$Time, 4, 5))*60+
  as.numeric(substring(dataMaster$Time, 7, 8))


travelTimev1 <- function(startStation,endStation,time,calc) {
  print(c('startStation: ',startStation, 'endStation: ', endStation))
  
  startStation <- max(stationPM$'Abs PM'[which(stationPM$ID==startStation)])
  endStation <- max(stationPM$'Abs PM'[which(stationPM$ID==endStation)])
  print(c('startStationPM: ', startStation,'endStationPM: ', endStation))
  
  print(c('startDrivingTime (24h): ', time))
  currentTime <- as.numeric(substring(time, 1, 2))*60*60+
    as.numeric(substring(time, 4, 5))*60+
    as.numeric(substring(time, 7, 8))
  
  
  baseTable <<- aggregate(dataMaster$Avg.Speed ~ Station + Time_n, data = dataMaster, 
                          FUN= calc)
  baseTable <<- left_join(baseTable, stationPM[,c('Abs PM', 'ID')], by = c("Station" = "ID"))
  
  baseTable <<- baseTable[which(baseTable$`Abs PM`>=startStation & baseTable$`Abs PM`<=endStation),] 
  colnames(baseTable)[colnames(baseTable)=="dataMaster$Avg.Speed"] <<- "Avg.Speed"
  
  
  calcTable <<- data.frame(sort(unique(baseTable$`Abs PM`)))
  colnames(calcTable)[colnames(calcTable)=="sort.unique.baseTable..Abs.PM..."] <<- "Abs PM"
  
  
  ###Calculating Distance
  #loop each element of the calcTable:
  dist <- numeric(1)
  dist[1] <- NA
  speed <- numeric(1)
  speed[1] <- NA
  travelT <- numeric(1)
  travelT[1] <- 0
  currentT <- numeric(1)
  currentT[1] <- currentTime
  
  for (i in seq(2, length(calcTable$`Abs PM`), 1)){
    
    dist[i] <- calcTable$`Abs PM`[i]-calcTable$`Abs PM`[i-1] 
  }
  calcTable$dist <<- dist
  
  for (i in seq(2, length(calcTable$`Abs PM`), 1)){
    
    baseTable2 <<-NA
    baseTable2 <<- baseTable[which(baseTable$`Abs PM`==calcTable$`Abs PM`[i-1]),]
    #print(baseTable2)
    baseTable2$timeDiff <<- abs(baseTable2$Time_n - currentT[i-1])
    #print(baseTable2)
    
    speed[i] = mean(baseTable2$Avg.Speed[which(baseTable2$timeDiff==min(baseTable2$timeDiff))])
    travelT[i] = dist[i]/speed[i]*60*60
    currentT[i] = currentT[i-1]+travelT[i]
  }
  
  calcTable$speed <<- speed
  calcTable$travelT <<- travelT
  calcTable$currentT <<- currentT
  
  print(c('Total Travel Time(m):',sum(calcTable$travelT)/60))
}
travelTimev1(startStation = '768297', endStation = '770012', time='00:00:04', calc='mean')
travelTimev1(startStation = '768297', endStation = '772905', time='09:08:40', calc='min')
#https://www.google.com/maps/dir/Unnamed+Road,+Sylmar,+CA+91342/I-210,+Pasadena,+CA/@34.3222965,-118.4790492,16.71z/data=!4m14!4m13!1m5!1m1!1s0x80c28f8ec2a14337:0x948cfbfa5046847a!2m2!1d-118.4791015!2d34.3225677!1m5!1m1!1s0x80c2e82ee01a1731:0x3d8b10f8674c2e28!2m2!1d-118.1454!2d34.15156!3e0


travelTimev2 <- function(startStation,endStation,time,calc) {
  
  print(c('startStation: ',startStation, 'endStation: ', endStation))
  startStation <- max(stationPM$'Abs PM'[which(stationPM$ID==startStation)])
  endStation <- max(stationPM$'Abs PM'[which(stationPM$ID==endStation)])
  print(c('startStationPM: ', startStation,'endStationPM: ', endStation))
  print(c('startDrivingTime (24h): ', time))
  
  totalTravelTime <- numeric(1)
  
  startTime <- as.numeric(substring(time, 1, 2))*60*60+
    as.numeric(substring(time, 4, 5))*60+
    as.numeric(substring(time, 7, 8))
  
  timeString = c((if((startTime-7200)<0){startTime-7200+86400} else {startTime-7200}),
                 (if((startTime-3600)<0){startTime-3600+86400} else {startTime-3600}),
                 (if((startTime-1800)<0){startTime-1800+86400} else {startTime-1800}),
                 (startTime),
                 (if((startTime+1800)>86100){startTime+1800-86400} else {startTime+1800}),
                 (if((startTime+3600)>86100){startTime+1800-86400} else {startTime+3600}),
                 (if((startTime+7200)>86100){startTime+1800-86400} else {startTime+7200})
  )
  
  for (j in seq(1, length(timeString), 1)) {
    
    #print(timeString)
    
  
    baseTable <<- aggregate(dataMaster$Avg.Speed ~ Station + Time_n, data = dataMaster, 
                    FUN= calc)
    baseTable <<- left_join(baseTable, stationPM[,c('Abs PM', 'ID')], by = c("Station" = "ID"))
  
    baseTable <<- baseTable[which(baseTable$`Abs PM`>=startStation & baseTable$`Abs PM`<=endStation),] 
    colnames(baseTable)[colnames(baseTable)=="dataMaster$Avg.Speed"] <<- "Avg.Speed"
    
    calcTable <<- NA
    calcTable <<- data.frame(sort(unique(baseTable$`Abs PM`)))
    colnames(calcTable)[colnames(calcTable)=="sort.unique.baseTable..Abs.PM..."] <<- "Abs PM"
    
    
    ###Calculating Distance
    #loop each element of the calcTable:
    dist <- NA
    dist <- numeric(1)
    dist[1] <- NA
    speed <- NA
    speed <- numeric(1)
    speed[1] <- NA
    travelT <- NA
    travelT <- numeric(1)
    travelT[1] <- 0
    currentT <-NA
    currentT <- numeric(1)
    currentT[1] <- timeString[j]
    print(currentT[1])
    
    for (i in seq(2, length(calcTable$`Abs PM`), 1)){
      
      dist[i] <- calcTable$`Abs PM`[i]-calcTable$`Abs PM`[i-1] 
    }
    calcTable$dist <<- dist
    
    for (i in seq(2, length(calcTable$`Abs PM`), 1)){
      baseTable2 <<-NA
      baseTable2 <<- baseTable[which(baseTable$`Abs PM`==calcTable$`Abs PM`[i-1]),]
      baseTable2$timeDiff <<- abs(baseTable2$Time_n - currentT[i-1])
      speed[i] = mean(baseTable2$Avg.Speed[which(baseTable2$timeDiff==min(baseTable2$timeDiff))])
      travelT[i] = dist[i]/speed[i]*60*60
      currentT[i] = currentT[i-1]+travelT[i]
    }
    
    calcTable$speed <<- speed
    calcTable$travelT <<- travelT
    calcTable$currentT <<- currentT
    
    print(c('Total Travel Time(m):',sum(calcTable$travelT)/60))
    
    
  totalTravelTime[j] =  sum(calcTable$travelT)/60
   
  }  
  print(totalTravelTime)
  timeLabel = factor(c('-2hr', '-1hr', '-30min', 'leaveNOW', '+30min', '+1hr', '+2hr'), levels = c('-2hr', '-1hr', '-30min', 'leaveNOW', '+30min', '+1hr', '+2hr'))
  print(timeLabel)
  plot(timeLabel, totalTravelTime, type='b')
}
travelTimev2(startStation = '768297', endStation = '770012', time='10:00:04', calc='mean')
travelTimev2(startStation = '768297', endStation = '772905', time='00:08:40', calc='min')
#https://www.google.com/maps/dir/Unnamed+Road,+Sylmar,+CA+91342/I-210,+Pasadena,+CA/@34.3222965,-118.4790492,16.71z/data=!4m14!4m13!1m5!1m1!1s0x80c28f8ec2a14337:0x948cfbfa5046847a!2m2!1d-118.4791015!2d34.3225677!1m5!1m1!1s0x80c2e82ee01a1731:0x3d8b10f8674c2e28!2m2!1d-118.1454!2d34.15156!3e0


travelTimev3 <- function(startStation,endStation,time) {
  
  
  print(c('startStation: ',startStation, 'endStation: ', endStation))
  startStation <- max(stationPM$'Abs PM'[which(stationPM$ID==startStation)])
  endStation <- max(stationPM$'Abs PM'[which(stationPM$ID==endStation)])
  print(c('startStationPM: ', startStation,'endStationPM: ', endStation))
  print(c('startDrivingTime (24h): ', time))
  
  calc = c('max','min','median')
  for (xx in seq(1, length(calc), 1)){
    
    
    
    if(xx==1){
      totalTravelTimeMax <- numeric(1)
    }
    else if (xx==2){
      
      totalTravelTimeMin <- numeric(1)
    }
    else if (xx==3){
      totalTravelTimeMed <- numeric(1)
    }
    
    
    startTime <- as.numeric(substring(time, 1, 2))*60*60+
      as.numeric(substring(time, 4, 5))*60+
      as.numeric(substring(time, 7, 8))
    
    timeString = c((if((startTime-7200)<0){startTime-7200+86400} else {startTime-7200}),
                   (if((startTime-3600)<0){startTime-3600+86400} else {startTime-3600}),
                   (if((startTime-1800)<0){startTime-1800+86400} else {startTime-1800}),
                   (startTime),
                   (if((startTime+1800)>86100){startTime+1800-86400} else {startTime+1800}),
                   (if((startTime+3600)>86100){startTime+1800-86400} else {startTime+3600}),
                   (if((startTime+7200)>86100){startTime+1800-86400} else {startTime+7200})
    )
    
    for (j in seq(1, length(timeString), 1)) {
      
      #print(timeString)
      
      
      baseTable <<- aggregate(dataMaster$Avg.Speed ~ Station + Time_n, data = dataMaster, 
                              FUN= calc[xx])
      baseTable <<- left_join(baseTable, stationPM[,c('Abs PM', 'ID')], by = c("Station" = "ID"))
      
      baseTable <<- baseTable[which(baseTable$`Abs PM`>=startStation & baseTable$`Abs PM`<=endStation),] 
      colnames(baseTable)[colnames(baseTable)=="dataMaster$Avg.Speed"] <<- "Avg.Speed"
      
      calcTable <<- NA
      calcTable <<- data.frame(sort(unique(baseTable$`Abs PM`)))
      colnames(calcTable)[colnames(calcTable)=="sort.unique.baseTable..Abs.PM..."] <<- "Abs PM"
      
      
      ###Calculating Distance
      #loop each element of the calcTable:
      dist <- NA
      dist <- numeric(1)
      dist[1] <- NA
      speed <- NA
      speed <- numeric(1)
      speed[1] <- NA
      travelT <- NA
      travelT <- numeric(1)
      travelT[1] <- 0
      currentT <-NA
      currentT <- numeric(1)
      currentT[1] <- timeString[j]
      print(currentT[1])
      
      for (i in seq(2, length(calcTable$`Abs PM`), 1)){
        
        dist[i] <- calcTable$`Abs PM`[i]-calcTable$`Abs PM`[i-1] 
      }
      calcTable$dist <<- dist
      
      for (i in seq(2, length(calcTable$`Abs PM`), 1)){
        baseTable2 <<-NA
        baseTable2 <<- baseTable[which(baseTable$`Abs PM`==calcTable$`Abs PM`[i-1]),]
        baseTable2$timeDiff <<- abs(baseTable2$Time_n - currentT[i-1])
        speed[i] = mean(baseTable2$Avg.Speed[which(baseTable2$timeDiff==min(baseTable2$timeDiff))])
        travelT[i] = dist[i]/speed[i]*60*60
        currentT[i] = currentT[i-1]+travelT[i]
      }
      
      calcTable$speed <<- speed
      calcTable$travelT <<- travelT
      calcTable$currentT <<- currentT
      
      print(c('Total Travel Time(m):',sum(calcTable$travelT)/60))
      
      
      if(xx==1){
        totalTravelTimeMax [j] =  sum(calcTable$travelT)/60
      }
      else if (xx==2){
        
        totalTravelTimeMin [j] =  sum(calcTable$travelT)/60
      }
      else if (xx==3){
        totalTravelTimeMed [j] =  sum(calcTable$travelT)/60
      }
      
    }  
    
  }
  
  plotFrame <<- data.frame(factor(c('-2hr', '-1hr', '-30min', 'leaveNOW', '+30min', '+1hr', '+2hr'), levels = c('-2hr', '-1hr', '-30min', 'leaveNOW', '+30min', '+1hr', '+2hr')))
  colnames(plotFrame)[colnames(plotFrame)=="factor.c...2hr.....1hr.....30min....leaveNOW.....30min.....1hr..."] <<- "timeLabel"
  plotFrame$Max <<- totalTravelTimeMax
  plotFrame$Min <<- totalTravelTimeMin
  plotFrame$Med <<- totalTravelTimeMed
  # plotFrame$Axis <<- c(min(plotFrame$Max), 
  #                      min(plotFrame$Max), 
  #                      min(plotFrame$Max), 
  #                      max(plotFrame$Min),
  #                      max(plotFrame$Min),
  #                      max(plotFrame$Min),
  #                      max(plotFrame$Min))
  # 
  
  # 
  # plot(plotFrame$timeLabel, plotFrame$Axis, type='n')
  # lines(plotFrame$timeLabel, plotFrame$Max, type='l', col='green')
  # lines(plotFrame$timeLabel, plotFrame$Min, type='l', col='red')
  # lines(plotFrame$timeLabel, plotFrame$Med, type='l', col='blue')
  
  
  plotFrame_M = melt(plotFrame, id_vars = 'timeLabel', variable.name='calc', value.name='travelTime')
  ggplot(plotFrame_M, aes( x=timeLabel, y=travelTime, group=calc, col=calc)) + geom_line()
  # ggtitle(time) # for the main title
}
travelTimev3(startStation = '768297', endStation = '770012', time='10:00:04')
travelTimev3(startStation = '768297', endStation = '772905', time='09:08:40')
