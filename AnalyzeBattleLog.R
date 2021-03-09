# install.packages("ggplot2")
# install.packages("tidyverse")
# install.packages("lubridate")

library(ggplot2)
library(tidyverse)
library(lubridate)

line = readLines("E:/Projects/R/LogAnalyzer/sample.log")


times <- vector()
mins <- vector()
maxs <- vector()

for(item in line)
{
  if(grepl('ProcessMonitor', item) == TRUE)
  {
    spritresult = strsplit(item, "\\s+")
    separate = unlist(spritresult)
  
    timeStr = paste(separate[1], ' ', separate[2]);
    timeStr = substr(timeStr, 1, 21)
    timeValue = ymd_hms(timeStr) #strptime(timeStr, "%Y-%m-%d %H:%M:%S", tz = "EST5EDT");
    times[length(times) + 1] <- timeValue
    mins[length(mins) + 1] <- as.numeric(gsub("%", "", separate[19]))
    maxs[length(maxs) + 1] <- as.numeric(gsub("%", "", separate[28]))
  }
}


df <- data.frame(times, mins, maxs)

str(df)
# ggplot(df, aes(x = times, y = mins))