#!/bin/sh

mult=65
for i in {194..194}
do
    export MULT=$mult
    export IFILE=$i
#qsub -v MULT=$mult,IFILE=$i proSTEG.pbs
sbatch -o /dev/null -J pro_${i}_${mult} proSTEG.slurm
#sbatch -o job$i.out proSTEG.slurm
done
