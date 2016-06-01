#Input, data reading

#Set flags
require(lubridate)
time1 <- seq.POSIXt(ISOdate(2016,1,1,0),ISOdate(2016,12,31,23),"hour")
time_m <- as.numeric(format(time1,"%m"))
time_d <- as.numeric(wday(time1) - 1)
time_h <- as.numeric(hour(time1))

#read holidays
if(file.exists("holidays_2016.csv")==FALSE) 
  stop("Error: no holidays input") else (
  time_holi <- read.csv(
    "holidays_2016.csv", header=F, sep = ";", col.names = c("short_date_id", "coefficient")
  )
)

time_holi$short_date_id <- as.Date(time_holi$short_date_id)

#read consumption
if(file.exists("consumption1.csv") == FALSE) 
  stop("Error: no consumption input") else (
    consp1 <- read.csv(
      "consumption1.csv", header = F, sep = ";", col.names = c("date_id", "consumption")
    )
  )

#Output generation
timeNames <- c("date_full","month_id","day_id","hour_id", "1st zone")
df <- data.frame(time1,time_m,time_d,time_h, B23_1)
write.table(df,file = "df1.csv", sep=";", dec = "," , row.names = F, col.names = timeNames)


