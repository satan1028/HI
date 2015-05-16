#!/bin/bash

for idir in M150120 M185150 M220185 M260220 M300260 M300220;do
arr=()
arrindex=-1
for i in `seq 0 462`;do
#    if [[ ! -f /scratch/xuq7/flow/pbsjoboutput/tracknormcpt03to6/${idir}/Anaveta_Prod2_$i.root ]];then
    if [[ ! -f /scratch/xuq7/flow/pbsjoboutput/tracknormcpt03to6/${idir}/Anaveta1_Prod2_$i.root ]];then
  #  if [[ ! -f /scratch/xuq7/flow/pbsjoboutput/tracknormcpt03to6/${idir}/Anaveta_Prod2_$i.root ]];then
        j=$((i/25))
        if [[ $arrindex == -1 || ${arr[$arrindex]} != $j ]];then
            arr=(${arr[@]} $j)
            arrindex=$((arrindex+1))
        fi
    fi
done
echo  $idir ${arr[@]}
if [[ $idir == M150120 ]];then
   ./submitall.sh $idir 6
fi
done
