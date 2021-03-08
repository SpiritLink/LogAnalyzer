# install.packages("ggplot2")
library(ggplot2)

line = readLines("E:/Projects/R/LogAnalyzer/sample.log")


times = as.list(NA)
mins = as.list(NA)
maxs = as.list(NA)

for(item in line)
{
  if(grepl('ProcessMonitor', item) == TRUE)
  {
    spritresult = strsplit(item, "\\s+")
    separate = unlist(spritresult)
  
    times[length(times) + 1] <- separate[2]
    mins[length(mins) + 1] <- as.numeric(gsub("%", "", separate[19]))
    maxs[length(maxs) + 1] <- as.numeric(gsub("%", "", separate[28]))
  }
}

times[1] <- NULL
mins[1] <- NULL
maxs[1] <- NULL
myTimes <- data.frame(times)
myMins <- data.frame(mins)
myMaxs <- data.frame(maxs)

df <- data.frame(myMins, myMaxs)

str(df)
# ggplot(df, aes(x = times, y = mins))