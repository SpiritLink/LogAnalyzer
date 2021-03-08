# install.packages("ggplot2")
library(ggplot2)

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
  
    times[length(times) + 1] <- separate[2]
    mins[length(mins) + 1] <- as.numeric(gsub("%", "", separate[19]))
    maxs[length(maxs) + 1] <- as.numeric(gsub("%", "", separate[28]))
  }
}

df <- data.frame(times, mins, maxs)

str(df)
# ggplot(df, aes(x = times, y = mins))