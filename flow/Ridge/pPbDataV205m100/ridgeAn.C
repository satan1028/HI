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
        treeInt *t;
        Int_t nEvents;
        vector<vector<double> > pVectEta_trig;
        vector<vector<double> > pVectPhi_trig;
        vector<vector<double> > pVectEta_ass;
        vector<vector<double> > pVectPhi_ass;
        vector<int> pntrk;
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
    delete t;
    pVectEta_trig.clear();
    vector<vector<double> >().swap(pVectEta_trig);
    pVectPhi_trig.clear();
    vector<vector<double> >().swap(pVectPhi_trig);
    pVectPhi_trig.clear();
    vector<vector<double> >().swap(pVectEta_ass);
    pVectPhi_ass.clear();
    vector<vector<double> >().swap(pVectPhi_ass);
    pVectPhi_ass.clear();
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
  t = new treeInt(Form("%s",filename.Data()));
  t->Setup();
  nEvents = t->GetEntries();
    for(Int_t i=0;i<nEvents;i++){
  //      if(i%10000==0) cout<<"has processed "<<i<<"begin events"<<endl;
        t->GetEntry(i);
        vector<double> pvectEta_trig;
        vector<double> pvectPhi_trig;
        vector<double> pvectEta_ass;
        vector<double> pvectPhi_ass;
        for(int imult=0;imult<t->mult;imult++){
           // TVector3 pvector;
           // pvector.SetPtEtaPhi(t->pt[imult],t->eta[imult],t->phi[imult]);
	    if(t->eta[imult]<etatrigmin||t->eta[imult]>etatrigmax) continue;
            if(t->pt[imult]<pttrigmin||t->pt[imult]>pttrigmax) continue; //event selection
            pvectEta_trig.push_back(t->eta[imult]);
            pvectPhi_trig.push_back(t->phi[imult]);
        }
        for(int imult=0;imult<t->mult;imult++){
	    if(t->eta[imult]<etaassmin||t->eta[imult]>etaassmax) continue;
            if(t->pt[imult]<ptassmin||t->pt[imult]>ptassmax) continue; //event selection
            pvectEta_ass.push_back(t->eta[imult]);
            pvectPhi_ass.push_back(t->phi[imult]);
        }
        pntrk.push_back(t->mult);
        pVectEta_trig.push_back(pvectEta_trig);
        pVectPhi_trig.push_back(pvectPhi_trig);
        pVectEta_ass.push_back(pvectEta_ass);
        pVectPhi_ass.push_back(pvectPhi_ass);
    }
}

void ridge::calcS(){
    for(Int_t i=0;i<nEvents;i++){
        if(i%10000==0) cout<<"has processed "<<i<<"S events"<<endl;
            vector<double> pvectorEta = pVectEta_trig[i];
            vector<double> pvectorPhi = pVectPhi_trig[i];
            int Ntrig = pvectorEta.size();
            if(Ntrig<=2) continue;
        int ntrk = pntrk[i]; int xbin=-1;
        for(int j=0;j<nbin;j++)
            if(ntrk<trkbin[j]&&ntrk>=trkbin[j+1])
                xbin=j;
            if(xbin<0 || xbin==nbin) continue;
            tottrk[xbin]+=ntrk;
        for(int imult1=0;imult1<Ntrig;imult1++){
              double eta1 = pvectorEta[imult1];
              double phi1 = pvectorPhi[imult1];
            for(int imult2=0;imult2<Ntrig;imult2++){
                if(imult1==imult2) continue;
              double eta2 = pvectorEta[imult2];
              double phi2 = pvectorPhi[imult2];
              s[xbin]->Fill(eta1-eta2,phi1-phi2,1./Ntrig);
            }
        }
        Nevent[xbin]++;
    }
}


void ridge::calcB(){
    for(Int_t i=0;i<nEvents;i++){
        if(i%5000==0) cout<<"has processed "<<i<<" B events"<<endl;
            vector<double> pvectorEta_trig = pVectEta_trig[i];
            vector<double> pvectorPhi_trig = pVectPhi_trig[i];
            int Ntrig = pvectorEta_trig.size();
            if(Ntrig<=2) continue;
        int ntrk = pntrk[i]; int xbin=-1;
        for(int k=0;k<nbin;k++)
            if(ntrk<trkbin[k]&&ntrk>=trkbin[k+1])
                xbin=k;
            if(xbin<0 || xbin==nbin) continue;
            vector<vector<double> > pvectorEta_ass(0);
            vector<vector<double> > pvectorPhi_ass(0);
            for(int ira=0;ira<nMix;ira++){
            UInt_t iniseed = SetSeedOwn();
            gRandom->SetSeed(iniseed);
            TRandom3* r = new TRandom3(0);
            int j = r->Integer(nEvents);
            if(i==j){ira--; continue;}
            pvectorEta_ass.push_back(pVectEta_ass[j]);
            pvectorPhi_ass.push_back(pVectPhi_ass[j]);
            }
            for(int imult_trig=0;imult_trig<Ntrig;imult_trig++){
                double eta_trig = pvectorEta_trig[imult_trig];
                double phi_trig = pvectorPhi_trig[imult_trig];
                for(int ira=0;ira<nMix;ira++){
                    int Nass = pvectorEta_ass[ira].size();
                for(int imult_ass=0;imult_ass<Nass;imult_ass++){
                double eta_ass = pvectorEta_ass[ira][imult_ass];
                double phi_ass = pvectorPhi_ass[ira][imult_ass];
                b[xbin]->Fill(eta_trig-eta_ass,phi_trig-phi_ass,1.);
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
    

