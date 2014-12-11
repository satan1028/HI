#!/bin/bash
nfiles=`cat filelistAll.dat | wc -l`
nfilesperjob=50
njobs=`echo "$nfiles/$nfilesperjob" | bc`
echo "split into $(($njobs+1)) jobs, $nfilesperjob files per job"

echo "Now skim" $HLTTrig for data $dataset

for i in $( seq 0 $njobs );do
#if [[ $i == 7 ]];then
begin=`echo "$i*$nfilesperjob" | bc`
end=`echo "($i+1)*$nfilesperjob" | bc`
if [[ $i == $njobs ]];then
end=$nfiles
fi
qsub -v I=$i,BEGIN=$begin,END=$end -N job$i -z jobsub.pbs
#fi
done
