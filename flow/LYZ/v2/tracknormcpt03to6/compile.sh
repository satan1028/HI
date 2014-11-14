#!/bin/sh
for dir in `ls`;do
if [[ -d $dir && $dir == M* ]]; then
cd $dir
rm LYZ_C*
root -l -b<<EOF
.L LYZ.C+
EOF
cd ..
fi
done
