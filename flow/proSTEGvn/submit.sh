#!/bin/sh

mult=150
for i in {0..0}
do
qsub -v MULT=$mult,IFILE=$i proSTEG.sh
done
