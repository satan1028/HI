#!/bin/bash
SumorProd="Prod"
Vorv="v"

cd /home/xuq7/HI/CMSSW_5_3_20/src
eval `scramv1 runtime -sh`
cd /home/xuq7/HI/flow/LYZ/v2/tracknormcpt03to6/

for dir in `ls`;do
if [[ -d $dir && $dir == M* ]];then
cd $dir
export SUMORPROD=$SumorProd
export DIR=$dir
if [[ $Vorv == "V" ]];then
root -l <<EOF
.L getResVsub.C
getResVsub()
EOF
#root -l -q getResVsub.C
#root -l -q nsubvsV2.C
fi
if [[ $Vorv == "v" && $dir != M300220 ]];then
root -l <<EOF
.L getResvsub.C
getResvsub(1)
EOF
fi
#root -l -q getResvsub.C
if [[ $Vorv == "veta" ]];then
root -l <<EOF
.L getResvsub.C
getResvsub(0)
EOF
fi
cd ..
fi
done
