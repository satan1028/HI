#!/bin/sh
#cd /home/xuq7/HI/jetRpA/RpA/NewMC/JetID

for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 18 19
#for (( i=0;i<1;i++ )) 
do
export LIST=$i

root -l -b -q ptJetIDOnlyPPb_Etabin.C
#root -l -b -q ptJetIDOnlyPPb.C
#root -l -b -q overlayDataMC.C
#root -l -b -q overlayProfile.C
#root -l -q overlayJetIDcut.C

done
#exit 0

