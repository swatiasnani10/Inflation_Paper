clear

cd "/Users/swatiasnani/Desktop/inflation_220521/Final Data"

use "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data/statewise_inf_expec_data.dta", replace

drop if STATE == "Punjab"|STATE == "Chhattisgarh"|STATE == "Jharkhand"
keep ROUND STATE INF_EXPECT_3M INF_EXPECT_1Y

merge 1:1 ROUND STATE using anchoring_spillover_final
drop _merge

gen FLAG_PRE = 1 if YEAR2 < 2015
replace FLAG_PRE = 0 if YEAR2 >= 2015

*******************************************************************

foreach var in INF_FOOD INF_GENERAL INF_EXPECT_3M{
	
	preserve

	bys STATE FLAG_PRE: egen MEAN_`var'_PRE = mean(`var')

	quietly by STATE FLAG_PRE:  gen dup = cond(_N==1,0,_n)
	drop if dup>1
	drop dup

	keep if FLAG_PRE==1
	keep STATE MEAN_`var'_PRE

	egen MEDIAN_`var'_PRE=median(MEAN_`var'_PRE)
	gen FLAG_`var'_ABOVE=1 if MEDIAN_`var'_PRE>MEAN_`var'_PRE
	replace FLAG_`var'_ABOVE=0 if MEDIAN_`var'_PRE<=MEAN_`var'_PRE

	save median_tmp, replace

	restore

	merge m:m STATE using median_tmp
	drop _merge
	
	erase median_tmp.dta
}

******************************************************************

preserve

bys STATE FLAG_PRE: egen MEAN_INF_GENERAL = mean(INF_GENERAL)

quietly by STATE FLAG_PRE:  gen dup = cond(_N==1,0,_n)
drop if dup>1
drop dup

keep STATE FLAG_PRE MEAN_INF_GENERAL

reshape wide MEAN_INF_GENERAL, i(STATE) j(FLAG_PRE)

gen DIFF_INF_GENERAL=MEAN_INF_GENERAL1-MEAN_INF_GENERAL0
egen MEDIAN_INF_GENERAL_DIFF=median(DIFF_INF_GENERAL)
gen FLAG_INF_GENERAL_DIFF_ABOVE=1 if MEDIAN_INF_GENERAL_DIFF>DIFF_INF_GENERAL
replace FLAG_INF_GENERAL_DIFF_ABOVE=0 if MEDIAN_INF_GENERAL_DIFF<=DIFF_INF_GENERAL

keep STATE DIFF_INF_GENERAL MEDIAN_INF_GENERAL_DIFF FLAG_INF_GENERAL_DIFF_ABOVE
save median_tmp, replace

restore

merge m:m STATE using median_tmp
drop _merge

erase median_tmp.dta

******************************************************************
save "/Users/swatiasnani/Desktop/inflation_220521/Final Data/median_data_final.dta", replace








