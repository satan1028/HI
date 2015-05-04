#!/bin/sh

mult=120
for i in {0..299}
do
    export MULT=$mult
    export IFILE=$i
#qsub -v MULT=$mult,IFILE=$i proSTEG.pbs
#sbatch -o /dev/null -J pro0_${i}_${mult} proSTEG0.slurm
sbatch -o job2_${i}_${mult}.out -J pro2_${i}_${mult} proSTEG2.slurm
done
