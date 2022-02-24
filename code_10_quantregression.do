//QUANTITATIVE REGRESSIONS

clear

cd "/Users/swatiasnani/Desktop/inflation_220521/Results/Qualitative_Reg"

use "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data/statewise_inf_expec_data.dta", replace

sort STATE YEAR MONTH
drop if STATE == "Punjab"|STATE == "Chhattisgarh"|STATE == "Jharkhand"

label variable INF_GENERAL "General Inflation(t-1)"

drop if YEAR<2011
gen MONTH2=MONTH
gen YEAR2=YEAR
replace MONTH2=6 if MONTH2==7
replace YEAR2=YEAR2-1 if MONTH2==1
replace MONTH2=12 if MONTH2==1
gen QTR=yq(YEAR2,quarter(mdy(MONTH2,15,YEAR2)))
format QTR %tq

encode STATE, gen(STATE_CODE)

xtset STATE_CODE QTR

preserve
rename INF_EXPECT_3M AR1
eststo: xtabond AR1 L1.INF_GENERAL if YEAR < 2015, vce(robust)
restore

preserve
rename INF_EXPECT_3M AR1
eststo: xtabond AR1 L1.INF_GENERAL if YEAR >= 2015, vce(robust)
restore

preserve
rename INF_EXPECT_1Y AR1
eststo: xtabond AR1 L1.INF_GENERAL if YEAR < 2015, vce(robust)
restore

preserve
rename INF_EXPECT_1Y AR1
eststo: xtabond AR1 L1.INF_GENERAL if YEAR >= 2015, vce(robust)
restore

esttab using AB_QUALITATIVE.tex, replace ///
	title("Baseline Regressions") ///
	cells(b(fmt(%9.2f) star) se(par)) ///
	stats( N rss, fmt(%9.0g %9.2f) ///
	labels( Observations RSS)) ///
	label ///
	style(tex) ///
	legend collabels("(1)" "(2)" "(3)" "(4)") ///
	modelwidth(8) ///
	noconstant nogaps nonumbers nodepvars ///
	mtitles ("Pre-IT" "Post-IT" "Pre-IT" "Post-IT")   

************************************************************************************************
