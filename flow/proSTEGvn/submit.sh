#!/bin/sh

mult=300
for i in 226
do
    export MULT=$mult
    export IFILE=$i
#qsub -v MULT=$mult,IFILE=$i proSTEG.pbs
sbatch -o /dev/null -J pro1_${i}_${mult} proSTEG1.slurm
#sbatch -o job$i.out proSTEG.slurm
done
