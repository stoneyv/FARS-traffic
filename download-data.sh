#!/bin/bash

# Run this from the top directory FARS-traffic 

# Check for wget and unzip 
command -v wget >/dev/null 2>&1 || { echo "wget not installed.  Aborting." >&2; exit 1; }
command -v unzip >/dev/null 2>&1 || { echo "unzip not installed.  Aborting." >&2; exit 1; }

# Make directories for each year
mkdir -p data/{2010..2015}

# List of NHTA FARS ftp URLs for years 2015 to 2010
wget -P ./data/2010 ftp://ftp.nhtsa.dot.gov/FARS/2010/SAS/FSAS2010.zip 
wget -P ./data/2011 ftp://ftp.nhtsa.dot.gov/FARS/2011/SAS/FSAS2011.zip
wget -P ./data/2012 ftp://ftp.nhtsa.dot.gov/FARS/2012/National/SAS/FSAS2012.zip
wget -P ./data/2013 ftp://ftp.nhtsa.dot.gov/FARS/2013/National/FARS2013NationalSAS.zip
wget -P ./data/2014 ftp://ftp.nhtsa.dot.gov/FARS/2014/National/FARS2014NationalSAS.zip
wget -P ./data/2015 ftp://ftp.nhtsa.dot.gov/FARS/2015/National/FARS2015NationalSAS.zip


# Unzip SAS files for each year and then remove the zip file
unzip -d ./data/2010 ./data/2010/FSAS2010.zip
rm ./data/2010/FSAS2010.zip

unzip -d ./data/2011 ./data/2011/FSAS2011.zip
rm ./data/2011/FSAS2011.zip

unzip -d ./data/2012 ./data/2012/FSAS2012.zip
rm ./data/2012/FSAS2012.zip

unzip -d ./data/2013 ./data/2013/FARS2013NationalSAS.zip
rm ./data/2013/FARS2013NationalSAS.zip

unzip -d ./data/2014 ./data/2014/FARS2014NationalSAS.zip
rm ./data/2014/FARS2014NationalSAS.zip

unzip -d ./data/2015 ./data/2015/FARS2015NationalSAS.zip
rm ./data/2015/FARS2015NationalSAS.zip
