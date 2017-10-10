#!/bin/bash

# Run this from the top directory FARS-traffic

# Check for wget and unzip
command -v wget >/dev/null 2>&1 || { echo "wget not installed.  Aborting." >&2; exit 1; }
command -v unzip >/dev/null 2>&1 || { echo "unzip not installed.  Aborting." >&2; exit 1; }

# Make directories for each year
mkdir -p ./data/{2010..2015}

base_url_fars="ftp://ftp.nhtsa.dot.gov/FARS"

# List of NHTA FARS ftp URLs for years 2010 to 2015
declare -a fars_urls=( "2010/SAS/FSAS2010.zip"
                       "2011/SAS/FSAS2011.zip"
                       "2012/National/SAS/FSAS2012.zip"
                       "2013/National/FARS2013NationalSAS.zip"
                       "2014/National/FARS2014NationalSAS.zip"
                       "2015/National/FARS2015NationalSAS.zip")

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

popd
