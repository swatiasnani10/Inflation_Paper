//QUALITATIVE REGRESSIONS
//Note:22.06.21::Use anchoring_spillover_final.dta from desktop folder 'Arellano_Bond_Feb2021' folder.
clear

cd "/Users/swatiasnani/Desktop/inflation_220521/Results/AB_Regressions_12States"
use "/Users/swatiasnani/Desktop/inflation_220521/Final Data/anchoring_spillover_final.dta", replace

xtset STATE_CODE QTR

*******************************************************************
***************************************************************
************************ ARELLANO BOND ANCHORING 3M ***************************************

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD if YEAR < 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_FOOD_PRE_01.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_FOOD_POST.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_GENERAL if YEAR < 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_GENERAL_PRE.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_GENERAL if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_GENERAL_POST.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_NONFOOD if YEAR < 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_NONFOOD_PRE.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_NONFOOD_POST.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

***************************************************************
************************ ARELLANO BOND SPILLOVER 3M ***************************************

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_FOOD_PRE.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_FOOD_POST.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_NONFOOD_PRE.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_NONFOOD_POST.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

***************************************************************
************************ ARELLANO BOND ANCHORING 1Y ***************************************

foreach x in S_EXP_FOOD_1Y1 S_EXP_FOOD_1Y2 S_EXP_FOOD_1Y3 S_EXP_FOOD_1Y4 S_EXP_FOOD_1Y5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD if YEAR < 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_FOOD_PRE_1Y.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_FOOD_1Y1 S_EXP_FOOD_1Y2 S_EXP_FOOD_1Y3 S_EXP_FOOD_1Y4 S_EXP_FOOD_1Y5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_FOOD_POST_1Y.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_GENERAL_1Y1 S_EXP_GENERAL_1Y2 S_EXP_GENERAL_1Y3 S_EXP_GENERAL_1Y4 S_EXP_GENERAL_1Y5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_GENERAL if YEAR < 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_GENERAL_PRE_1Y.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_GENERAL_1Y1 S_EXP_GENERAL_1Y2 S_EXP_GENERAL_1Y3 S_EXP_GENERAL_1Y4 S_EXP_GENERAL_1Y5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_GENERAL if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_GENERAL_POST_1Y.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_NONFOOD_1Y1 S_EXP_NONFOOD_1Y2 S_EXP_NONFOOD_1Y3 S_EXP_NONFOOD_1Y4 S_EXP_NONFOOD_1Y5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_NONFOOD if YEAR < 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_NONFOOD_PRE_1Y.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_NONFOOD_1Y1 S_EXP_NONFOOD_1Y2 S_EXP_NONFOOD_1Y3 S_EXP_NONFOOD_1Y4 S_EXP_NONFOOD_1Y5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_ANCHORING_NONFOOD_POST_1Y.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

***************************************************************
************************ ARELLANO BOND SPILLOVER 1Y ***************************************

foreach x in S_EXP_FOOD_1Y1 S_EXP_FOOD_1Y2 S_EXP_FOOD_1Y3 S_EXP_FOOD_1Y4 S_EXP_FOOD_1Y5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_FOOD_PRE_1Y.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_FOOD_1Y1 S_EXP_FOOD_1Y2 S_EXP_FOOD_1Y3 S_EXP_FOOD_1Y4 S_EXP_FOOD_1Y5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_FOOD_POST_1Y.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_1Y1 S_EXP_NONFOOD_1Y2 S_EXP_NONFOOD_1Y3 S_EXP_NONFOOD_1Y4 S_EXP_NONFOOD_1Y5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_NONFOOD_PRE_1Y.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_1Y1 S_EXP_NONFOOD_1Y2 S_EXP_NONFOOD_1Y3 S_EXP_NONFOOD_1Y4 S_EXP_NONFOOD_1Y5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_NONFOOD_POST_1Y.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

***************************************************************



***************************************************************
************************ ARELLANO BOND ANCHORING GROUPED 3M ***************************************

