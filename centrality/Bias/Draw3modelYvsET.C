#include "parameter.h"
#include "par.h"
void Draw3modelYvsET(){
	int sth=0, Gth=0;
        TFile *f = TFile::Open(outG);
        if(sth==0){TString dirname = "std";}
        else if(sth==1){TString dirname ="Gri055";}
        else {TString dirname ="Gri101";}
        TObjString* dataname = (TObjString*)f->Get(Form("dataname"));
        TObjString* histoname = (TObjString*)f->Get(Form("histoname"));
                TString name;
        if(Gth==0)
                name = "G0";
        else if(Gth<nGlau)
                name = Form("Glau_%d",Gth);
        else
                name = Form("bin_%d",Gth-nGlau+1);
        TObjString* Glaubername = (TObjString*)f->Get(Form("%s/%s/Glaubername",dirname.Data(),name.Data()));
        TVectorD* k0 = (TVectorD*)f->Get(Form("%s/%s/k0",dirname.Data(),name.Data()));
        TVectorD* theta0 = (TVectorD*)f->Get(Form("%s/%s/theta0",dirname.Data(),name.Data()));
        TVectorD* xmin = (TVectorD*)f->Get(Form("%s/%s/xmin",dirname.Data(),name.Data()));
        TVectorD* xmax = (TVectorD*)f->Get(Form("%s/%s/xmax",dirname.Data(),name.Data()));
        TVectorD* thetabest = (TVectorD*)f->Get(Form("%s/%s/thetabest",dirname.Data(),name.Data()));
        TVectorD* kbest = (TVectorD*)f->Get(Form("%s/%s/kbest",dirname.Data(),name.Data()));
	
	TFile *fGlauber = TFile::Open(Glaubername->GetName());
	(*k0)[0]=1.39;	(*kbest)[0]=0.425;
	(*theta0)[0]=3.41;	(*thetabest)[0]=1.30;
	int xNcoll = 5;
	int xNpart = xNcoll + 1; 
        double k=(*k0)[0]+(*kbest)[0]*(xNpart-2);
        double theta=(*theta0)[0]+(*thetabest)[0]*TMath::Log(xNpart-1);
        gammafun = new TF1("gammafun","TMath::GammaDist(x,[0],0,[1])",0,100);
	gammafunevt = new TF1("gammafunevt","TMath::GammaDist(x,[0],0,[1])",0,100);
	gammafunnucl = new TF1("gammafunnucl","TMath::GammaDist(x,[0],0,[1])",0,100);
        gammafun->SetParameter(0,k);   //[1]: k value
        gammafun->SetParameter(1,theta);       //[2]: theta value
	double kevt = (*k0)[0]-(*kbest)[0];
        gammafunevt->SetParameter(0,kevt);   //[1]: k value
        gammafunevt->SetParameter(1,theta);       //[2]: theta value
        gammafunnucl->SetParameter(0,(*kbest)[0]);   //[1]: k value
        gammafunnucl->SetParameter(1,theta);   //[2]: theta value
	cout<<k<<"\t"<<theta<<endl;
	cout<<kevt<<"\t"<<(*kbest)[0]<<endl;
	TCanvas *c1 = new TCanvas();
	gammafun->SetLineColor(1);
	gammafunevt->SetLineColor(2);
	gammafunnucl->SetLineColor(4);
	gammafun->GetYaxis()->SetRangeUser(0,0.5);
	gammafun->Draw();	
	gammafunevt->Draw("same");	
	gammafunnucl->Draw("same");	

	TH2D *UCM = new TH2D("UCM","UCM",100,0,100,200,0,40);
	TH2D *PCM = new TH2D("PCM","PCM",100,0,100,200,0,40);
	TH2D *VCM = new TH2D("VCM","VCM",100,0,100,200,0,40);
	TTree *t = (TTree*)fGlauber->Get("nt_p_Pb");
        Float_t Ncoll, Npart, B;        Long_t Nevent;
	t->SetBranchAddress("Ncoll",&Ncoll);
        t->SetBranchAddress("Npart",&Npart);
        t->SetBranchAddress("B",&B);

        Nevent = (Long_t) t->GetEntries();
        Long_t Ev;      Int_t Bino;     Double_t Para_nucl, Para_evt, Bi_Para_nucl, Bi_Para_evt;
        for (Ev=0; Ev<Nevent; Ev++){
 //       	if(Ev%100000==0)       cout<<"\t"<<"Have run "<<Ev<<" events"<<endl;
 //       	t->GetEntry(Ev);
//		if(Npart!=xNpart) continue;
		Para_nucl = 0; //make sure that Para doesn't accuthetalate through loops
		Para_evt = 0; //make sure that Para doesn't accuthetalate through loops
                for(Bino=0; Bino<xNcoll; Bino++){
                	Bi_Para_nucl = gammafunnucl->GetRandom();
                	Para_nucl += Bi_Para_nucl;
                }
		Para_evt = gammafunevt->GetRandom();
		
		UCM->Fill(Para_nucl,xNcoll);
		PCM->Fill(Para_nucl,1.0/2/(*kbest)[0]/theta*(Para_nucl+Para_evt));
		VCM->Fill(Para_nucl,1.0/2*(Para_nucl/(*kbest)[0]/theta+xNcoll));
	}
	TCanvas *c2 = new TCanvas();
	c2->SetLogz();
	//UCM->Draw("C");
	PCM->Draw("colz");
	//VCM->Draw("same");

	for(int i=0;i<10;i++)
		cout<<gammafun->GetRandom()<<"\t";
	cout<<endl;
	for(int i=0;i<10;i++)
		cout<<gammafunevt->GetRandom()<<"\t";
	cout<<endl;
	for(int i=0;i<10;i++)
		cout<<gammafunnucl->GetRandom()<<"\t";
	cout<<endl;
	c1->Print("gammafundist.png");
	c2->Print("paperfig2.png");
}
