#include "TH2.h"
#include "TH1.h"
#include "TFile.h"
#include "TRandom3.h"
#include "TString.h"
#include "TVectorD.h"
#include "TVector3.h"
#include "TMath.h"
#include "SetupTree.h"
#include "TDirectory.h"
#include <fstream>
#include <iostream>
#include <vector>
#include "SetSeedOwn.C"
#include "par.h"

using namespace std;

class ridge{
    public:
        ridge(TString);
        ~ridge();
        TVectorD Nevent, tottrk;
        TH2F* s[nbin];
        TH2F* b[nbin];
        void beginJob();
        void calcS();
        void calcB();
        void endJob(TString);

    private:
    TString filename;
};

ridge::ridge(TString _filename){
    filename = _filename;
}

ridge::~ridge(){
    for(int ibin=0;ibin<nbin;ibin++){
    delete s[ibin];
    delete b[ibin];
    }
}

void ridge::beginJob(){
  for(int ibin=0;ibin<nbin;ibin++){
    s[ibin] = new TH2F(Form("signal_%d",ibin),Form("signal_%d",ibin),detastep,detamin,detamax,dphistep,dphimin,dphimax);
    s[ibin]->Sumw2();
    b[ibin] = new TH2F(Form("background_%d",ibin),Form("background_%d",ibin),detastep,detamin,detamax,dphistep,dphimin,dphimax);
    b[ibin]->Sumw2();
  }
  Nevent.ResizeTo(nbin); Nevent.Zero();
  tottrk.ResizeTo(nbin); tottrk.Zero();
}

void ridge::calcS(){
  treeInt *t = new treeInt(Form("%s",filename.Data()));
  t->Setup();
  Int_t nEvents = t->GetEntries();
    for(Int_t i=0;i<nEvents;i++){
        if(i%10000==0) cout<<"has processed "<<i<<" S events"<<endl;
        t->GetEntry(i);
        int ntrk = t->mult; int xbin=-1 ;
        for(int j=0;j<nbin;j++)
            if(ntrk<trkbin[j]&&ntrk>=trkbin[j+1])
                xbin=j;
            if(xbin<0 || xbin==nbin) continue;
            tottrk[xbin]+=ntrk;
        int Ntrig = 0;
        for(int imult=0;imult<t->mult;imult++){
	    if(t->eta[imult]<etatrigmin||t->eta[imult]>etatrigmax) continue;
            if(t->pt[imult]<pttrigmin||t->pt[imult]>pttrigmax) continue; //event selection
            Ntrig++;
        }
            if(Ntrig<=2) continue;
        for(int imult1=0;imult1<t->mult;imult1++){
              double eta1 = t->eta[imult1];
              double phi1 = t->phi[imult1];
	    if(eta1<etatrigmin||eta1>etatrigmax) continue;
            if(t->pt[imult1]<pttrigmin||t->pt[imult1]>pttrigmax) continue; //event selection
            for(int imult2=0;imult2<t->mult;imult2++){
                if(imult1==imult2) continue;
              double eta2 = t->eta[imult2];
              double phi2 = t->phi[imult2];
	    if(eta2<etatrigmin||eta2>etatrigmax) continue;
            if(t->pt[imult2]<pttrigmin||t->pt[imult2]>pttrigmax) continue; //event selection
              s[xbin]->Fill(eta1-eta2,phi1-phi2,1./Ntrig);
            }
        }
        Nevent[xbin]++;
    }
}


void ridge::calcB(){
  treeInt* t_trig = new treeInt(Form("%s",filename.Data()));
  t_trig->Setup();
  treeInt* t_ass = new treeInt(Form("%s",filename.Data()));
  t_ass->Setup();
  t_ass->SetupExtra();
  int j[nMix];// index[nMix];
  Int_t nEvents = t_trig->GetEntries();
    for(Int_t i=0;i<nEvents;i++){
        t_trig->GetEntry(i);
        if(i%1000==0) cout<<"has processed "<<i<<" B events"<<endl;
        int ntrk = t_trig->mult; int xbin=-1;
        for(int k=0;k<nbin;k++)
            if(ntrk<trkbin[k]&&ntrk>=trkbin[k+1])
                xbin=k;
            if(xbin<0 || xbin==nbin) continue;
            int Ntrig = 0;
        for(int imult=0;imult<t_trig->mult;imult++){
	    if(t_trig->eta[imult]<etatrigmin||t_trig->eta[imult]>etatrigmax) continue;
            if(t_trig->pt[imult]<pttrigmin||t_trig->pt[imult]>pttrigmax) continue; //event selection
            Ntrig++;
        }
        if(Ntrig<=2) continue;
            for(int ira=0;ira<nMix;ira++){
            UInt_t iniseed = SetSeedOwn();
            gRandom->SetSeed(iniseed);
            TRandom3* r = new TRandom3(0);
            j[ira] = r->Integer(nEvents);
            if(i==j[ira]) {ira--; continue;}
            }
            for(int ira=0;ira<nMix;ira++){
            t_ass->GetEntry(j[ira]);
            for(int imult_trig=0;imult_trig<t_trig->mult;imult_trig++){
                double eta_trig = t_trig->eta[imult_trig];
                double phi_trig = t_trig->phi[imult_trig];
	        if(eta_trig<etatrigmin||eta_trig>etatrigmax) continue;
                if(t_trig->pt[imult_trig]<pttrigmin||t_trig->pt[imult_trig]>pttrigmax) continue; //event selection
                for(int imult_ass=0;imult_ass<t_ass->mult;imult_ass++){
                double eta_ass = t_ass->eta[imult_ass];
                double phi_ass = t_ass->phi[imult_ass];
	        if(eta_ass<etaassmin||eta_ass>etaassmax) continue;
                if(t_ass->pt[imult_ass]<ptassmin||t_ass->pt[imult_ass]>ptassmax) continue; //event selection
                b[xbin]->Fill(eta_trig-eta_ass,phi_trig-phi_ass,1./Ntrig);
                }
           }
    }
    }
}

void ridge::endJob(TString outfile){
    TFile *fout = new TFile(Form("%s",outfile.Data()),"Recreate");
    fout->cd();
    Nevent.Write("Nevent");
    tottrk.Write("tottrk");
    for(int ibin=0;ibin<nbin;ibin++){
        s[ibin]->Write();
        b[ibin]->Write();
    }
    fout->Close();
}
    