foreach x in S_EXP_FOOD_3M_GP1 S_EXP_FOOD_3M_GP2{
eststo: xtabond `x' L1.INF_FOOD if YEAR < 2015, vce(robust)
}
esttab using AB_ANCHORING_FOOD_PRE_3M_GP.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_FOOD_3M_GP1 S_EXP_FOOD_3M_GP2{
eststo: xtabond `x' L1.INF_FOOD if YEAR >= 2015, vce(robust)
}
esttab using AB_ANCHORING_FOOD_POST_3M_GP.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_GENERAL_3M_GP1 S_EXP_GENERAL_3M_GP2{
eststo: xtabond `x' L1.INF_GENERAL if YEAR < 2015, vce(robust)
}
esttab using AB_ANCHORING_GENERAL_PRE_3M_GP.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_GENERAL_3M_GP1 S_EXP_GENERAL_3M_GP2{
eststo: xtabond `x' L1.INF_GENERAL if YEAR >= 2015, vce(robust)
}
esttab using AB_ANCHORING_GENERAL_POST_3M_GP.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_NONFOOD_3M_GP1 S_EXP_NONFOOD_3M_GP2{
eststo: xtabond `x' L1.INF_NONFOOD if YEAR < 2015, vce(robust)
}
esttab using AB_ANCHORING_NONFOOD_PRE_3M_GP.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_NONFOOD_3M_GP1 S_EXP_NONFOOD_3M_GP2{
eststo: xtabond `x' L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
}
esttab using AB_ANCHORING_NONFOOD_POST_3M_GP.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

***************************************************************
************************ ARELLANO BOND SPILLOVER GROUPED 3M ***************************************

foreach x in S_EXP_FOOD_3M_GP1 S_EXP_FOOD_3M_GP2{
eststo: xtabond `x' L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
}
esttab using AB_SPILLOVER_FOOD_PRE_3M_GP.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_FOOD_3M_GP1 S_EXP_FOOD_3M_GP2{
eststo: xtabond `x' L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
}
esttab using AB_SPILLOVER_FOOD_POST_3M_GP.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_3M_GP1 S_EXP_NONFOOD_3M_GP2{
eststo: xtabond `x' L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
}
esttab using AB_SPILLOVER_NONFOOD_PRE_3M_GP.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_3M_GP1 S_EXP_NONFOOD_3M_GP2{
eststo: xtabond `x' L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
}
esttab using AB_SPILLOVER_NONFOOD_POST_3M_GP.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

***************************************************************


************************ ARELLANO BOND ANCHORING 3M CURR QTR***************************************

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
eststo: xtabond `x' L1.INF_FOOD if YEAR < 2015, vce(robust)
}
esttab using AB_ANCHORING_FOOD_PRE_CURRQTR.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
eststo: xtabond `x' L1.INF_FOOD if YEAR >= 2015, vce(robust)
}
esttab using AB_ANCHORING_FOOD_POST_CURRQTR.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
eststo: xtabond `x' L1.INF_GENERAL if YEAR < 2015, vce(robust)
}
esttab using AB_ANCHORING_GENERAL_PRE_CURRQTR.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
eststo: xtabond `x' L1.INF_GENERAL if YEAR >= 2015, vce(robust)
}
esttab using AB_ANCHORING_GENERAL_POST_CURRQTR.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
eststo: xtabond `x' L1.INF_NONFOOD if YEAR < 2015, vce(robust)
}
esttab using AB_ANCHORING_NONFOOD_PRE_CURRQTR.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
eststo: xtabond `x' L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
}
esttab using AB_ANCHORING_NONFOOD_POST_CURRQTR.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

***************************************************************
************************ ARELLANO BOND SPILLOVER 3M CURR QTR***************************************

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
eststo: xtabond `x' L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
}
esttab using AB_SPILLOVER_FOOD_PRE_CURRQTR.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
eststo: xtabond `x' L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
}
esttab using AB_SPILLOVER_FOOD_POST_CURRQTR.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
eststo: xtabond `x' L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
}
esttab using AB_SPILLOVER_NONFOOD_PRE_CURRQTR.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
eststo: xtabond `x' L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
}
esttab using AB_SPILLOVER_NONFOOD_POST_CURRQTR.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

***************************************************************
*************************DUMMY VARIABLE**************************************
gen D_POST=1
replace D_POST=0 if YEAR<2015

gen L1_INF_GENERAL=L1.INF_GENERAL
gen INT_INF_GENERAL=D_POST*L1_INF_GENERAL

gen L1_INF_FOOD=L1.INF_FOOD
gen INT_INF_FOOD=D_POST*L1_INF_FOOD

gen L1_INF_NONFOOD=L1.INF_NONFOOD
gen INT_INF_NONFOOD=D_POST*L1_INF_NONFOOD


foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
preserve
rename `x' AR1
gen L1_AR1=L1.AR1
gen INT_AR1=D_POST*L1_AR1
eststo: xtabond AR1 L1_INF_FOOD INT_AR1 INT_INF_FOOD, vce(robust)
restore
}
esttab using AB_ANCHORING_FOOD_INTERACTION.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
preserve
rename `x' AR1
gen L1_AR1=L1.AR1
gen INT_AR1=D_POST*L1_AR1
eststo: xtabond AR1 L1_INF_GENERAL INT_AR1 INT_INF_GENERAL, vce(robust)
restore
}
esttab using AB_ANCHORING_GENERAL_INTERACTION.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear

foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
preserve
rename `x' AR1
gen L1_AR1=L1.AR1
gen INT_AR1=D_POST*L1_AR1
eststo: xtabond AR1 L1_INF_NONFOOD INT_AR1 INT_INF_NONFOOD, vce(robust)
restore
}
esttab using AB_ANCHORING_NONFOOD_INTERACTION.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo dir
eststo clear


***************************************************************
*************************ARELLANO BOND SPILLOVER 3M CURR QTR**************************************

foreach x in S_EXP_HHDURABLES_3M1 S_EXP_HHDURABLES_3M2 S_EXP_HHDURABLES_3M3 S_EXP_HHDURABLES_3M4 S_EXP_HHDURABLES_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_HHDURABLES_PRE.tex, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.0g %9.2f)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_HHDURABLES_3M1 S_EXP_HHDURABLES_3M2 S_EXP_HHDURABLES_3M3 S_EXP_HHDURABLES_3M4 S_EXP_HHDURABLES_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_HHDURABLES_POST.tex, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.0g %9.2f)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_HOUSING_3M1 S_EXP_HOUSING_3M2 S_EXP_HOUSING_3M3 S_EXP_HOUSING_3M4 S_EXP_HOUSING_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_HOUSE L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_HOUSING_PRE.tex, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.0g %9.2f)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

foreach x in S_EXP_HOUSING_3M1 S_EXP_HOUSING_3M2 S_EXP_HOUSING_3M3 S_EXP_HOUSING_3M4 S_EXP_HOUSING_3M5{
preserve
rename `x' AR1
eststo: xtabond AR1 L1.INF_HOUSE L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
restore
}
esttab using AB_SPILLOVER_HOUSING_POST.tex, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.0g %9.2f)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
eststo clear

***************************************************************
**SUR regressions: corrected version: 22.06.21***

**	Upper bucket consists of the Similar to and More than category expectations
gen Sh_EP3_Gen_High =  S_EXP_GENERAL_3M4 + S_EXP_GENERAL_3M5
gen Sh_EP3_Food_High = S_EXP_FOOD_3M4 + S_EXP_FOOD_3M5
gen Sh_EP3_Nonfood_High = S_EXP_NONFOOD_3M4 + S_EXP_NONFOOD_3M5

**SUR regressions***
eststo clear
eststo: xtabond S_EXP_FOOD_3M_GP2 L1.S_EXP_FOOD_3M_GP2 L1.INF_FOOD if YEAR < 2015, vce(robust)
eststo: xtabond S_EXP_FOOD_3M_GP2 L1.S_EXP_FOOD_3M_GP2 L1.INF_NONFOOD L1.INF_FOOD if YEAR < 2015, vce(robust)
eststo: xtabond S_EXP_NONFOOD_3M_GP2 L1.S_EXP_NONFOOD_3M_GP2 L1.INF_NONFOOD if YEAR < 2015, vce(robust)
eststo: xtabond S_EXP_NONFOOD_3M_GP2 L1.S_EXP_NONFOOD_3M_GP2 L1.INF_FOOD L1.INF_NONFOOD if YEAR < 2015, vce(robust)
eststo: xtabond S_EXP_GENERAL_3M_GP2 L1.S_EXP_GENERAL_3M_GP2 L1.INF_GENERAL if YEAR < 2015, vce(robust)

esttab using SUR_Pre.tex, replace title(" SUR PRE-IT") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Food Group " "Food Group" "Non-Food" "Non-food group" "General group")
eststo clear

eststo: xtabond Sh_EP3_Food_High L1.Sh_EP3_Food_High L1.INF_FOOD if YEAR >= 2015, vce(robust)
eststo: xtabond Sh_EP3_Food_High L1.Sh_EP3_Food_High L1.INF_NONFOOD L1.INF_FOOD if YEAR >= 2015, vce(robust)
eststo: xtabond Sh_EP3_Nonfood_High L1.Sh_EP3_Nonfood_High L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
eststo: xtabond Sh_EP3_Nonfood_High L1.Sh_EP3_Nonfood_High L1.INF_FOOD L1.INF_NONFOOD if YEAR >= 2015, vce(robust)
eststo: xtabond Sh_EP3_Gen_High L1.Sh_EP3_Gen_High L1.INF_GENERAL if YEAR >= 2015, vce(robust)

esttab using SUR_Post.tex, replace title(" SUR POST-IT") cells(b(fmt(%9.2f) star) se(par)) stats( N r2, fmt(%9.2f %9.0g)labels( Observations R-squared)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) nogaps nonumbers nodepvars mtitles ("Food Group " "Food Group" "Non-Food" "Non-food group" "General group")
eststo clear


