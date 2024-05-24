# =================================================================================
# Create grouped boxplot
# =================================================================================
# content:
# - read daily weather data from csv for three locations
# - find season (winter, spring, summer, autumn)
# - plot grouped boxplot (group: season, colour: location)

library(reshape)
library(ggplot2)

# set working directory
# setwd("path")

# read data
# =================================================================================
# data downloaded from https://vancouver.weatherstats.ca/download.html
# daily average temperature for Vancouver, Victoria and Whitehorse (2000 - 2022)
data <- read.csv("weatherstats_avg_temperature.csv")

# get the season
get_season <- function(date){
  
  date <- as.Date(date) # make sure the input has date format
  mon <- months.Date(date, abbreviate = TRUE) # get month abbreviation
  
  # define winter (Dec, Jan, Feb), spring (Mar, Apr, May),
  # summer (Jun, Jul, Aug), fall (Sep, Oct, Nov)
  ifelse(mon %in% c("Dec", "Jan", "Feb"), "Winter",
         ifelse(mon %in% c("Mar", "Apr", "May"), "Spring",
                ifelse(mon %in% c("Jun", "Jul", "Aug"), "Summer", "Fall")))
  
}

data$season <- get_season(data$date)

# =================================================================================
# boxplot of daily temperature by season
# for Vancouver, Victoria and Whitehorse
# =================================================================================

# need to "melt" the data: reshaping the data for plotting
data <- melt(data, id = c("season", "date"))
# variable: Vancouver, Whitehorse, Victoria

# pdf("boxplot_temp.pdf", width = 6, height = 4) # save as pdf

ggplot(data, aes(x=season, y=value, fill=variable)) +
  geom_boxplot() +
  xlab("Season") + ylab("Average daily temperature (°C)") + labs(fill="Location")
  
# dev.off() # close/write plot
