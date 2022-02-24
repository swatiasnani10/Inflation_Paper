//CREATE QUANTITIVATE ANALYSIS DATA

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

keep ROUND YEAR MONTH STATE EXP_VIEW_INF_1Y EXP_VIEW_INF_3M EXP_VIEW_INF_CURR

bys STATE ROUND: egen INF_EXPECT_3M = mean(EXP_VIEW_INF_3M)	//STATE-WISE EXPECTED INFLATION = MEAN OF INDIVIDUAL EXPECTATIONS
bys STATE ROUND: egen INF_EXPECT_1Y = mean(EXP_VIEW_INF_1Y)

sort ROUND YEAR MONTH STATE
quietly by ROUND YEAR MONTH STATE:  gen dup = cond(_N==1,0,_n)
drop if dup>1
drop dup
drop EXP_VIEW_INF_1Y EXP_VIEW_INF_3M

cd "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data"

merge 1:1 YEAR MONTH STATE using inflation_urban_data	//MERGING WITH ACTUAL INFLATION DATASET
keep if _merge==3
drop _merge

cd "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data"
save statewise_inf_expec_data, replace

