# =================================================================================
# Read shapefile and location points and plot on static map
# =================================================================================
# content:
# - read location points from csv file (glaciers)
# - define other location points in the code (cities)
# - read shapefile and transform coordinate system
# - get centroids of shapes
# - plot map and add shapefiles, location and labels

library(ggplot2)
library(ggspatial)
library(sf)

# set working directory
# setwd("path")

# read and preprocess data
# =================================================================================
# read glacier locations
glaciers <- read.csv("rgi.csv") # from RGI (Randolph glacier inventory)

# define city locations
cities <- data.frame(
  name = c("Vancouver", "Whitehorse", "Prince Rupert", "Prince George", "Edmonton", "Seattle"),
  lon = c(-123.116226, -135.0523, -130.3208, -122.7497, -113.4937, -122.3328),
  lat = c(49.246292, 60.7197, 54.3150, 53.9171, 53.5461, 47.6061))

# read shapefile of subregions in BC and Alberta
shp <- st_read("bc_alberta_subregions/bc_alberta_subregions.shp")

# transform map projection to lat lon
# EPSG code for WGS84 (= lat long coordinate system)
shp <- st_transform(shp, crs = 4326)

# get centroids of the subregion shapes
centroids_shp <- st_centroid(shp)
centroids <- data.frame( # transform to data frame
  centroids_shp$abbr, # label (abbreviation of subregion)
  st_coordinates(centroids_shp)) # lat lon coordinates
colnames(centroids) <- c("subregion", "lon", "lat") # column names

# plot map of all glaciers in BC and Alberta
# add subregions and cities
# =================================================================================
# pdf("map.pdf", width = 7, height = 5.5) # save as pdf

ggplot() +
  # add static map
  annotation_map_tile(
    type = "osm", # from OpenStreetMap
    cachedir = "maps/", # download map into a cache directory in your folder
    zoom = 4) + # sets the zoom level relative to the default
  # add subregion shapefile
  geom_sf(data = shp, fill="lightpink3", alpha=0.2) + # alpha: transparency
  # define limits of map and coordinate reference system
  coord_sf(
    xlim = c(-141, -112), 
    ylim = c(48, 61),
    crs = 4326) + # EPSG code for WGS84 (= lat long coordinate system)
  # label axes
  labs(x = "Longitude", y = "Latitude") +
  # add glacier points
  geom_point(data = glaciers, aes(x = lon, y = lat), 
             size = 0.3, col = "gold3", pch = 15) +
  # add city points
  geom_point(data = cities, aes(x = lon, y = lat), 
             size = 2, col = "black", pch = 15) +
  # label cities
  geom_text(data = cities, aes(x=lon, y=lat, label = name), vjust = -0.5) +
  # label subregions
  geom_text(data = centroids, aes(x=lon, y=lat, label = subregion), vjust = 0.4,
            fontface = "bold", colour = "darkred")

# dev.off() # write/close plot
