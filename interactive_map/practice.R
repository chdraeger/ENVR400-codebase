# =================================================================================
# PRACTICE: Read shapefile/locations and plot on interactive map based on features
# -----> task: fill gaps marked with ?????
# =================================================================================
# content:
# - read shapefile
# - plot on interactive map (leaflet) based on a variable (different size + colour)

library(leaflet)
library(sf)

# set working directory
# setwd("path")

# read and clean data
# =================================================================================
# https://opendata.vancouver.ca/explore/dataset/community-gardens-and-food-trees/
# point data
loc <- read_sf(dsn = "community-gardens-and-food-trees/", # name of directory
               layer = "community-gardens-and-food-trees") # name of file

# find empty entries and delete (not crucial, but would give a warning while mapping)
loc <- loc[!st_is_empty(loc),]

# turn from character to numeric
loc$number_of_p <- as.numeric(loc$number_of_p) # number of plots

# set all values that show 0 to NA
# (for the first simple plot now, would need to investigate/add numbers/...)
loc$number_of_p[loc$number_of_p == 0] <- NA


# plot with leaflet (interactive map)
# find backgrounds here: https://leaflet-extras.github.io/leaflet-providers/preview/
# =================================================================================

pal <- colorNumeric(palette = c(?????, "darkred"),
                    domain = loc$number_of_p) # color limits: number of plots (min, max)

# map all community gardens
# the size of the circles and the colour both represent the number of plots in the community garden
leaflet() %>%
  addTiles() %>%
  addProviderTiles(?????) %>% # select background
  addCircles(
    data = loc$geometry, # number of plots in each community garden
    radius = loc$number_of_p*?????, # multiply by a constant for visibility
    color = pal(loc$number_of_p))
