clear

cd "/Users/swatiasnani/Desktop/inflation_220521/Raw Data"
use cpi_urban_data

merge m:1 STATE using cpi_weight_statewise	//MERGING WITH DATA ON STATE-WISE WEIGHTS IN INFLATION FOR EACH COMMODITY
keep if _merge==3
drop _merge

encode STATE, gen(STATE_CODE)
sort STATE YEAR MONTH
gen YEAR_MONTH = ym(YEAR,MONTH)
format YEAR_MONTH %tm

//CONVERTING DATASET TO PANEL DATA
xtset STATE_CODE YEAR_MONTH

//CALCULATING NON-FOOD CPI
gen CPI_NONFOOD=(WT_PAN*CPI_PAN+WT_CLOTH*CPI_CLOTH+WT_HOUSE*CPI_HOUSE+WT_FUEL*CPI_FUEL+WT_MISC*CPI_MISC)/(WT_PAN+WT_CLOTH+WT_HOUSE+WT_FUEL+WT_MISC)

//CALCULATING ALL INFLATION FOR EACH MONTH FOR EVERY STATE
gen INF_GENERAL=((CPI_GENERAL-L12.CPI_GENERAL)/L12.CPI_GENERAL)*100	//L12 - 12TH LAGGED VALUE (Y-O-Y INFLATION)
gen INF_FOOD=((CPI_FOOD-L12.CPI_FOOD)/L12.CPI_FOOD)*100
gen INF_PAN=((CPI_PAN-L12.CPI_PAN)/L12.CPI_PAN)*100
gen INF_CLOTH=((CPI_CLOTH-L12.CPI_CLOTH)/L12.CPI_CLOTH)*100
gen INF_HOUSE=((CPI_HOUSE-L12.CPI_HOUSE)/L12.CPI_HOUSE)*100
gen INF_FUEL=((CPI_FUEL-L12.CPI_FUEL)/L12.CPI_FUEL)*100
gen INF_MISC=((CPI_MISC-L12.CPI_MISC)/L12.CPI_MISC)*100
gen INF_NONFOOD=((CPI_NONFOOD-L12.CPI_NONFOOD)/L12.CPI_NONFOOD)*100

keep STATE YEAR MONTH YEAR_MONTH INF_GENERAL INF_FOOD INF_NONFOOD INF_PAN INF_CLOTH INF_HOUSE INF_FUEL INF_MISC



cd "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data"
save inflation_urban_data, replace
