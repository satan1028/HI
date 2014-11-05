#!/bin/sh
nfiles=300
nfileperjob=10
njobs=`echo "$nfiles/$nfileperjob" | bc`
echo "split into $njobs jobs, $nfileperjob files per job"
for i in `seq 1 $njobs`
do
if [[ $i -lt 25 ]];then
#echo $i
start=`echo "($i-1)*$nfileperjob" | bc`
end=`echo "$i*$nfileperjob" | bc`
qsub -v I=$i,START=$start,END=$end -N jobsub$i -z jobsub.sh
fi
done
