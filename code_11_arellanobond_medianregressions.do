//QUALITATIVE REGRESSIONS

clear

cd "/Users/swatiasnani/Desktop/inflation_220521/Results/AB_Regressions_Median"

use "/Users/swatiasnani/Desktop/inflation_220521/Final Data/median_data_final.dta", replace

xtset STATE_CODE QTR


*******************************************************************
***************************************************************
************************ ARELLANO BOND ANCHORING 3M FOOD-MEDIAN***************************************

forvalues i=0/1{

	foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_FOOD if YEAR < 2015 & FLAG_INF_FOOD_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_FOOD_PRE_FM`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_FOOD if YEAR >= 2015 & FLAG_INF_FOOD_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_FOOD_POST_FM`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_GENERAL if YEAR < 2015 & FLAG_INF_FOOD_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_GENERAL_PRE_FM`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_GENERAL if YEAR >= 2015 & FLAG_INF_FOOD_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_GENERAL_POST_FM`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_NONFOOD if YEAR < 2015 & FLAG_INF_FOOD_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_NONFOOD_PRE_FM`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_NONFOOD if YEAR >= 2015 & FLAG_INF_FOOD_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_NONFOOD_POST_FM`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

}

forvalues i=0/1{

	foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_FOOD if YEAR < 2015 & FLAG_INF_EXPECT_3M_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_FOOD_PRE_FEM`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_FOOD if YEAR >= 2015 & FLAG_INF_EXPECT_3M_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_FOOD_POST_FEM`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_GENERAL if YEAR < 2015 & FLAG_INF_EXPECT_3M_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_GENERAL_PRE_FEM`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_GENERAL if YEAR >= 2015 & FLAG_INF_EXPECT_3M_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_GENERAL_POST_FEM`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_NONFOOD if YEAR < 2015 & FLAG_INF_EXPECT_3M_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_NONFOOD_PRE_FEM`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_NONFOOD if YEAR >= 2015 & FLAG_INF_EXPECT_3M_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_NONFOOD_POST_FEM`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

}

forvalues i=0/1{

	foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_FOOD if YEAR < 2015 & FLAG_INF_GENERAL_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_FOOD_PRE_GM`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_FOOD if YEAR >= 2015 & FLAG_INF_GENERAL_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_FOOD_POST_GM`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_GENERAL if YEAR < 2015 & FLAG_INF_GENERAL_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_GENERAL_PRE_GM`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_GENERAL if YEAR >= 2015 & FLAG_INF_GENERAL_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_GENERAL_POST_GM`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_NONFOOD if YEAR < 2015 & FLAG_INF_GENERAL_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_NONFOOD_PRE_GM`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_NONFOOD if YEAR >= 2015 & FLAG_INF_GENERAL_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_NONFOOD_POST_GM`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

}

forvalues i=0/1{

	foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_FOOD if YEAR < 2015 & FLAG_INF_GENERAL_DIFF_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_FOOD_PRE_GMD`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_FOOD if YEAR >= 2015 & FLAG_INF_GENERAL_DIFF_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_FOOD_POST_GMD`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_GENERAL if YEAR < 2015 & FLAG_INF_GENERAL_DIFF_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_GENERAL_PRE_GMD`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_GENERAL if YEAR >= 2015 & FLAG_INF_GENERAL_DIFF_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_GENERAL_POST_GMD`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_NONFOOD if YEAR < 2015 & FLAG_INF_GENERAL_DIFF_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_NONFOOD_PRE_GMD`i'.rtf, replace title("Baseline Regressions") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

	foreach x in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5{
	preserve
	rename `x' AR1
	eststo: xtabond AR1 L1.INF_NONFOOD if YEAR >= 2015 & FLAG_INF_GENERAL_DIFF_ABOVE==`i', vce(robust)
	restore
	}
	esttab using AB_ANCHORING_NONFOOD_POST_GMD`i'.rtf, replace title("Post-It regime(Panel II)") cells(b(fmt(%9.2f) star) se(par)) stats( N rss, fmt(%9.2f %9.0g)labels( Observations RSS)) label style(tex) legend collabels("(1)" "(2)" "(3)" "(4)" "(5)") modelwidth(8) noconstant nogaps nonumbers nodepvars mtitles ("Decline" "No change" "Less than" "Similar to" "More than")   
	eststo dir
	eststo clear

}
