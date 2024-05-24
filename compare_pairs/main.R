# =================================================================================
# Compare and visualize data pairs and groups within pairs
# =================================================================================
# content:
# - read daily weather data csv
# - find season
# - plot pairwise comparison
# - distinguish between different groups (winter/summer)

# set working directory
# setwd("path")

# read data
# =================================================================================
# data downloaded from https://vancouver.weatherstats.ca/download.html
van <- read.csv("weatherstats_vancouver_daily.csv") # Vancouver
wh <- read.csv("weatherstats_whitehorse_daily.csv") # Whitehorse

# get the season
get_season <- function(date){
  
  date <- as.Date(date) # make sure the input has date format
  
  ifelse(
    # if months are between Apr-Sept: summer; else: winter
    months.Date(date, abbreviate = TRUE) %in% c("Apr", "May", "Jun", "Jul", "Aug", "Sep"),
    "s", "w")
  
}

van$season <- get_season(van$date)

# =================================================================================
# Plot pairwise comparison: Vancouver vs. Whitehorse temperature
# =================================================================================
# shows relative comparison: bias, overestimation, etc.

# transform to numeric values to plot the season
van$season_num <- ifelse(van$season == "w", 1, 2)
# 1: winter, 2: summer

# pdf("comp_van_wh.pdf", width = 5, height = 5) # save as pdf

plot(van$avg_temperature, wh$avg_temperature, # x, y
     xlab = "Mean daily temperature in Vancouver (°C)",
     ylab = "Mean daily temperature in Whitehorse (°C)",
     pch = 16, # filled points
     col = c("gold2", "turquoise3")[van$season_num], # color according to season
     xlim = c(-28, 25), ylim = c(-28, 25),
     main = "2023")

abline(coef = c(0,1)) # add diagonal line to plot

legend("topleft",
       legend = c("Winter", "Summer"),
       fill = c("gold2", "turquoise3"),
       bty = "n" # no box around the legend
       )

# dev.off() # close/write plot
