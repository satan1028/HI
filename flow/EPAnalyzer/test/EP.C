#include "TComplex.h"
#include "TString.h"
#include "TVector.h"
#include "TDirectory.h"
#include "TTree.h"
#include "TFile.h"
#include "TMath.h"
#include "TH1.h"
#include <fstream>
#include <iostream>
#include "par.h"

//
// class declaration
//

class EP {
   public:
      EP(TString);
      ~EP();

	void beginJob() ;
	void calcEP();
     	void endJobEP(TString) ;

      // ----------member data ---------------------------
   private:

	TString filename;
	TVectorD Nevent, totmultall;
	TVectorD EPR[nbin];
        TVectorD v2obs[nbin][neta];
	TVectorD totmult[nbin];
	TVectorD totpt[nbin];
	TH1D* hEPPhip[nbin][neta];
	TH1D* hEPPhim[nbin][neta];

};

//
// constants, enums and typedefs


EP::EP(TString filenamev)
{	
	filename = filenamev;
}

EP::~EP(){
}

// ------------ method called for each event  ------------
void
EP::calcEP()
{
   using namespace std;
	int mult;
        Float_t phi[10000], eta[10000], pt[10000];
        TFile *infile = TFile::Open(filename);
        TTree* t = (TTree*)infile->Get("tree");
        t->SetBranchAddress("n",&mult);
        t->SetBranchAddress("ptg",pt);
        t->SetBranchAddress("phig",phi);
        t->SetBranchAddress("etag",eta);
        int nevent = t->GetEntries();
        for(int ievt=0; ievt<nevent; ievt++){
		t->GetEntry(ievt);
		double Sumsinp[neta], Sumcosp[neta];
		double Sumsinm[neta], Sumcosm[neta];
		for(int ieta=0;ieta<neta;ieta++){
			Sumsinp[ieta]=0;Sumcosp[ieta]=0;
			Sumsinm[ieta]=0;Sumcosm[ieta]=0;	
		}
		double EPPhip[neta], EPPhim[neta];
		int nTracks = mult;	
		int xbin=0;
		for(int j=0;j<nbin;j++)
        	      if(nTracks<trkbin[j]&&nTracks>=trkbin[j+1])
                   	 xbin=j;
        	if(xbin<0 || xbin==nbin) continue;
		for(int imult=0;imult<mult;imult++){
			if(eta[imult]<-2.40||eta[imult]>2.40) continue;
                        if(pt[imult]<ptmin||pt[imult]>ptmax) continue; //event selection

			for(int ieta=0;ieta<neta;ieta++){
			if(eta[imult]>etap[ieta]){
				Sumsinp[ieta]+=TMath::Sin(nn*phi[imult]);
				Sumcosp[ieta]+=TMath::Cos(nn*phi[imult]);
			}
			
			if(eta[imult]<etan[ieta]){
				Sumsinm[ieta]+=TMath::Sin(nn*phi[imult]);
				Sumcosm[ieta]+=TMath::Cos(nn*phi[imult]);
			}
			}
	
			totmultall[xbin]++;
		}

		for(int ieta=0;ieta<neta;ieta++){
		EPPhip[ieta] = 1.0/nn*TMath::ATan2(Sumsinp[ieta],Sumcosp[ieta]);
		EPPhim[ieta] = 1.0/nn*TMath::ATan2(Sumsinm[ieta],Sumcosm[ieta]);
		hEPPhip[xbin][ieta]->Fill(EPPhip[ieta]);
		hEPPhim[xbin][ieta]->Fill(EPPhim[ieta]);
		EPR[xbin][ieta]+=TMath::Cos(nn*(EPPhip[ieta]-EPPhim[ieta]));
		}
		for(int imult=0;imult<mult;imult++){
                        if(eta[imult]<-2.40||eta[imult]>2.40) continue;
                        if(pt[imult]<ptmin||pt[imult]>ptmax) continue; //event selection
			int ipt=-1;
                        for(int iptbin=0;iptbin<npt; iptbin++){
                                if(pt[imult]>ptbin[iptbin] && pt[imult]<=ptbin[iptbin+1])
                                ipt = iptbin;
                        }
                        if(ipt<0 || ipt==npt)  continue;
			if(phi[imult]>TMath::Pi()) phi[imult]-=2*TMath::Pi();	//keep [-pi,pi] range
	                totmult[xbin][ipt]++;
                        totpt[xbin][ipt]+=pt[imult];
			for(int ieta=0;ieta<neta;ieta++){
			if(eta[imult]>0){
                        	v2obs[xbin][ieta][ipt]+=TMath::Cos(nn*(phi[imult]-EPPhim[ieta]));
			}	
			if(eta[imult]<0){
                        	v2obs[xbin][ieta][ipt]+=TMath::Cos(nn*(phi[imult]-EPPhip[ieta]));
			}
			}
		}
		Nevent[xbin]++;
	}
	infile->Close();
}


// ------------ method called once each job just before starting event loop  ------------
void 
EP::beginJob()
{

	Nevent.ResizeTo(nbin);	totmultall.ResizeTo(nbin);
	Nevent.Zero();	totmultall.Zero();
	for(int ibin=0; ibin<nbin; ibin++){
                totmult[ibin].ResizeTo(npt);	totmult[ibin].Zero();  
                totpt[ibin].ResizeTo(npt);	totpt[ibin].Zero();  
		EPR[ibin].ResizeTo(neta); EPR[ibin].Zero();
		for(int ieta=0;ieta<neta;ieta++){
		v2obs[ibin][ieta].ResizeTo(npt);	v2obs[ibin][ieta].Zero();
		hEPPhip[ibin][ieta] = new TH1D("",Form("Event Plane Angle Distribution bin %d #eta>%.f",ibin,etap[ieta]),300,-3,3);
		hEPPhim[ibin][ieta] = new TH1D("",Form("Event Plane Angle Distribution bin %d #eta<%.f",ibin,etan[ieta]),300,-3,3);
		}
        }
}

// ------------ method called once each job just after ending the event loop  ------------
void 
EP::endJobEP(TString outstr) 
{
        
	TFile *fs = new TFile(outstr,"Recreate");
	fs->cd();
	Nevent.Write("Nevent");
	totmultall.Write("totmultall");
	for(int ibin=0; ibin<nbin; ibin++){
	totmult[ibin].Write(Form("totmult_%d",ibin));
	totpt[ibin].Write(Form("totpt_%d",ibin));
	EPR[ibin].Write(Form("EPR_%d",ibin));
	for(int ieta=0;ieta<neta;ieta++){
		v2obs[ibin][ieta].Write(Form("v2obs_%d_%d",ibin,ieta));
		hEPPhip[ibin][ieta]->SetName(Form("hEPPhip_%d_%d",ibin,ieta));
		hEPPhim[ibin][ieta]->SetName(Form("hEPPhim_%d_%d",ibin,ieta));
		hEPPhip[ibin][ieta]->Write();
		hEPPhim[ibin][ieta]->Write();
	}
	}
	fs->Close();
}

