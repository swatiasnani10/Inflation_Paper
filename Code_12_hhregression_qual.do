clear
cd "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data"
use "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data/inflation_urban_data", replace
gen Date = ym(YEAR,MONTH)
format Date %tm
*keep STATE PERIOD Food_Urban Gen_Urban Nonfood_Urban 
sort STATE Date
encode STATE, gen(state)
tsset state Date


gen lag_inf_food = L3.INF_FOOD
gen lag_inf_nonfood = L3.INF_NONFOOD
gen lag_inf_gen = L3.INF_GENERAL

save inflation_urban_data_lag, replace

********************************************************************************************************


use "/Users/swatiasnani/Desktop/inflation_220521/Raw Data/exp_data_hh.dta", replace
cd "/Users/swatiasnani/Desktop/inflation_220521/Raw Data"
merge m:1 CITY using city_state_match
drop _merge

sort ROUND YEAR MONTH STATE
order ROUND YEAR MONTH STATE
cd "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data"
* MERGING WITH INFLATION DATA
merge m:1 YEAR MONTH STATE using inflation_urban_data_lag	
keep if _merge==3
drop _merge

drop if EXP_FOOD_3M ==  "No Idea"
drop if EXP_FOOD_3M ==  "."

gen food_exp_ind = 0
replace food_exp_ind = 1 if EXP_FOOD_3M ==  "Price increase more than current rate"
replace food_exp_ind = 1 if EXP_FOOD_3M ==  "Price increase similar  to current rate"

drop if EXP_NONFOOD_3M ==  "No Idea"
drop if EXP_NONFOOD_3M ==  "."

gen nonfood_exp_ind = 0
replace nonfood_exp_ind = 1 if EXP_NONFOOD_3M ==  "Price increase more than current rate"
replace nonfood_exp_ind = 1 if EXP_NONFOOD_3M ==  "Price increase similar  to current rate"

encode GENDER, gen(gender)
encode AGE, gen(age)
encode ROUND, gen(round)

***************Household regression**************
cd "/Users/swatiasnani/Desktop/inflation_220521/Results/Household Regressions qualitative"

**Specification  1
eststo: xtreg food_exp_ind lag_inf_food  lag_inf_nonfood gender age i.state  if YEAR < 2015, fe 
eststo: xtreg food_exp_ind  lag_inf_food lag_inf_nonfood gender age i.state if YEAR >= 2015, fe 
eststo: xtreg nonfood_exp_ind lag_inf_food  lag_inf_nonfood gender age i.state if YEAR < 2015, fe  
eststo: xtreg nonfood_exp_ind lag_inf_food  lag_inf_nonfood gender age i.state if YEAR >= 2015, fe  

esttab using HHqual_1.tex, replace title("Qualitative") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Pre-IT" "Post-IT" "Pre-IT" "Post-IT" )   
eststo clear
******************************************************************************************************

