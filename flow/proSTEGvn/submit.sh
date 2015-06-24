#!/bin/sh

mult=150
for i in 110
do
    export MULT=$mult
    export IFILE=$i
#qsub -v MULT=$mult,IFILE=$i proSTEG.pbs
#sbatch -o /dev/null -J pro0_${i}_${mult} proSTEG0.slurm
sbatch -o job5_${i}_${mult}.out -J pro_${i}_${mult} proSTEG.slurm
done
