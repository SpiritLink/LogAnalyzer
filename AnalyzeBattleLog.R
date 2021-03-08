line = readLines("sample3.log")


times = as.list(NA)
mins = as.list(NA)
maxs = as.list(NA)

for(item in line)
{
  if(grepl('ProcessMonitor', item) == TRUE)
  {
    
    # print(item)
    spritresult = strsplit(item, "\\s+")
    separate = unlist(spritresult)
  
    times[length(times) + 1] <- separate[2]
    mins[length(mins) + 1] <- separate[19]
    maxs[length(maxs) + 1] <- separate[28]
  }
}

for(item2 in times)
{
  print(item2)
}

