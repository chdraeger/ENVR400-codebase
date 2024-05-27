# ENVR400-codebase

*Data Analysis Code Base and Resources
ENVR 400: Research Project in Environmental Science
University of British Columbia*

`R` code base for common data analysis and mapping problems in ENVR 400 projects. The objective is to provide ideas, code snippets and resources for your data analysis projects.

## General structure
Each folder contains 1) `main.R` with the complete R-code for the respective data analysis problem and visualization, 2) `practice.R`, based on `main.R`, with a few gaps in the code, marked with `?????`, 3) figures produced by `main.R`, and 4) data files (if applicable).

## Folder overview


### Plot time series data

<img align="right" src="https://github.com/chdraeger/ENVR400-codebase/blob/main/time_series/time_series.jpeg" width="300" height="300">

*Folder name: time_series*

**Content:**
- read hourly weather data from csv
- aggregate to daily data
- ﬁnd correla=on coefficients between different time series
- plot different time series

**Level:** beginner

**Example data:**
- hourly weather data from Vancouver, Victoria and Whitehorse (12/2022 -01/2024)

<br clear="left"/>


### Compare data pairs

<img align="right" src="https://github.com/chdraeger/ENVR400-codebase/blob/main/compare_pairs/compare_pairs.jpeg" width="300" height="300">

*Folder name: compare_pairs*

**Content:**
- read daily weather data from csv
- find season (winter, summer)
- plot pairwise comparison (temperature in Vancouver vs. Whitehorse)
- distinguish between diﬀerent groups (winter vs. summer)

**Level:** beginner

**Example data:**
- daily average temperatures (2023) for Vancouver and Whitehorse
<br clear="left"/>


### Create grouped boxplot

<img align="right" src="https://github.com/chdraeger/ENVR400-codebase/blob/main/grouped_boxplot/grouped_boxplot.jpeg" width="300" height="300">

*Folder name: grouped_boxplot*

**Content:**
- read daily weather data from csv for three locations
- find season (winter, spring, summer, autumn)
- plot grouped boxplot (group: season, color: location)

**Level:** beginner

**Example data:**
- daily average temperatures (2000-2023) for Vancouver, Victoria and Whitehorse
<br clear="left"/>


### Perform time series clustering based on mean day of year values

<img align="right" src="https://github.com/chdraeger/ENVR400-codebase/blob/main/cluster_time_series/dendrogram.jpeg" width="300" height="300">

*Folder name: cluster_time_series*

**Content:**
- read day of year (DOY) time series for several samples
- perform hierarchical clustering based on the DOY time series
- create cluster dendrogram
- cut cluster and extract the cluster number for each sample

**Level:** intermediate

**Example data:**
- mean day of year (DOY) albedo time series (2000-2017) for all glaciers on Vancouver Island
<br clear="left"/>



### Download data from OpenStreetMap and plot on interactive map

<img align="right" src="https://github.com/chdraeger/ENVR400-codebase/blob/main/openstreetmap/openstreetmap.png" width="300" height="300">

*Folder name: openstreetmap*

**Content:**
- ﬁnd latiude/longitude boundary box for a speciﬁc spatial area
- download features from OpenStreetMap (OSM)
- visualize data on interac=ve map (Leaﬂet)

**Level:** beginner
<br clear="left"/>

$~~~~~~~~~~~$
$~~~~~~~~~~~$

### Read shapeﬁles and locations and plot on interactive map based on features

<img align="right" src="https://github.com/chdraeger/ENVR400-codebase/blob/main/interactive_map/interactive_map.png" width="300" height="300">

*Folder name: interactive_map*

**Content:**
- read shapeﬁle
- plot on interactive map (leaﬂet) based on features (different size and color)

**Level:** beginner

**Example data:**
- community gardens and food trees in Vancouver

<br clear="left"/>


### Read shapeﬁle and location points and plot on static map

<img align="right" src="https://github.com/chdraeger/ENVR400-codebase/blob/main/static_map/static_map.jpeg" width="300" height="300">

*Folder name: static_map*

**Content:**
- read location points from csv ﬁle
- deﬁne other location points in the code
- read shapeﬁle and transform coordinate system
- get centroids of shapes
- plot map and add shapes, locations and labels

**Level:** intermediate

**Example data:**
- shapeﬁles of climatic subareas and location of all glaciers in British Columbia and Alberta

<br clear="left"/>


### Download elevation raster data and BC shapeﬁles and visualize

<img align="right" src="https://github.com/chdraeger/ENVR400-codebase/blob/main/map_elevation/map_elevation.jpeg" width="300" height="300">

*Folder name:  map_elevation*

**Content:**
- download elevation data
- download BC boundary shapes
- plot shape on raster

**Level:** beginner

<br clear="left"/>


$~~~~~~~~~~~$
## Resources
### Data (Vancouver)
- Weather data: https://vancouver.weatherstats.ca/download.html
- Vancouver open data portal: https://opendata.vancouver.ca

### Mapping
- OpenStreetMap: free, open geographic database; list of map features: h$ps://wiki.openstreetmap.org/wiki/Map_features
- Leaﬂet: open-source library for interacAve maps; available as an `R`-package'; list of Leaﬂet providers (map backgrounds): https://leaﬂet-extras.github.io/leaﬂet-providers/preview/
- `bcmaps`: `R`-package of spatial map layers for British Columbia
Provides shapeﬁles of British Columbia and subregions, municipalities, hydrological boundaries, ecological regions, drainage areas, etc.
- `elevatr`: `R`-package for downloading elevation data
