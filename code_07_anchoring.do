//CLEANING AND CREATING FINAL DATASET FOR REGRESSION

clear
cd "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data"
use expectation_share_data, replace

sort STATE YEAR MONTH
drop if STATE == "Punjab"|STATE == "Chhattisgarh"|STATE == "Jharkhand"

//GROUPING INTO HIGH AND LOW INFLATION EXPECTATION BUCKETS

egen S_EXP_FOOD_3M_GP1=rowtotal(S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3)
egen S_EXP_FOOD_3M_GP2=rowtotal(S_EXP_FOOD_3M4 S_EXP_FOOD_3M5)
egen S_EXP_FOOD_1Y_GP1=rowtotal(S_EXP_FOOD_1Y1 S_EXP_FOOD_1Y2 S_EXP_FOOD_1Y3 )
egen S_EXP_FOOD_1Y_GP2=rowtotal(S_EXP_FOOD_1Y4 S_EXP_FOOD_1Y5)

egen S_EXP_NONFOOD_3M_GP1=rowtotal(S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3)
egen S_EXP_NONFOOD_3M_GP2=rowtotal(S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5)
egen S_EXP_NONFOOD_1Y_GP1=rowtotal(S_EXP_NONFOOD_1Y1 S_EXP_NONFOOD_1Y2 S_EXP_NONFOOD_1Y3)
egen S_EXP_NONFOOD_1Y_GP2=rowtotal(S_EXP_NONFOOD_1Y4 S_EXP_NONFOOD_1Y5)

egen S_EXP_GENERAL_3M_GP1=rowtotal(S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3)
egen S_EXP_GENERAL_3M_GP2=rowtotal( S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5)
egen S_EXP_GENERAL_1Y_GP1=rowtotal(S_EXP_GENERAL_1Y1 S_EXP_GENERAL_1Y2 S_EXP_GENERAL_1Y3)
egen S_EXP_GENERAL_1Y_GP2=rowtotal( S_EXP_GENERAL_1Y4 S_EXP_GENERAL_1Y5)

label variable INF_FOOD "Food Inflation(t-1)"
label variable INF_GENERAL "General Inflation(t-1)"
label variable INF_NONFOOD "Non-Food Inflation(t-1)"

foreach var in S_EXP_GENERAL_3M1 S_EXP_GENERAL_3M2 S_EXP_GENERAL_3M3 S_EXP_GENERAL_3M4 S_EXP_GENERAL_3M5 S_EXP_GENERAL_3M6 {
replace `var'=0 if `var'==.
}

foreach var in S_EXP_FOOD_3M1 S_EXP_FOOD_3M2 S_EXP_FOOD_3M3 S_EXP_FOOD_3M4 S_EXP_FOOD_3M5 {
replace `var'=0 if `var'==.
}

foreach var in S_EXP_NONFOOD_3M1 S_EXP_NONFOOD_3M2 S_EXP_NONFOOD_3M3 S_EXP_NONFOOD_3M4 S_EXP_NONFOOD_3M5 S_EXP_NONFOOD_3M6 {
replace `var'=0 if `var'==.
} 

foreach var in S_EXP_HHDURABLES_3M1 S_EXP_HHDURABLES_3M2 S_EXP_HHDURABLES_3M3 S_EXP_HHDURABLES_3M4 S_EXP_HHDURABLES_3M5 S_EXP_HHDURABLES_3M6 {
replace `var'=0 if `var'==.
}  

foreach var in S_EXP_HOUSING_3M1 S_EXP_HOUSING_3M2 S_EXP_HOUSING_3M3 S_EXP_HOUSING_3M4 S_EXP_HOUSING_3M5 {
replace `var'=0 if `var'==.
}  

foreach var in S_EXP_SERVICES_3M1 S_EXP_SERVICES_3M2 S_EXP_SERVICES_3M3 S_EXP_SERVICES_3M4 S_EXP_SERVICES_3M5 S_EXP_SERVICES_3M6 {
replace `var'=0 if `var'==.
}  
  
foreach var in S_EXP_GENERAL_1Y1 S_EXP_GENERAL_1Y2 S_EXP_GENERAL_1Y3 S_EXP_GENERAL_1Y4 S_EXP_GENERAL_1Y5 S_EXP_GENERAL_1Y6 {
replace `var'=0 if `var'==.
}  

foreach var in S_EXP_FOOD_1Y1 S_EXP_FOOD_1Y2 S_EXP_FOOD_1Y3 S_EXP_FOOD_1Y4 S_EXP_FOOD_1Y5 S_EXP_FOOD_1Y6 {
replace `var'=0 if `var'==.
}  

foreach var in S_EXP_NONFOOD_1Y1 S_EXP_NONFOOD_1Y2 S_EXP_NONFOOD_1Y3 S_EXP_NONFOOD_1Y4 S_EXP_NONFOOD_1Y5 S_EXP_NONFOOD_1Y6 {
replace `var'=0 if `var'==.
}  

foreach var in S_EXP_HHDURABLES_1Y1 S_EXP_HHDURABLES_1Y2 S_EXP_HHDURABLES_1Y3 S_EXP_HHDURABLES_1Y4 S_EXP_HHDURABLES_1Y5 S_EXP_HHDURABLES_1Y6 {
replace `var'=0 if `var'==.
}  

foreach var in S_EXP_HOUSING_1Y1 S_EXP_HOUSING_1Y2 S_EXP_HOUSING_1Y3 S_EXP_HOUSING_1Y4 S_EXP_HOUSING_1Y5 S_EXP_HOUSING_1Y6 {
replace `var'=0 if `var'==.
}  

foreach var in S_EXP_SERVICES_1Y1 S_EXP_SERVICES_1Y2 S_EXP_SERVICES_1Y3 S_EXP_SERVICES_1Y4 S_EXP_SERVICES_1Y5 S_EXP_SERVICES_1Y6 {
replace `var'=0 if `var'==.
}   


drop if YEAR<2011
gen MONTH2=MONTH
gen YEAR2=YEAR
replace MONTH2=6 if MONTH2==7
replace YEAR2=YEAR2-1 if MONTH2==1
replace MONTH2=12 if MONTH2==1
gen QTR=yq(YEAR2,quarter(mdy(MONTH2,15,YEAR2)))
format QTR %tq

encode STATE, gen(STATE_CODE)

cd "/Users/swatiasnani/Desktop/inflation_220521/Final Data"
save anchoring_spillover_final, replace
