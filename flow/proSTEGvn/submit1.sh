#!/bin/sh

mult=50
for i in {0..299}
do
    export MULT=$mult
    export IFILE=$i
#qsub -v MULT=$mult,IFILE=$i proSTEG.pbs
sbatch -o /dev/null proSTEG1.slurm
done