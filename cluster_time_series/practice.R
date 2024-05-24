# =================================================================================
# PRACTICE: Perform time series clustering based on mean day of year values
# -----> task: fill gaps marked with ?????
# =================================================================================
# content:
# - read day of year (DOY) time series for several samples
# - perform hierarchical clustering based on the DOY time series
# - create cluster dendrogram
# - cut cluster and extract the cluster number for each sample

library(distances) # for calculating the distance matrices
library(factoextra) # for plotting

# set working directory
# setwd("path")

# read data
# =================================================================================
# mean day of year (DOY) albedo time series (2000-2017) for all glaciers on Vancouver Island
alb <- read.csv(?????)

# perform clustering
# =================================================================================
# get the DOY albedo (without the first columns: id, lat, lon)
alb_doy <- as.matrix(alb[, grepl("DOY", colnames(alb))])
# grepl selects the columns with "DOY" in their column name

# scale the data
alb_doy <- scale(?????)

# create a distance matrix between samples (glaciers)
dist <- distance_matrix(distances(alb_doy))

# use Ward's hierarchical clustering method
hc <- hclust(dist, method="ward.D2")

# plot dendrogram
# =================================================================================
# for choosing the "optimal" number of clusters: there are numerous analytical methods
# here for simplicity: choose by inspecting the cluster dendrogram
fviz_dend(hc,
          k = ?????, # choose number of clusters
          k_colors = c("lancet"),
          rect = TRUE,
          rect_border = "lancet",
          rect_fill = TRUE
)

# get cluster output data frame
# =================================================================================
# cut the cluster tree to the optimal number (here: 3)
cut <- cutree(hc, k = ?????, h = 0.3)

# result data frame
df_clust <- data.frame(
  id = alb$id, # glacier id
  cluster = cut # cluster
)
