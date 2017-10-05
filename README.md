# FARS-traffic
FARS-traffic

The reports folder contains plots from the Jupyter Ipython notebooks and Rstudio

## 1. Clone the repository  
```bash
git clone https://github.com/stoneyv/kepler-traffic.git
```

## 2. Download FARS Data for years 2010 until 2015

data source: ftp://ftp.nhtsa.dot.gov/

```bash
chmod +x download-data.sh
./download-data.sh
``` 

## 3. Transform the data using jupytr ipython notebooks

Install Anaconda Python3
https://docs.continuum.io/anaconda/install

Many of the necessary python packages for analyzing data are automatically installed.

Install the seaborn plotting package
`conda install seaborn`


## 4. Get the FARS Analytical User's Manual
Fatality Analysis Reporting System (FARS) Analytical User's Manual 1975-2015
*  https://crashstats.nhtsa.dot.gov/#/
*  https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/812315


## 5. Optional R ggplot2
Install R language, Rstudio or Rstudio server
https://www.rstudio.com/products/rstudio/

