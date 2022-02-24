* DATA PULL FOR CPI DATA TO CALCULATE INFLATION FOR EACH MONTH

clear
cd "/Users/swatiasnani/Desktop/inflation_220521/Raw Data"

import delimited "/Users/swatiasnani/Desktop/inflation_220521/Data Source/CPI/CPIndex_Jan11-To-Dec12.csv"

replace group=0 if description=="General Index (All Groups)"
drop if group==.
keep year month state group urban

* GROUP - NATURE OF COMMODITY (FOOD,FUEL,ETC.)
sort year month state group 
quietly by year month state group:  gen dup = cond(_N==1,0,_n)              
drop if dup>1
drop dup

reshape wide urban, i(year month state) j(group)

rename urban0 CPI_GENERAL
rename urban1 CPI_FOOD
rename urban2 CPI_PAN
rename urban3 CPI_CLOTH
rename urban4 CPI_HOUSE
rename urban5 CPI_FUEL
rename urban6 CPI_MISC

rename year YEAR
rename month MONTH_NAME
rename state STATE

gen MONTH=1 if MONTH_NAME=="January"
replace MONTH=2 if MONTH_NAME=="February"
replace MONTH=3 if MONTH_NAME=="March"
replace MONTH=4 if MONTH_NAME=="April"
replace MONTH=5 if MONTH_NAME=="May"
replace MONTH=6 if MONTH_NAME=="June"
replace MONTH=7 if MONTH_NAME=="July"
replace MONTH=8 if MONTH_NAME=="August"
replace MONTH=9 if MONTH_NAME=="September"
replace MONTH=10 if MONTH_NAME=="October"
replace MONTH=11 if MONTH_NAME=="November"
replace MONTH=12 if MONTH_NAME=="December"

drop MONTH_NAME


save cpi_11_12, replace

****************************************

clear
import delimited "/Users/swatiasnani/Desktop/inflation_220521/Data Source/CPI/CPIndex_Jan13-To-Mar20.csv"

replace group=0 if description=="General Index (All Groups)"
drop if group==.
keep year month state group urban

sort year month state group
quietly by year month state group:  gen dup = cond(_N==1,0,_n)
drop if dup>1
drop dup

reshape wide urban, i(year month state) j(group)

rename urban0 CPI_GENERAL
rename urban1 CPI_FOOD
rename urban2 CPI_PAN
rename urban3 CPI_CLOTH
rename urban4 CPI_HOUSE
rename urban5 CPI_FUEL
rename urban6 CPI_MISC

rename year YEAR
rename month MONTH_NAME
rename state STATE

gen MONTH=1 if MONTH_NAME=="January"
replace MONTH=2 if MONTH_NAME=="February"
replace MONTH=3 if MONTH_NAME=="March"
replace MONTH=4 if MONTH_NAME=="April"
replace MONTH=5 if MONTH_NAME=="May"
replace MONTH=6 if MONTH_NAME=="June"
replace MONTH=7 if MONTH_NAME=="July"
replace MONTH=8 if MONTH_NAME=="August"
replace MONTH=9 if MONTH_NAME=="September"
replace MONTH=10 if MONTH_NAME=="October"
replace MONTH=11 if MONTH_NAME=="November"
replace MONTH=12 if MONTH_NAME=="December"

drop MONTH_NAME

save cpi_13_20, replace

****************************************
clear

use cpi_11_12, replace
append using cpi_13_20

drop if CPI_GENERAL==.
drop if CPI_FOOD==.
 
label variable CPI_FOOD "Food and beverages"
label variable CPI_PAN "Pan; tobacco; and intoxicants"
label variable CPI_CLOTH "Clothing and footwear"
label variable CPI_HOUSE "Housing"
label variable CPI_FUEL "Fuel and light"
label variable CPI_MISC "Miscellaneous"
label variable CPI_GENERAL "General Index"
label variable MONTH "Month"

sort STATE YEAR MONTH

save cpi_urban_data, replace

*****************************************************


