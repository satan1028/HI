#!/bin/bash
nJobs=180
i=0
while [ $i -le $nJobs ];
do
  # if [[  $i == 14 || $i == 43 ]];then
   let "start=i*40"
   let "end=(i+1)*40"
  echo "First = $start and last file = $end"
  export I=$i
  export FIRST=$start
  export LAST=$end
  #qsub -v I=$i,FIRST=$start,LAST=$end -N akPu3PF$i -z submitAnaTree.pbs
  sbatch -J akPu3PF$i -o AnaTree$i.out submitAnaTree.slurm
  #fi
  let "i++"
done

echo "submit all jobs!"

#echo "Copying output files to " $destination
