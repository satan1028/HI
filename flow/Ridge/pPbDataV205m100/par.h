const int nFileAll = 300;
const TString indir = "/lio/lfs/cms/store/user/qixu/flow/NewSTEG/pPbDataV205m100";
const TString outdir = "/scratch/xuq7/flow/ridge/pPbDataV205m100";
const double pttrigmin = 0.3;
const double pttrigmax = 6.0; 
const double etatrigmin = -2.4;
const double etatrigmax = 2.4;
const double ptassmin = 0.3;
const double ptassmax = 6.0;
const double etaassmin = -2.4;
const double etaassmax = 2.4;
const double ptbinv[]={0.3, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 6.0};
const double etabinv[]={-2.4,-2.0,-1.6,-1.2,-0.8,-0.4,0,0.4,0.8,1.2,1.6,2.0,2.4};
const int nptv= 9;
const int netav= 12;
const int trkbin[]={101,99};
const int nbin = 1;
const int nsamples=50;
const double inV2=0.0502178;
const int nMix = 10;
const double detamin = -5;
const double detamax = 5;
const int detastep = 25;
const double dphimin = -2*TMath::Pi();
const double dphimax = 2*TMath::Pi();
const int dphistep = 80;
