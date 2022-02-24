
clear

cd "/Users/swatiasnani/Desktop/inflation_220521/Results/Fixed Effects Regression"

use "/Users/swatiasnani/Desktop/inflation_220521/Final Data/anchoring_spillover_final.dta", replace

xtset STATE_CODE QTR

************************ ANCHORING 3M ***************************************

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_FOOD if YEAR < 2015, fe
restore
}
esttab using ANCHORING_FOOD_PRE.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_FOOD if YEAR >= 2015, fe
restore
}
esttab using ANCHORING_FOOD_POST.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")
eststo clear

foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_GENERAL if YEAR < 2015, fe
restore
}
esttab using ANCHORING_GENERAL_PRE.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_GENERAL if YEAR >= 2015, fe
restore
}
esttab using ANCHORING_GENERAL_POST.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_NONFOOD if YEAR < 2015, fe
restore
}
esttab using ANCHORING_NONFOOD_PRE.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_NONFOOD if YEAR >= 2015, fe
restore
}
esttab using ANCHORING_NONFOOD_POST.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")
eststo clear

***************************************************************

************************ SPILLOVER 3M ***************************************

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, fe
restore
}
esttab using SPILLOVER_FOOD_PRE.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, fe
restore
}
esttab using SPILLOVER_FOOD_POST.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_NONFOOD L1.INF_FOOD if YEAR < 2015, fe
restore
}
esttab using SPILLOVER_NONFOOD_PRE.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_NONFOOD L1.INF_FOOD if YEAR >= 2015, fe
restore
}
esttab using SPILLOVER_NONFOOD_POST.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")
eststo clear

***************************************************************

************************ ANCHORING 1Y ***************************************

foreach x in S_EXP_FOOD_1Y1 S_EXP_FOOD_1Y2 S_EXP_FOOD_1Y3 S_EXP_FOOD_1Y4 S_EXP_FOOD_1Y5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_FOOD if YEAR < 2015, fe
restore
}
esttab using ANCHORING_FOOD_PRE_1Y.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_FOOD_1Y1 S_EXP_FOOD_1Y2 S_EXP_FOOD_1Y3 S_EXP_FOOD_1Y4 S_EXP_FOOD_1Y5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_FOOD if YEAR >= 2015, fe
restore
}
esttab using ANCHORING_FOOD_POST_1Y.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")
eststo clear


***************************************************************

************************ SPILLOVER 1Y ***************************************


foreach x in S_EXP_NONFOOD_1Y1 S_EXP_NONFOOD_1Y2 S_EXP_NONFOOD_1Y3 S_EXP_NONFOOD_1Y4 S_EXP_NONFOOD_1Y5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_NONFOOD L1.INF_FOOD if YEAR < 2015, fe
restore
}
esttab using SPILLOVER_NONFOOD_PRE_1Y.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_1Y1 S_EXP_NONFOOD_1Y2 S_EXP_NONFOOD_1Y3 S_EXP_NONFOOD_1Y4 S_EXP_NONFOOD_1Y5{
preserve
gen AR1=L1.`x'
eststo: xtreg `x' AR1 L1.INF_NONFOOD L1.INF_FOOD if YEAR >= 2015, fe
restore
}
esttab using SPILLOVER_NONFOOD_POST_1Y.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")
eststo clear

***************************************************************
