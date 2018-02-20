#!/bin/bash

# Run this from the directory FARS-traffic

# Check for wget and unzip
command -v wget >/dev/null 2>&1 || { echo "wget not installed.  Aborting." >&2; exit 1; }
command -v unzip >/dev/null 2>&1 || { echo "unzip not installed.  Aborting." >&2; exit 1; }

# Make directories for each year
if [ ! -e ./data/2010 ]; then
  mkdir -p ./data/{2010..2016}
fi


# List of NHTA FARS ftp URLs for years 2010 to 2015
base_url_fars="ftp://ftp.nhtsa.dot.gov/FARS"
declare -a fars_urls=( "2010/SAS/FSAS2010.zip"
                       "2011/SAS/FSAS2011.zip"
                       "2012/National/SAS/FSAS2012.zip"
                       "2013/National/FARS2013NationalSAS.zip"
                       "2014/National/FARS2014NationalSAS.zip"
                       "2015/National/FARS2015NationalSAS.zip")
                       "2016/National/FARS2015NationalSAS.zip")

# enter the data directory
pushd data

# http://tldp.org/LDP/LG/issue18/bash.html
for url in "${fars_urls[@]}"; do
  wget ${base_url_fars}/${url}
  year=${url%%/*}
  file=${url##*/}
  unzip -d $year $file
  rm $file
done

# GSA Geographic Location Codes used to encode US Cities, Counties, etc
# FARS data manual pages 38, 39 (table of contents off by one page)
wget "https://www.gsa.gov/cdnstatic/GLCs_for_the_USA_and_DC_%281%29.xlsx"
mv GLCs_for_the_USA_and_DC_\(1\).xlsx GLCs_for_the_USA_and_DC.xlsx

# Return to the previous directory
popd


## Download Census 2015 US boundary shapefiles ##
## State, County                               ##
base_url_census_tiger="http://www2.census.gov/geo/tiger"
declare -a tiger_urls=("GENZ2015/shp/cb_2015_us_state_20m.zip"
                       "GENZ2015/shp/cb_2015_us_county_20m.zip")

if [ ! -e ./data/shapefiles ]; then
  mkdir -p ./data/shapefiles
fi

# Enter the ./data/shapefiles directory
pushd ./data/shapefiles

for shapefile in "${tiger_urls[@]}"; do
  wget ${base_url_census_tiger}/$shapefile
done

# Unzip all of the shapefiles into their own directory
# and remove the zip file.
zipfile_arr=(*.zip)
for file in "${zipfile_arr[@]}"; do
  base=${file%%.*}
  mkdir $base
  unzip -d $base $file
  rm $file
done

# Return to the main directory
popd
