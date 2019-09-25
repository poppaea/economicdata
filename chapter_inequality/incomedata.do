clear
set obs 10000
gen householdid=_n
gen adults=round(rnormal(1.5,0.75))
gen children=round(rnormal(1.5,1))

gen householdincome1=rnormal(80000+80000*0.01*(runiform()*adults-runiform()*children),10000)
gen householdincome2=exp(rnormal(10+0.1*(runiform()*adults-runiform()*children),1))*2
replace children=0 if children<0
replace adults=1 if adults<1
sum
reg householdincome2 adults children

export excel using "\\ads.bris.ac.uk\filestore\myfiles\Staff11\hs17922\Desktop\incomedata.xls"
