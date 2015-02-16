TString algo="akPu3PF";
TString datafile="/cms/store/user/qixu/jetRpA/RpA/NewMC/DATAPPbakPu3PFskimUniv.root";
TString dataJetIDfile="/cms/store/user/qixu/jetRpA/RpA/NewMC/DATAPPbakPu3PFskimJetID.root";
TString PPbfile="/cms/store/user/qixu/jetRpA/RpA/NewMC/MCPPbakPu3PF_useskim.root";
//TString PPfile="/scratch/xuq7/RpA/TreeAna/MCPPbakPu3PF.root";

TString JetIDNameList[20]={"chMax", "chSum", "neuMax", "neuSum", "phoMax", "phoSum", "chMaxpt", "chSumpt", "neuMaxpt", "neuSumpt", "phoMaxpt", "phoSumpt","SumSumpt","SumSumrawpt","neuMaxr","chN","neuN","phoN","PPcut","PPcutTight"};
const double binbound_pt[]={ 3, 4, 5, 7, 9, 12, 15, 18, 22, 27, 33, 39, 47, 55, 64,74, 84, 97, 114, 133, 153, 174, 196, 220, 245, 272, 300, 362, 429, 692, 1000};
int Nbin_pt=sizeof(binbound_pt)/sizeof(double)-1;
double xrange_pt[2]={30+1e-4,600-1e-4};
double xrange_JetIDcut[2];
double JetIDcut[2];

TFile *fdata=TFile::Open(datafile);
TFile *fdataJetID=TFile::Open(dataJetIDfile);
//TFile *fPP=TFile::Open(PPfile);
TFile *fPPb=TFile::Open(PPbfile);
TString JetID,Unit;
