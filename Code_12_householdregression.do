clear

cd "/Users/swatiasnani/Desktop/inflation_220521/Raw Data"

use exp_data_hh

merge m:1 CITY using city_state_match	//MERGING TO MATCH CITY WITH STATE
drop _merge

foreach var in VIEW_INF_3M VIEW_INF_1Y VIEW_INF_CURR{
gen EXP_`var' = 0.5 if `var' == "<1"
replace EXP_`var' = 1.5 if `var' == "1-2" 
replace EXP_`var' = 2.5 if `var' == "2-3" 
replace EXP_`var' = 3.5 if `var' == "3-4" 
replace EXP_`var' = 4.5 if `var' == "4-5"
replace EXP_`var' = 5.5 if `var' == "5-6"
replace EXP_`var' = 6.5 if `var' == "6-7" 
replace EXP_`var' = 7.5 if `var' == "7-8" 
replace EXP_`var' = 8.5 if `var' == "8-9" 
replace EXP_`var' = 9.5 if `var' == "9-10"
replace EXP_`var' = 10.5 if `var' == "10-11" 
replace EXP_`var' = 11.5 if `var' == "11-12" 
replace EXP_`var' = 12.5 if `var' == "12-13" 
replace EXP_`var' = 13.5 if `var' == "13-14" 
replace EXP_`var' = 14.5 if `var' == "14-15" 
replace EXP_`var' = 15.5 if `var' == "15-16" 
replace EXP_`var' = 16.5 if `var' == ">=16"
replace EXP_`var' = 0 if `var' == "No Idea" 
}


encode GENDER, gen(gender)
encode AGE, gen(age)
encode ROUND, gen(round)
rename STATE State
gen Date =ym(YEAR,MONTH)
format Date %tm
encode State, gen(state)
sort state Date


save quant_hh_using, replace

use "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data/statewise_inf_expec_data", clear


gen Date = ym(YEAR,MONTH)
format Date %tm
*keep STATE PERIOD Food_Urban Gen_Urban Nonfood_Urban 
sort STATE Date
encode STATE, gen(state)

tsset state Date


gen lag_inf_food = L3.INF_FOOD
gen lag_inf_nonfood = L3.INF_NONFOOD
gen lag_inf_gen = L3.INF_GENERAL


merge 1:m state Date using quant_hh_using

keep if _merge ==3
drop _merge



***************Household regression**************
cd "/Users/swatiasnani/Desktop/inflation_220521/Results/Household Regressions quantitative"
**Specification  1
eststo: xtreg EXP_VIEW_INF_3M lag_inf_gen gender age i.state if YEAR < 2015, fe 
eststo: xtreg EXP_VIEW_INF_3M lag_inf_gen gender age i.state if YEAR  >= 2015, fe 
eststo: xtreg EXP_VIEW_INF_1Y lag_inf_gen gender age i.state if YEAR < 2015, fe  
eststo: xtreg EXP_VIEW_INF_1Y lag_inf_gen gender age i.state if YEAR >= 2015, fe  
esttab using HHquant1_b.rtf, replace title("Quantitative") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Pre-IT" "Post-IT" "Pre-IT" "Post-IT" )   
eststo clear

**Specification  2
eststo: xtreg EXP_VIEW_INF_3M lag_inf_food  lag_inf_nonfood gender age i.state  if YEAR < 2015, fe 
eststo: xtreg EXP_VIEW_INF_3M lag_inf_food lag_inf_nonfood gender age i.state if YEAR >= 2015, fe 
eststo: xtreg EXP_VIEW_INF_1Y lag_inf_food  lag_inf_nonfood gender age i.state if YEAR < 2015, fe  
eststo: xtreg EXP_VIEW_INF_1Y lag_inf_food  lag_inf_nonfood gender age i.state if YEAR >= 2015, fe  
esttab using HHquant2_b.rtf, replace title("Quantitative") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Pre-IT" "Post-IT" "Pre-IT" "Post-IT" )   
eststo clear
******************************************************************************************************

