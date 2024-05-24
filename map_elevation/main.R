# =================================================================================
# Plot elevation raster and shape files
# =================================================================================
# content:
# download elevation data
# download BC boundaries
# plot shape on raster

library(raster)
library(bcmaps) # for BC shapes
library(ggplot2)
library(marmap) # for map colour
library(elevatr) # for elevation
library(tidyterra)
library(terra)

# set working directory
# setwd("path")

# read data
# =================================================================================

# get boundary box (min/max lat/lon) for BC
bbox <- bc_bbox(crs = "WGS84")  # lat long coordinate system
y <- c(bbox$ymin, bbox$ymax)
x <- c(bbox$xmin, bbox$xmax)
bbox_df <- data.frame(x, y) # create data frame from boundaries

# get BC shapefile
shape <- bc_bound()

# get elevation: will download elevation for the given boundary box
# z: zoom (higher values mean higher resolution)
elevation <- get_elev_raster(locations = bbox_df, z = 5, prj="WGS84")

# plot map
# =================================================================================
# pdf("bc_map.pdf", height = 5, width = 5)

ggplot() +
  geom_spatraster(data = rast(elevation)) +
  scale_fill_etopo() + # map colours
  geom_sf(data = shape, fill = NA, lwd = 0.5, col="black") + # lwd: linewidth
  labs(fill="Elevation (m)") # colour bar title

# dev.off() # close/write plot

# if you want to define your own map colours, switch scale_fill_etopo e.g. with
# scale_fill_gradientn(colours = colorRampPalette(
#       c("royalblue4", "lightblue3", "chartreuse4", "khaki2", "tan", "tan4"))(100))
# or 
# hcl.colors(200, "Geyser")

# if you only want to plot data on land (= where elevation is >0)
# set the elevation of cells < 0 to NA before plotting:
# values(elevation)[which(values(elevation)<=0)] <- NA

