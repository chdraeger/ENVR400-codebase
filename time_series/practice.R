# =================================================================================
# PRACTICE: Analyze and plot time series data
# -----> task: fill gaps marked with ?????
# =================================================================================
# content:
# read hourly weather data csv
# aggregate to daily data
# find correlation coefficients between different time series
# plot different time series

library(dplyr)

# set working directory
# setwd("path")

# read data
# =================================================================================
# data downloaded from https://vancouver.weatherstats.ca/download.html
van <- read.csv("weatherstats_vancouver_hourly.csv")
vic <- read.csv(?????)
wh <- read.csv(?????)

# aggregate weather data from hourly to daily data
# =================================================================================
# output mean daily temperature and wind speed
aggr_to_daily <- function(weather_hourly){
  
  weather_daily <- weather_hourly %>%
    group_by(date = as.Date(weather_hourly$date_time_local)) %>% # group by date
    # get daily temperature and wind speed by averaging the hourly data per day
    # remove missing values (NAs)
    summarise(temperature = mean(temperature, na.rm = TRUE),
              wind_speed = mean(wind_speed, na.rm = TRUE))
  
  data.frame(weather_daily) # output data frame
  
}

van_daily <- aggr_to_daily(van)
vic_daily <- aggr_to_daily(?????)
wh_daily <- aggr_to_daily(?????)

# crop weather data to specific time period
# =================================================================================
crop_period <- function(weather_data, start_day, end_day){
  
  # logical expression: both need to be true (<end_date & >start_date)
  weather_data[weather_data$date <= end_day & weather_data$date >= start_day,]
  
}

start_day <- "2023-01-29"
end_day <- ?????

van_daily <- crop_period(van_daily, start_day, end_day)
vic_daily <- crop_period(vic_daily, start_day, end_day)
wh_daily <- crop_period(wh_daily, start_day, end_day)

# analyze correlations
# =================================================================================
cor(van_daily$temperature, vic_daily$temperature) # pearson's correlation
cor(van_daily$temperature, wh_daily$temperature)

# plot time series
# =================================================================================

lwd = 1.5 # line width

# pdf("temp_van_vic_wh.pdf", width = 7, height = 5) # save as pdf

# use a regular R base plot
# Vancouver
plot(van_daily$date, van_daily$temperature,
     type = "l", col = "purple1", lwd = lwd,
     xlab = ?????, ylab = "Temperature (°C)",
     ylim = c(-35, 25))
# Victoria
lines(vic_daily$date, vic_daily$temperature,
      col = ?????, lwd = lwd)
# Whitehorse
lines(wh_daily$date, wh_daily$temperature,
      col = ?????, lwd = lwd)

# add legend
legend("bottom",
       legend = c("Vancouver", "Victoria", "Whitehorse"),
       fill = c("purple1", ?????, ?????),
       bty = "n", # no box around the legend
       horiz = TRUE
)

# dev.off() # close/write plot
