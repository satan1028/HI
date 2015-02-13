#!/bin/bash
SumorProd="Prod"
Vorv="veta"

cd /home/xuq7/HI/CMSSW_5_3_20/src
eval `scramv1 runtime -sh`
cd /home/xuq7/HI/flow/LYZ/v2/etatracknormcpt03to6/

for dir in `ls`;do
if [[ -d $dir && $dir == M* ]];then
cd $dir
export SUMORPROD=$SumorProd
export DIR=$dir
if [[ $Vorv == "V" ]];then
root -l -q getResV.C
#root -l -q getResVsub.C
#root -l -q nsubvsV2.C
elif [[ $Vorv == "v" ]];then
root -l <<EOF
.L getResv.C
getResv(1)
EOF
#root -l -q getResvsub.C
else
root -l <<EOF
.L getResv.C
getResv(0)
EOF
fi
cd ..
fi
done
