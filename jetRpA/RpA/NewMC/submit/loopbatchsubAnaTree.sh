#!/bin/bash
nJobs=0
i=0
while [ $i -le $nJobs ];
do 
   let "start=i*10"
   let "end=(i+1)*10"
  echo "First = $start and last file = $end"
  qsub -v I=$i,FIRST=$start,LAST=$end -N akPu3PF$i -z submitAnaTree.pbs
  let "i++"
done

echo "submit all jobs!"

#echo "Copying output files to " $destination
