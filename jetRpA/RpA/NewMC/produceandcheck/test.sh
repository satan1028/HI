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

#root -l << EOF
#.L DataskimTree.C+
#DataskimTree()
#EOF

# Now call vandyCp.sh to move the file to LStore
export X509_USER_CERT=/home/xuq7/.globus/usercert.pem
/usr/local/cms-stageout/vandyCp.sh ${TMPDIR}/MCPbPakPu3PF_useskim.root /cms/store/user/qixu/jetRpA/RpA/NewMC/MCPbPakPu3PF_useskim.root
#$/usr/local/cms-stageout/vandyCp.sh ${TMPDIR}/*.root /cms/store/user/qixu/jetRpA/RpA/NewMC/DATAPPbakPu3PFskimJetID.root
#/usr/local/cms-stageout/vandyCp.sh ${TMPDIR}/DATAPPbakPu3PFskimUniv.root /cms/store/user/qixu/jetRpA/RpA/NewMC/DATAPPbakPu3PFskimUniv.root

# finally, clean up your tmp directory
rm -r $TMPDIR

