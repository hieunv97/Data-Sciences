destring loggdppercapita , replace ignore("NA")
destring healthylifeexpectancyatbirth  , replace ignore("NA")
destring freedomtomakelifechoices , replace ignore("NA")
destring generosity , replace ignore("NA")
destring perceptionsofcorruption  , replace ignore("NA")
encode country, gen(id)
xtset id year
destring socialsupport, replace ignore("NA")
summarize year lifeladder loggdppercapita socialsupport healthylifeexpectancyatbirth freedomtomakelifechoices generosity perceptionsofcorruption
regress lifeladder loggdppercapita healthylifeexpectancyatbirth freedomtomakelifechoices generosity perceptionsofcorruption socialsupport
graph box lifeladder  , marker(1, mlabel(lifeladder ))
graph box healthylifeexpectancyatbirth , marker(1, mlabel(healthylifeexpectancyatbirth ))
graph box freedomtomakelifechoices, marker(1, mlabel(freedomtomakelifechoices))
graph box loggdppercapita, marker(1, mlabel(loggdppercapit))
pwcorr loggdppercapita healthylifeexpectancyatbirth freedomtomakelifechoices generosity perceptionsofcorruption socialsupport 
regress lifeladder loggdppercapita healthylifeexpectancyatbirth freedomtomakelifechoices generosity perceptionsofcorruption socialsupport
vif
regress lifeladder loggdppercapita freedomtomakelifechoices generosity perceptionsofcorruption socialsupport
vif
xtreg lifeladder loggdppercapita healthylifeexpectancyatbirth freedomtomakelifechoices generosity perceptionsofcorruption socialsupport, fe
xttest3
xtreg lifeladder loggdppercapita healthylifeexpectancyatbirth freedomtomakelifechoices generosity perceptionsofcorruption socialsupport, fe vce(robust)
xtreg lifeladder loggdppercapita healthylifeexpectancyatbirth freedomtomakelifechoices generosity perceptionsofcorruption socialsupport, fe
estimate store fixedeff
xtreg lifeladder loggdppercapita healthylifeexpectancyatbirth freedomtomakelifechoices generosity perceptionsofcorruption socialsupport, re
estimate store randeff
hausman fixedeff randeff
xtreg lifeladder loggdppercapita healthylifeexpectancyatbirth freedomtomakelifechoices generosity perceptionsofcorruption socialsupport i.year, fe vce(robust)
test (2016.year 2017.year 2018.year)
bys region:xtreg lifeladder loggdppercapita healthylifeexpectancyatbirth freedomtomakelifechoices generosity perceptionsofcorruption socialsupport, fe
