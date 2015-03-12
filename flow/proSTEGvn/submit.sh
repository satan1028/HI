#!/bin/sh

mult=220
#for i in {0..299}
for i in {0..299}
do
    export MULT=$mult
    export IFILE=$i
#qsub -v MULT=$mult,IFILE=$i proSTEG.pbs
#sbatch -o /dev/null -J pro0_${i}_${mult} proSTEG0.slurm
sbatch -o job$i.out -J pro4_${i}_${mult} proSTEG4.slurm
done
