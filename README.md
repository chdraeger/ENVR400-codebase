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

