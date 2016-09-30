# kepler-traffic
kepler-traffic

The reports folder contains plots from the Jupyter Ipython notebooks and Rstudio

## Fetch Data
data source: ftp://ftp.nhtsa.dot.gov/
 
## Get the FARS Analytical User's Manual
Fatality Analysis Reporting System (FARS) Analytical User's Manual 1975-2015
*  https://crashstats.nhtsa.dot.gov/#/
*  https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/812315

## Installation

`git clone https://github.com/stoneyv/kepler-traffic.git`

Install Anaconda Python3
https://docs.continuum.io/anaconda/install

Many of the necessary python packages for analyzing data are automatically installed.

Install the seaborn plotting package
`conda install seaborn`

### Optional
Install R language, Rstudio or Rstudio server
https://www.rstudio.com/products/rstudio/

Install QGIS
https://www.qgis.org/en/site/forusers/download.html

## Reproducing the result
Unzip the FARS files for years 2001 through 2015 into a FARS folder with a a folder for each year.  Currently there are notebooks for the accident and vehicle tables.  Images from the notebooks have been saved to the reports folder in this repository.
