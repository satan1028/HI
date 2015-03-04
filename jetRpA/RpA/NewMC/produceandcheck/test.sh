#/bin/bash
TMPDIR=/tmp/${USER}
mkdir $TMPDIR

# run your macro storing the output in the tmp directory
root -l << EOF
.L PPbanalyzeRpAskimTree.C+
PPbanalyzeRpAskimTree()
EOF

# Now call vandyCp.sh to move the file to LStore
export X509_USER_CERT=/home/xuq7/.globus/usercert.pem
/usr/local/cms-stageout/vandyCp.sh ${TMPDIR}/*.root /cms/store/user/qixu/jetRpA/RpA/NewMC/

# finally, clean up your tmp directory
#rm -r $TMPDIR

