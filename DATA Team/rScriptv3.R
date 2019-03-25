library(data.table)
library(dplyr)
library(tidyr)
library(reshape2)
library(ggplot2)
data <- read.table('C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/RawData/i210_E_2018_parse.csv', sep=',', header=TRUE)
stationAM <- fread('C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/ActualMiles.csv', select=c(1,2, 4))
dayAttributes <- read.table('C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/DayAttributes.csv', sep=',', header=TRUE, stringsAsFactors = FALSE)
dataMaster <- left_join(data, stationAM, by = c("Station" = "Station"))


dataMaster <-  separate(dataMaster, col="Time.Stamp", into = c("Date", "Time"), sep=" ", remove = FALSE)

dataMaster <- dataMaster[which(dataMaster$Type=='ML'), ]
dataMaster <- left_join(dataMaster, dayAttributes, by = c("Date" = "Date"))
dataMaster$Time_n <- as.numeric(substring(dataMaster$Time, 1, 2))*60*60+
  as.numeric(substring(dataMaster$Time, 4, 5))*60+
  as.numeric(substring(dataMaster$Time, 7, 8))


travelTimev1 <- function(startStation,endStation,time,calc) {
  print(c('startStation: ',startStation, 'endStation: ', endStation))
  
  startStation <- max(stationAM$'Amile'[which(stationAM$Station==startStation)])
  endStation <- max(stationAM$'Amile'[which(stationAM$Station==endStation)])
  print(c('startstationAM: ', startStation,'endstationAM: ', endStation))
  
  print(c('startDrivingTime (24h): ', time))
  currentTime <- as.numeric(substring(time, 1, 2))*60*60+
    as.numeric(substring(time, 4, 5))*60+
    as.numeric(substring(time, 7, 8))
  
  
  baseTable <<- aggregate(dataMaster$Avg.Speed ~ Station + Time_n, data = dataMaster, 
                          FUN= calc)
  baseTable <<- left_join(baseTable, stationAM[,c('Amile', 'Station')], by = c("Station" = "Station"))
  
  baseTable <<- baseTable[which(baseTable$Amile>=startStation & baseTable$Amile<=endStation),] 
  colnames(baseTable)[colnames(baseTable)=="dataMaster$Avg.Speed"] <<- "Avg.Speed"
  
  
  calcTable <<- data.frame(sort(unique(baseTable$Amile)))
  colnames(calcTable)[colnames(calcTable)=="sort.unique.baseTable.Amile.."] <<- "Amile"
  
  
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
  
  for (i in seq(2, length(calcTable$Amile), 1)){
    
    dist[i] <- calcTable$Amile[i]-calcTable$Amile[i-1] 
  }
  calcTable$dist <<- dist
  
  for (i in seq(2, length(calcTable$Amile), 1)){
    
    baseTable2 <<-NA
    baseTable2 <<- baseTable[which(baseTable$Amile==calcTable$Amile[i-1]),]
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
  startStation <- max(stationAM$'Amile'[which(stationAM$Station==startStation)])
  endStation <- max(stationAM$'Amile'[which(stationAM$Station==endStation)])
  print(c('startstationAM: ', startStation,'endstationAM: ', endStation))
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
    baseTable <<- left_join(baseTable, stationAM[,c('Amile', 'Station')], by = c("Station" = "Station"))
  
    baseTable <<- baseTable[which(baseTable$Amile>=startStation & baseTable$Amile<=endStation),] 
    colnames(baseTable)[colnames(baseTable)=="dataMaster$Avg.Speed"] <<- "Avg.Speed"
    
    calcTable <<- NA
    calcTable <<- data.frame(sort(unique(baseTable$Amile)))
    colnames(calcTable)[colnames(calcTable)=="sort.unique.baseTable.Amile.."] <<- "Amile"
    
    
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
    
    for (i in seq(2, length(calcTable$Amile), 1)){
      
      dist[i] <- calcTable$Amile[i]-calcTable$Amile[i-1] 
    }
    calcTable$dist <<- dist
    
    for (i in seq(2, length(calcTable$Amile), 1)){
      baseTable2 <<-NA
      baseTable2 <<- baseTable[which(baseTable$Amile==calcTable$Amile[i-1]),]
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

##** Plotting TravelTime based on the LEAVENOW TIME and +- 2hours
travelTimev3 <- function(startStation,endStation,time) {
  
  
  print(c('startStation: ',startStation, 'endStation: ', endStation))
  startStation <- max(stationAM$'Amile'[which(stationAM$Station==startStation)])
  endStation <- max(stationAM$'Amile'[which(stationAM$Station==endStation)])
  print(c('startstationAM: ', startStation,'endstationAM: ', endStation))
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
      baseTable <<- left_join(baseTable, stationAM[,c('Amile', 'Station')], by = c("Station" = "Station"))
      
      baseTable <<- baseTable[which(baseTable$Amile>=startStation & baseTable$Amile<=endStation),] 
      colnames(baseTable)[colnames(baseTable)=="dataMaster$Avg.Speed"] <<- "Avg.Speed"
      
      calcTable <<- NA
      calcTable <<- data.frame(sort(unique(baseTable$Amile)))
      colnames(calcTable)[colnames(calcTable)=="sort.unique.baseTable.Amile.."] <<- "Amile"
      
      
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
      
      for (i in seq(2, length(calcTable$Amile), 1)){
        
        dist[i] <- calcTable$Amile[i]-calcTable$Amile[i-1] 
      }
      calcTable$dist <<- dist
      
      for (i in seq(2, length(calcTable$Amile), 1)){
        baseTable2 <<-NA
        baseTable2 <<- baseTable[which(baseTable$Amile==calcTable$Amile[i-1]),]
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

  
  plotFrame_M = melt(plotFrame, id_vars = 'timeLabel', variable.name='calc', value.name='travelTime')
  ggplot(plotFrame_M, aes( x=timeLabel, y=travelTime, group=calc, col=calc)) + geom_line( size = 1.75) + scale_color_manual(values = c(Max="green",Min="red",Med="blue"))
    
  
  # ggtitle(time) # for the main title
}
travelTimev3(startStation = '768297', endStation = '770012', time='10:00:04')
travelTimev3(startStation = '768297', endStation = '772905', time='09:08:40')
travelTimev3(startStation = '717635', endStation = '717667', time='09:08:40')

##** Plotting TravelTime by 24H by slow, fast & median speed
travelTimev4 <-function(startStation,endStation) {
  
  
  print(c('startStation: ',startStation, 'endStation: ', endStation))
  startStation <- max(stationAM$'Amile'[which(stationAM$Station==startStation)])
  endStation <- max(stationAM$'Amile'[which(stationAM$Station==endStation)])
  print(c('startstationAM: ', startStation,'endstationAM: ', endStation))
  
  calc = c('quantile','quantile','median')
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
    
    
    timeString = seq(0, 84600, 1800)
    
    for (j in seq(1, length(timeString), 1)) {
      
      #print(timeString)
      
      if(xx==2){
        baseTable <<- NA
        baseTable <<- aggregate(dataMaster$Avg.Speed ~ Station + Time_n, data = dataMaster, 
                                FUN= calc[xx], probs=.10)
        
      }
      else if (xx==1) {
        baseTable <<- NA
        baseTable <<- aggregate(dataMaster$Avg.Speed ~ Station + Time_n, data = dataMaster, 
                                FUN= calc[xx], probs=.90)  
      }
      else if (xx==3) {
        baseTable <<- NA
        baseTable <<- aggregate(dataMaster$Avg.Speed ~ Station + Time_n, data = dataMaster, 
                                FUN= calc[xx])  
      }
      
      
      baseTable <<- left_join(baseTable, stationAM[,c('Amile', 'Station')], by = c("Station" = "Station"))
      
      baseTable <<- baseTable[which(baseTable$Amile>=startStation & baseTable$Amile<=endStation),] 
      colnames(baseTable)[colnames(baseTable)=="dataMaster$Avg.Speed"] <<- "Avg.Speed"
      
      calcTable <<- NA
      calcTable <<- data.frame(sort(unique(baseTable$Amile)))
      colnames(calcTable)[colnames(calcTable)=="sort.unique.baseTable.Amile.."] <<- "Amile"
      
      
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
      
      for (i in seq(2, length(calcTable$Amile), 1)){
        
        dist[i] <- calcTable$Amile[i]-calcTable$Amile[i-1] 
      }
      calcTable$dist <<- dist
      
      for (i in seq(2, length(calcTable$Amile), 1)){
        baseTable2 <<-NA
        baseTable2 <<- baseTable[which(baseTable$Amile==calcTable$Amile[i-1]),]
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
        totalTravelTimeMax [j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==2){
        
        totalTravelTimeMin [j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==3){
        totalTravelTimeMed [j] <-  sum(calcTable$travelT)/60
      }
      
    }  
    
  }
  
  plotFrame <<- data.frame(factor(c(
    '0:00', '0:30', '1:00', '1:30', '2:00', '2:30', 
    '3:00', '3:30', '4:00', '4:30', '5:00', '5:30', 
    '6:00', '6:30', '7:00', '7:30', '8:00', '8:30', 
    '9:00', '9:30', '10:00', '10:30', '11:00', '11:30',
    '12:00', '12:30', '13:00', '13:30', '14:00', '14:30',
    '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', 
    '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', 
    '21:00', '21:30', '22:00', '22:30', '23:00', '23:30'
  ), levels = c(    '0:00', '0:30', '1:00', '1:30', '2:00', '2:30', 
                    '3:00', '3:30', '4:00', '4:30', '5:00', '5:30', 
                    '6:00', '6:30', '7:00', '7:30', '8:00', '8:30', 
                    '9:00', '9:30', '10:00', '10:30', '11:00', '11:30',
                    '12:00', '12:30', '13:00', '13:30', '14:00', '14:30',
                    '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', 
                    '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', 
                    '21:00', '21:30', '22:00', '22:30', '23:00', '23:30')))
  #colnames(plotFrame)[colnames(plotFrame)=="factor.c...2hr.....1hr.....30min....leaveNOW.....30min.....1hr..."] 
  colnames(plotFrame)[1]<<- "timeLabel"
  plotFrame$Fast <<- totalTravelTimeMax
  plotFrame$Slow <<- totalTravelTimeMin
  plotFrame$MedSpeed <<- totalTravelTimeMed
  
  plotFrame_M <<- melt(plotFrame, id_vars = 'timeLabel', variable.name='speedCat', value.name='travelTime')
  ggplot(plotFrame_M, aes( x=factor(timeLabel), y=travelTime, group=speedCat, col=speedCat)) + geom_line( size = 1.33) + scale_color_manual(values = c(Fast="green",Slow="red",MedSpeed="blue")) + labs(title = "Travel Time from 717635 to 717667 by Hour by Speed") + ylab("TravelTime (mins)") + xlab("Time 24H") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +  
    scale_x_discrete('Time 24H', c('0:00', '', '', '', '2:00', '', 
                                   '', '', '4:00', '', '', '', 
                                   '6:00', '', '', '', '8:00', '', 
                                   '', '', '10:00', '', '', '',
                                   '12:00', '', '', '', '14:00', '',
                                   '', '', '16:00', '', '', '', 
                                   '18:00', '', '', '', '20:00', '', 
                                   '', '', '22:00', '', '', ''))
  
  
}
travelTimev4(startStation = '717635', endStation = '717667')

##** Plotging TravelTime by 24H by Weekday, Weekend & Holiday 
travelTimev5 <-function(startStation,endStation) {
  
  
  print(c('startStation: ',startStation, 'endStation: ', endStation))
  startStation <- max(stationAM$'Amile'[which(stationAM$Station==startStation)])
  endStation <- max(stationAM$'Amile'[which(stationAM$Station==endStation)])
  print(c('startstationAM: ', startStation,'endstationAM: ', endStation))
  
  calc = c('weekday','weekend','holiday')
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
    
    
    timeString = seq(0, 84600, 1800)
    
    for (j in seq(1, length(timeString), 1)) {
      
      #print(timeString)
      
      if(xx==2){
        baseTable <<- NA
        baseTable <<- dataMaster[which(dataMaster$WWH=='Weekend'), ]
        baseTable <<- aggregate(baseTable$Avg.Speed ~ Station + Time_n, data = baseTable, 
                                FUN= 'median')
        
      }
      else if (xx==1) {
        baseTable <<- NA
        baseTable <<- dataMaster[which(dataMaster$WWH=='Weekday'), ]
        baseTable <<- aggregate(baseTable$Avg.Speed ~ Station + Time_n, data = baseTable, 
                                FUN= 'median')  
      }
      else if (xx==3) {
        baseTable <<- NA
        baseTable <- dataMaster[which(dataMaster$WWH=='Holiday'), ]
        baseTable <<- aggregate(baseTable$Avg.Speed ~ Station + Time_n, data = baseTable, 
                                FUN= 'median')  
      }
      
      
      baseTable <<- left_join(baseTable, stationAM[,c('Amile', 'Station')], by = c("Station" = "Station"))
      
      baseTable <<- baseTable[which(baseTable$Amile>=startStation & baseTable$Amile<=endStation),] 
      colnames(baseTable)[colnames(baseTable)=="baseTable$Avg.Speed"] <<- "Avg.Speed"
      
      calcTable <<- NA
      calcTable <<- data.frame(sort(unique(baseTable$Amile)))
      colnames(calcTable)[colnames(calcTable)=="sort.unique.baseTable.Amile.."] <<- "Amile"
      
      
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
      
      for (i in seq(2, length(calcTable$Amile), 1)){
        
        dist[i] <- calcTable$Amile[i]-calcTable$Amile[i-1] 
      }
      calcTable$dist <<- dist
      
      for (i in seq(2, length(calcTable$Amile), 1)){
        baseTable2 <<-NA
        baseTable2 <<- baseTable[which(baseTable$Amile==calcTable$Amile[i-1]),]
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
        totalTravelTimeMax [j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==2){
        
        totalTravelTimeMin [j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==3){
        totalTravelTimeMed [j] <-  sum(calcTable$travelT)/60
      }
      
    }  
    
  }
  
  plotFrame <<- data.frame(factor(c(
    '0:00', '0:30', '1:00', '1:30', '2:00', '2:30', 
    '3:00', '3:30', '4:00', '4:30', '5:00', '5:30', 
    '6:00', '6:30', '7:00', '7:30', '8:00', '8:30', 
    '9:00', '9:30', '10:00', '10:30', '11:00', '11:30',
    '12:00', '12:30', '13:00', '13:30', '14:00', '14:30',
    '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', 
    '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', 
    '21:00', '21:30', '22:00', '22:30', '23:00', '23:30'
  ), levels = c(    '0:00', '0:30', '1:00', '1:30', '2:00', '2:30', 
                    '3:00', '3:30', '4:00', '4:30', '5:00', '5:30', 
                    '6:00', '6:30', '7:00', '7:30', '8:00', '8:30', 
                    '9:00', '9:30', '10:00', '10:30', '11:00', '11:30',
                    '12:00', '12:30', '13:00', '13:30', '14:00', '14:30',
                    '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', 
                    '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', 
                    '21:00', '21:30', '22:00', '22:30', '23:00', '23:30')))
  #colnames(plotFrame)[colnames(plotFrame)=="factor.c...2hr.....1hr.....30min....leaveNOW.....30min.....1hr..."] 
  colnames(plotFrame)[1]<<- "timeLabel"
  plotFrame$weekday <<- totalTravelTimeMax
  plotFrame$weekend <<- totalTravelTimeMin
  plotFrame$holiday <<- totalTravelTimeMed
  
  plotFrame_M <<- melt(plotFrame, id_vars = 'timeLabel', variable.name='DayCat', value.name='travelTime')
  ggplot(plotFrame_M, aes( x=factor(timeLabel), y=travelTime, group=DayCat, col=DayCat)) + geom_line( size = 1.33) + scale_color_manual(values = c(weekday="red",weekend="green",holiday="blue")) + labs(title = "Travel Time from 717635 to 717667 by Hour by Day") + ylab("TravelTime (mins)") + xlab("Time 24H") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +  
    scale_x_discrete('Time 24H', c('0:00', '', '', '', '2:00', '', 
                                   '', '', '4:00', '', '', '', 
                                   '6:00', '', '', '', '8:00', '', 
                                   '', '', '10:00', '', '', '',
                                   '12:00', '', '', '', '14:00', '',
                                   '', '', '16:00', '', '', '', 
                                   '18:00', '', '', '', '20:00', '', 
                                   '', '', '22:00', '', '', ''))
  
  
}
travelTimev5(startStation = '717635', endStation = '717667')

##** Plotting TravelTime by 24H by Month
travelTimev6 <-function(startStation,endStation) {
  
  
  print(c('startStation: ',startStation, 'endStation: ', endStation))
  startStation <- max(stationAM$'Amile'[which(stationAM$Station==startStation)])
  endStation <- max(stationAM$'Amile'[which(stationAM$Station==endStation)])
  print(c('startstationAM: ', startStation,'endstationAM: ', endStation))
  
  calc = c('Jan','Feb','Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')
  for (xx in seq(1, length(calc), 1)){
    
    
    assign(paste("totalTravelTime", xx, sep=""), numeric(1)) 
    
    
    
    timeString = seq(0, 84600, 1800)
    
    for (j in seq(1, length(timeString), 1)) {
      
      #print(timeString)
      
      baseTable <<- NA
      baseTable <<- dataMaster[which(dataMaster$WWH=='Weekday'&dataMaster$Month==calc[xx]), ]
      baseTable <<- aggregate(baseTable$Avg.Speed ~ Station + Time_n, data = baseTable, 
                              FUN= 'median')
      
      
      baseTable <<- left_join(baseTable, stationAM[,c('Amile', 'Station')], by = c("Station" = "Station"))
      
      baseTable <<- baseTable[which(baseTable$Amile>=startStation & baseTable$Amile<=endStation),] 
      colnames(baseTable)[colnames(baseTable)=="baseTable$Avg.Speed"] <<- "Avg.Speed"
      
      calcTable <<- NA
      calcTable <<- data.frame(sort(unique(baseTable$Amile)))
      colnames(calcTable)[colnames(calcTable)=="sort.unique.baseTable.Amile.."] <<- "Amile"
      
      
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
      
      for (i in seq(2, length(calcTable$Amile), 1)){
        
        dist[i] <- calcTable$Amile[i]-calcTable$Amile[i-1] 
      }
      calcTable$dist <<- dist
      
      for (i in seq(2, length(calcTable$Amile), 1)){
        baseTable2 <<-NA
        baseTable2 <<- baseTable[which(baseTable$Amile==calcTable$Amile[i-1]),]
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
        totalTravelTime1[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==2){
        
        totalTravelTime2[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==3){
        
        totalTravelTime3[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==4){
        
        totalTravelTime4[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==5){
        
        totalTravelTime5[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==6){
        
        totalTravelTime6[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==7){
        
        totalTravelTime7[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==8){
        
        totalTravelTime8[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==9){
        
        totalTravelTime9[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==10){
        
        totalTravelTime10[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==11){
        
        totalTravelTime11[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==12){
        
        totalTravelTime12[j] <-  sum(calcTable$travelT)/60
      }
      
    }  
    
  }
  
  plotFrame <<- data.frame(factor(c(
    '0:00', '0:30', '1:00', '1:30', '2:00', '2:30', 
    '3:00', '3:30', '4:00', '4:30', '5:00', '5:30', 
    '6:00', '6:30', '7:00', '7:30', '8:00', '8:30', 
    '9:00', '9:30', '10:00', '10:30', '11:00', '11:30',
    '12:00', '12:30', '13:00', '13:30', '14:00', '14:30',
    '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', 
    '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', 
    '21:00', '21:30', '22:00', '22:30', '23:00', '23:30'
  ), levels = c(    '0:00', '0:30', '1:00', '1:30', '2:00', '2:30', 
                    '3:00', '3:30', '4:00', '4:30', '5:00', '5:30', 
                    '6:00', '6:30', '7:00', '7:30', '8:00', '8:30', 
                    '9:00', '9:30', '10:00', '10:30', '11:00', '11:30',
                    '12:00', '12:30', '13:00', '13:30', '14:00', '14:30',
                    '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', 
                    '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', 
                    '21:00', '21:30', '22:00', '22:30', '23:00', '23:30')))
  #colnames(plotFrame)[colnames(plotFrame)=="factor.c...2hr.....1hr.....30min....leaveNOW.....30min.....1hr..."] 
  colnames(plotFrame)[1]<<- "timeLabel"
  plotFrame$jan <<- totalTravelTime1
  plotFrame$feb <<- totalTravelTime2
  plotFrame$mar <<- totalTravelTime3
  plotFrame$apr <<- totalTravelTime4
  plotFrame$may <<- totalTravelTime5
  plotFrame$jun <<- totalTravelTime6
  plotFrame$jul <<- totalTravelTime7
  plotFrame$aug <<- totalTravelTime8
  plotFrame$sep <<- totalTravelTime9
  plotFrame$oct <<- totalTravelTime10  
  plotFrame$nov <<- totalTravelTime11
  plotFrame$dec <<- totalTravelTime12
  
  
  plotFrame_M <<- melt(plotFrame, id_vars = 'timeLabel', variable.name='Month', value.name='travelTime')
  ggplot(plotFrame_M, aes( x=factor(timeLabel), y=travelTime, group=Month, col=Month)) + geom_line( size = 1.33) + 
    scale_color_manual(values = c(jan="chartreuse",feb="darkorange",mar="brown3", apr="chocolate1", may="yellow", jun="deeppink", jul="chocolate", aug="darkgreen", sep="chartreuse3", oct="chartreuse1", nov="yellow", dec="brown1")) + 
    labs(title = "Travel Time from 717635 to 717667 by Hour by Month") + ylab("TravelTime (mins)") + xlab("Time 24H") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +  
    scale_x_discrete('Time 24H', c('0:00', '', '', '', '2:00', '', 
                                   '', '', '4:00', '', '', '', 
                                   '6:00', '', '', '', '8:00', '', 
                                   '', '', '10:00', '', '', '',
                                   '12:00', '', '', '', '14:00', '',
                                   '', '', '16:00', '', '', '', 
                                   '18:00', '', '', '', '20:00', '', 
                                   '', '', '22:00', '', '', ''))
  
  
}
travelTimev6(startStation = '717635', endStation = '717667')

##** Plotting TravelTime by 24H by Weekday
travelTimev7 <-function(startStation,endStation) {
  
  
  print(c('startStation: ',startStation, 'endStation: ', endStation))
  startStation <- max(stationAM$'Amile'[which(stationAM$Station==startStation)])
  endStation <- max(stationAM$'Amile'[which(stationAM$Station==endStation)])
  print(c('startstationAM: ', startStation,'endstationAM: ', endStation))
  
  calc = c('Sunday', 'Monday','Tuesday','Wednesday', 'Thursday', 'Friday', 'Saturday')
  for (xx in seq(1, length(calc), 1)){
    
    
    assign(paste("totalTravelTime", xx, sep=""), numeric(1)) 
    
    
    
    timeString = seq(0, 84600, 1800)
    
    for (j in seq(1, length(timeString), 1)) {
      
      #print(timeString)
      
      baseTable <<- NA
      baseTable <<- dataMaster[which(dataMaster$Day==calc[xx]), ]
      baseTable <<- aggregate(baseTable$Avg.Speed ~ Station + Time_n, data = baseTable, 
                              FUN= 'median')
      
      
      baseTable <<- left_join(baseTable, stationAM[,c('Amile', 'Station')], by = c("Station" = "Station"))
      
      baseTable <<- baseTable[which(baseTable$Amile>=startStation & baseTable$Amile<=endStation),] 
      colnames(baseTable)[colnames(baseTable)=="baseTable$Avg.Speed"] <<- "Avg.Speed"
      
      calcTable <<- NA
      calcTable <<- data.frame(sort(unique(baseTable$Amile)))
      colnames(calcTable)[colnames(calcTable)=="sort.unique.baseTable.Amile.."] <<- "Amile"
      
      
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
      
      for (i in seq(2, length(calcTable$Amile), 1)){
        
        dist[i] <- calcTable$Amile[i]-calcTable$Amile[i-1] 
      }
      calcTable$dist <<- dist
      
      for (i in seq(2, length(calcTable$Amile), 1)){
        baseTable2 <<-NA
        baseTable2 <<- baseTable[which(baseTable$Amile==calcTable$Amile[i-1]),]
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
        totalTravelTime1[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==2){
        
        totalTravelTime2[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==3){
        
        totalTravelTime3[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==4){
        
        totalTravelTime4[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==5){
        
        totalTravelTime5[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==6){
        
        totalTravelTime6[j] <-  sum(calcTable$travelT)/60
      }
      else if (xx==7){
        
        totalTravelTime7[j] <-  sum(calcTable$travelT)/60
      }
      
      
    }  
    
  }
  
  plotFrame <<- data.frame(factor(c(
    '0:00', '0:30', '1:00', '1:30', '2:00', '2:30', 
    '3:00', '3:30', '4:00', '4:30', '5:00', '5:30', 
    '6:00', '6:30', '7:00', '7:30', '8:00', '8:30', 
    '9:00', '9:30', '10:00', '10:30', '11:00', '11:30',
    '12:00', '12:30', '13:00', '13:30', '14:00', '14:30',
    '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', 
    '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', 
    '21:00', '21:30', '22:00', '22:30', '23:00', '23:30'
  ), levels = c(    '0:00', '0:30', '1:00', '1:30', '2:00', '2:30', 
                    '3:00', '3:30', '4:00', '4:30', '5:00', '5:30', 
                    '6:00', '6:30', '7:00', '7:30', '8:00', '8:30', 
                    '9:00', '9:30', '10:00', '10:30', '11:00', '11:30',
                    '12:00', '12:30', '13:00', '13:30', '14:00', '14:30',
                    '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', 
                    '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', 
                    '21:00', '21:30', '22:00', '22:30', '23:00', '23:30')))
  colnames(plotFrame)[1]<<- "timeLabel"
  plotFrame$sun <<- totalTravelTime1
  plotFrame$mon <<- totalTravelTime2
  plotFrame$tue <<- totalTravelTime3
  plotFrame$wed <<- totalTravelTime4
  plotFrame$thu <<- totalTravelTime5
  plotFrame$fri <<- totalTravelTime6
  plotFrame$sat <<- totalTravelTime7
  
  
  plotFrame_M <<- melt(plotFrame, id_vars = 'timeLabel', variable.name='Weekday', value.name='travelTime')
  ggplot(plotFrame_M, aes( x=factor(timeLabel), y=travelTime, group=Weekday, col=Weekday)) + geom_line( size = 1.33) + 
    scale_color_manual(values = c(sun="green",mon="yellow",tue="chocolate", wed="darkgoldenrod2", thu="brown1", fri="deeppink2", sat="darkorange")) + 
    labs(title = "Travel Time from 717635 to 717667 by Hour by Weekday") + ylab("TravelTime (mins)") + xlab("Time 24H") + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +  
    scale_x_discrete('Time 24H', c('0:00', '', '', '', '2:00', '', 
                                   '', '', '4:00', '', '', '', 
                                   '6:00', '', '', '', '8:00', '', 
                                   '', '', '10:00', '', '', '',
                                   '12:00', '', '', '', '14:00', '',
                                   '', '', '16:00', '', '', '', 
                                   '18:00', '', '', '', '20:00', '', 
                                   '', '', '22:00', '', '', ''))
  
  
}
travelTimev7(startStation = '717635', endStation = '717667')

