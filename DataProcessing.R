# Unzip all the files
library(R.utils)
setwd("C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/RawData/")
txt_files_zipped = list.files(pattern="*.gz") 
lapply(txt_files_zipped, gunzip)

# Combine all the files into one data frame

setwd("C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/RawData/Unzipped")
# Create list of text files
txt_files_ls = list.files(pattern="*.txt") 
# Read the files in, assuming comma separator
txt_files_df <- lapply(txt_files_ls, function(x) {read.table(file = x, header = F, sep =",")[which(read.table(file = x, header = F, sep =",")[,4]=='210' & 
                                                                                                     read.table(file = x, header = F, sep =",")[,5]=='E'), ]
  })
gc()
# Combine them
combined_df <- do.call("rbind", lapply(txt_files_df, as.data.frame)) 

combined_df <- combined_df[,1:42]
colnames(combined_df) <- c("Time Stamp", "Station", "District", "Freeway", "Direction", "Lane Type", "Station Length", "Samples", "% Observed", "Total Flow", "Avg Occupancy", "Avg Speed", "Lane 1 Samples", "Lane 1 flow", "Lane 1 avg Occupancy", "Lane 1 Avg Speed", "Lane 1 Observed", "Lane 2 Samples", "Lane 2 flow", "Lane 2 avg Occupancy", "Lane 2 Avg Speed", "Lane 2 Observed", "Lane 3 Samples", "Lane 3 flow", "Lane 3 avg Occupancy", "Lane 3 Avg Speed", "Lane 3 Observed", "Lane 4 Samples", "Lane 4 flow", "Lane 4 avg Occupancy", "Lane 4 Avg Speed", "Lane 4 Observed", "Lane 5 Samples", "Lane 5 flow", "Lane 5 avg Occupancy", "Lane 5 Avg Speed", "Lane 5 Observed", "Lane 6 Samples", "Lane 6 flow", "Lane 6 avg Occupancy", "Lane 6 Avg Speed", "Lane 6 Observed")
write.csv(combined_df, file = "C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/RawData/i210_E_2018.csv",row.names=FALSE, na="", sep=",")


# parse data for the subset of 5miles 
data <- read.table('C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/RawData/i210_E_2018.csv', sep=',', header=TRUE)
data_parse <- subset(data, subset = Station %in% c(761098, 717635, 761102, 717638, 717640, 761105, 717650, 761112, 737490, 717654, 717659, 717641, 717667, 761115))
write.csv(data_parse, file = "C:/Users/samuel.lin/Box Sync/MyDocuments/TrafficMaster/RawData/i210_E_2018_parse.csv",row.names=FALSE, na="", sep=",")
