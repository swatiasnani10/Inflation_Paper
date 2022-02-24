clear
*cd "/Users/swatiasnani/Desktop/inflation_220521/Data Source"

import excel "/Users/swatiasnani/Desktop/inflation_220521/Data Source/IESH/IESH_59.xlsx", clear
drop in 1/8
drop C
drop if B==""
drop B
tempfile tmp
save `tmp'



forvalues i=58(-1)23{
	import excel "/Users/swatiasnani/Desktop/inflation_220521/Data Source/IESH/IESH_`i'.xlsx", clear
	drop in 1/8
	drop C
	drop if B==""
	drop B
	append using `tmp'
	erase `tmp'
	tempfile tmp
	save `tmp'
}

rename D ROUND
rename E PERIOD
rename F CITY
rename G PIN
rename H GENDER
rename I AGE
rename J CATEGORY
rename K EXP_GENERAL_3M
rename L EXP_FOOD_3M
rename M EXP_NONFOOD_3M
rename N EXP_HHDURABLES_3M
drop O
rename P EXP_HOUSING_3M
rename Q EXP_SERVICES_3M
rename R EXP_GENERAL_1Y
rename S EXP_FOOD_1Y
rename T EXP_NONFOOD_1Y
rename U EXP_HHDURABLES_1Y
rename V EXP_HOUSING_1Y
rename W EXP_SERVICES_1Y
rename X VIEW_INF_CURR
rename Y VIEW_INF_CURR_ADDN
rename Z VIEW_INF_3M
rename AA VIEW_INF_3M_ADDN
rename AB VIEW_INF_1Y
rename AC VIEW_INF_1Y_ADDN

label variable ROUND "Round No"
label variable PERIOD "Period"
label variable CITY "City Name"
label variable PIN "PIN Code"
label variable GENDER "Gender Of Respondent"
label variable AGE "Age Group"
label variable CATEGORY "Category of Respondent"
label variable EXP_GENERAL_3M "Expectations on prices in next 3 months - General"
label variable EXP_FOOD_3M "Expectations on prices in next 3 months - Food products"
label variable EXP_NONFOOD_3M "Expectations on prices in next 3 months - Non food products"
label variable EXP_HHDURABLES_3M "Expectations on prices in next 3 months - Household durables"
label variable EXP_HOUSING_3M "Expectations on prices in next 3 months - Housing"
label variable EXP_SERVICES_3M "Expectations on prices in next 3 months - Services"
label variable EXP_GENERAL_1Y "Expectations on prices in next 1 year - General"
label variable EXP_FOOD_1Y "Expectations on prices in next 1 year - Food products"
label variable EXP_NONFOOD_1Y "Expectations on prices in next 1 year - Non food products"
label variable EXP_HHDURABLES_1Y "Expectations on prices in next 1 year - Household durables"
label variable EXP_HOUSING_1Y "Expectations on prices in next 1 year - Housing"
label variable EXP_SERVICES_1Y "Expectations on prices in next 1 year - Services"
label variable VIEW_INF_CURR "View on Current Inflation Rate"
label variable VIEW_INF_CURR_ADDN "View on Current Inflation Rate - actual rate for above 16%"
label variable VIEW_INF_3M "View on 3 Months ahead Inflation Rate"
label variable VIEW_INF_3M_ADDN "View on 3 Months ahead Inflation Rate - actual rate for above 16%"
label variable VIEW_INF_1Y "View on 1 Year ahead Inflation Rate"
label variable VIEW_INF_1Y_ADDN "View on 1 Year ahead Inflation Rate - actual rate for above 16%"

describe

gen TIME = date(PERIOD, "DMY")
format TIME %td
gen YEAR = year(TIME)
gen MONTH = month(TIME)

drop VIEW_INF_CURR_ADDN VIEW_INF_3M_ADDN VIEW_INF_1Y_ADDN TIME
replace CITY = "Thiruvananthapuram" if CITY == "Thiruvananthapuram " //EDITING AND FORMATTING TO FACILITATE MERGING

save "/Users/swatiasnani/Desktop/inflation_220521/Raw Data/exp_data_hh.dta", replace
use "/Users/swatiasnani/Desktop/inflation_220521/Raw Data/exp_data_hh.dta", replace
