#!/bin/sh

mult=150
for i in {0..299}
do
    export MULT=$mult
    export IFILE=$i
#qsub -v MULT=$mult,IFILE=$i proSTEG.pbs
sbatch -o /dev/null -J pro2_${i}_${mult} proSTEG2.slurm
#sbatch -o job$i.out proSTEG.slurm
done
