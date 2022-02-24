* //CREATING QUALITATIVE DATASET
* //CALCULATING SHARE OF HOUSEHOLDS IN EACH RESPONSE BUCKET
**To avoid error of file unspecified, run all code in the file altogether
clear

cd "/Users/swatiasnani/Desktop/inflation_220521/Raw Data"

use exp_data_hh

merge m:1 CITY using city_state_match
drop _merge

bys ROUND STATE:egen PROP_POP=count(ROUND)
//THE SHARE OF EACH INDIVUDUAL = INVERSE(NO. OF PEOPLE IN THAT CATEGORY)
replace PROP_POP=100/PROP_POP	

preserve

//DATASET CONTAINING YEAR MONTH AND STATE ALONE - BASE DATASET TO MERGE

sort ROUND YEAR MONTH STATE
quietly by ROUND YEAR MONTH STATE:  gen dup = cond(_N==1,0,_n)
drop if dup>1
drop dup
keep ROUND YEAR MONTH STATE

tempfile tmp
save `tmp'

restore

foreach var in EXP_GENERAL_3M EXP_FOOD_3M EXP_NONFOOD_3M EXP_HHDURABLES_3M EXP_HOUSING_3M EXP_SERVICES_3M EXP_GENERAL_1Y EXP_FOOD_1Y EXP_NONFOOD_1Y EXP_HHDURABLES_1Y EXP_HOUSING_1Y EXP_SERVICES_1Y{
	
	preserve
	
	* CATEGORY-WISE SUM OF SHARE OF EACH INDIVIDUAL WILL GIVE THE SHARE OF PEOPLE IN THAT CATEGORY
	bys ROUND STATE `var':egen S_`var'=sum(PROP_POP)	
	sort ROUND YEAR MONTH STATE `var'
	quietly by ROUND YEAR MONTH STATE `var':  gen dup = cond(_N==1,0,_n)
	* REMOVING INDIVIDUALS TO RETAIN STATE-LEVEL DATA
	drop if dup>1	
	drop dup
	
	gen CATEG = 1 if `var'=="Decline in price"
	replace CATEG = 2 if `var'=="No change in prices"
	replace CATEG = 3 if `var'=="Price increase less  than current rate" 
	replace CATEG = 4 if `var'=="Price increase similar  to current rate"  
	replace CATEG = 5 if `var'=="Price increase more than current rate"  
	replace CATEG = 6 if `var'=="No Idea"  
	replace CATEG = 6 if `var' =="" 

	
	keep ROUND YEAR MONTH STATE CATEG S_`var'
	* CONVERTING CATEGORY SHARES TO COLUMNS
	reshape wide S_`var', i(ROUND YEAR MONTH STATE) j(CATEG)	
	
	* MERGING WITH BASE DATASET
	merge 1:1 ROUND YEAR MONTH STATE using `tmp'	
	drop _merge
	erase `tmp'
	* REASSIGNING MERGED DATASET AS BASE DATASET
	tempfile tmp
	save `tmp'
	
	restore
}

use `tmp', replace


cd "/Users/swatiasnani/Desktop/inflation_220521/Intermediate Data"
* MERGING WITH INFLATION DATA
merge 1:1 YEAR MONTH STATE using inflation_urban_data	
keep if _merge==3
drop _merge

save expectation_share_data, replace

erase `tmp'

