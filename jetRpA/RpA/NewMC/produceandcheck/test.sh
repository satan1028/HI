#/bin/bash
TMPDIR=/tmp/${USER}
if [[ ! -d $TMPDIR ]] ;then
mkdir $TMPDIR
fi

# run your macro storing the output in the tmp directory

root -l << EOF
.L PPbanalyzeRpAskimTree.C+
PPbanalyzeRpAskimTree()
EOF

#root -l << EOF
#.L DataJetIDskimTree.C+
#DataJetIDskimTree()
#EOF

# Now call vandyCp.sh to move the file to LStore
export X509_USER_CERT=/home/xuq7/.globus/usercert.pem
/usr/local/cms-stageout/vandyCp.sh ${TMPDIR}/MCPPbakPu3PF_useskim_YX.root /cms/store/user/qixu/jetRpA/RpA/NewMC/MCPPbakPu3PF_useskim_YX.root
#/usr/local/cms-stageout/vandyCp.sh ${TMPDIR}/*.root /cms/store/user/qixu/jetRpA/RpA/NewMC/DATAPPbakPu3PFskimJetID.root

# finally, clean up your tmp directory
rm -r $TMPDIR

