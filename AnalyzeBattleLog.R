line = readLines("sample.log")

for(item in line)
{
  if(grepl('ProcessMonitor', item) == TRUE)
  {
    print(item)
  }
}