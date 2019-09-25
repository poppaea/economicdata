clear
cd "C:\Users\hs17922\Dropbox\UoB\Economic Data\2017_2018\7_Week_7\notes\examples"
set obs 100
gen id=_n
gen u=rnormal()
expand 4
bys id: gen year=2001+_n
gen female=round(runiform()-0.3)
gen var1=u-0.02*year+rnormal(2,1)
gen var2=u+0.005*year+runiform()*10
gen var3=2+0.05*var1-0.001*var2+0.01*female+rnormal()+0.05*u
drop u
export excel using "dataset_full.xlsx", firstrow(variables) replace
gen a=round(runiform()*female-0.33)
drop if a==1
replace a=round(runiform()-0.13)
replace var1=. if a==1
replace a=round(runiform()-0.13)
replace var2=. if a==1
drop a
export excel using "dataset_missings.xlsx", firstrow(variables) replace
