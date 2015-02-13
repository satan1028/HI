#!/bin/bash

for idir in M150120 M185150 M220185 M260220 M300260 ;do
arr=()
arrindex=-1
for i in `seq 0 461`;do
#    if [[ ! -f /scratch/xuq7/flow/pbsjoboutput/etatracknormcpt03to6/${idir}/Anaveta_Prod2_$i.root ]];then
  #  if [[ ! -f /scratch/xuq7/flow/pbsjoboutput/etatracknormcpt03to6/${idir}/AnaV_Prod_$i.root ]];then
    if [[ ! -f /scratch/xuq7/flow/pbsjoboutput/tracknormcpt03to6/${idir}/newptbin/Anav_Prod2_$i.root ]];then
        j=$((i/25))
        if [[ $arrindex == -1 || ${arr[$arrindex]} != $j ]];then
            arr=(${arr[@]} $j)
            arrindex=$((arrindex+1))
        fi
    fi
done
echo  $idir ${arr[@]}
#./submitall.sh $idir ${arr[@]}
done
