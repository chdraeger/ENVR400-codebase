# =================================================================================
# PRACTICE: Download data from OpenStreetMap and visualize results on interactive map
# -----> task: fill gaps marked with ?????
# =================================================================================
# content:
# - find latitude, longitude boundary box for a specific spatial area
# - download features from OpenStreetMap (OSM)
# - visualize data on interactive map (Leaflet)

library(osmdata)
library(leaflet)

# set working directory
# setwd("path")

bb <- getbb("Vancouver") # get lat/lon boundary box for Vancouver

# find list of map features here:
# https://wiki.openstreetmap.org/wiki/Map_features

# find leaflet (interactive map) backgrounds here:
# https://leaflet-extras.github.io/leaflet-providers/preview/

# =================================================================================
# 1) dog parks
# =================================================================================
# extract feature from Open Street Map
# latitude, longitude, shapefiles, names, etc.
feature <- bb %>%
  opq() %>%
  add_osm_feature(key = "leisure", value = "dog_park") %>%
  osmdata_sf()

# plot with leaflet (interactive map)
leaflet() %>%
  addTiles() %>%
  addProviderTiles("Esri.WorldGrayCanvas") %>% # select background
  addPolygons(
    data = feature$osm_polygons,
    label = feature$osm_polygons$name,
    color = ?????)

# =================================================================================
# 2) parks + gardens
# =================================================================================
# OSM: garden
garden <- bb %>%
  opq() %>%
  add_osm_feature(key = "leisure", value = "garden") %>%
  osmdata_sf()
# OSM: park
park <- bb %>%
  opq() %>%
  add_osm_feature(key = "leisure", value = "park") %>%
  osmdata_sf()

# plot with leaflet (interactive map)
leaflet() %>%
  addTiles() %>%
  addProviderTiles(?????) %>% # select background
  addPolygons(
    data = park$osm_polygons,
    label = park$osm_polygons$name,
    color = ?????
  ) %>%
  addPolygons(
    data = garden$osm_polygons,
    label = garden$osm_polygons$name,
    color = ?????)
