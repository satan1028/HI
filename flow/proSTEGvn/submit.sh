#!/bin/sh

mult=150
for i in {0..299}
do
qsub -v MULT=$mult,IFILE=$i proSTEG.pbs
done
