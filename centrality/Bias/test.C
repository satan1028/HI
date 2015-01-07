#include "parameter.h"
#include "par.h"
void test(){
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
	gammafunnuclNcoll = new TF1("gammafunnuclNcoll","TMath::GammaDist(x,[0],0,[1])",0,100);
        gammafun->SetParameter(0,k);   //[1]: k value
        gammafun->SetParameter(1,theta);       //[2]: theta value
	double kevt = (*k0)[0]-(*kbest)[0];
        gammafunevt->SetParameter(0,kevt);   //[1]: k value
        gammafunevt->SetParameter(1,theta);       //[2]: theta value
        gammafunnucl->SetParameter(0,0.46);   //[1]: k value
        gammafunnucl->SetParameter(1,3.91307);   //[2]: theta value
        gammafunnuclNcoll->SetParameter(0,(*kbest)[0]*xNcoll);   //[1]: k value
        gammafunnuclNcoll->SetParameter(1,theta);   //[2]: theta value
	cout<<k<<"\t"<<theta<<endl;
	cout<<kevt<<"\t"<<(*kbest)[0]<<endl;
	cout<<"mean="<<gammafunnucl->Mean(0,100)<<endl;
	TCanvas *c1 = new TCanvas();
	gammafun->SetLineColor(1);
	gammafunevt->SetLineColor(2);
	gammafunnucl->SetLineColor(4);
	TLegend *leg = new TLegend(0.4,0.55,0.7,0.85);
	leg->AddEntry(gammafun,"gamma function for total","lp");
	leg->AddEntry(gammafunevt,"gamma function for proton","lp");
	leg->AddEntry(gammafunnucl,"gamma function for nucleus","lp");
	leg->SetBorderSize(0);
	leg->SetFillColor(0);
	leg->SetTextSize(0.04);
	gammafun->GetYaxis()->SetRangeUser(0,0.5);
	gammafun->SetTitle("gamma function");
	gammafun->GetXaxis()->SetTitle("x");
	gammafun->GetYaxis()->SetTitle("Probability");
	gammafun->Draw();	
	gammafunevt->Draw("same");	
	gammafunnucl->Draw("same");	
	leg->Draw("same");


	TH1D *h = new TH1D("","",10000,0,100);

        Long_t Ev;      Int_t Bino;     Double_t Para_nucl, Para_evt, Bi_Para_nucl, Bi_Para_evt;
        for (Ev=0; Ev<1e7; Ev++){
		//Para_nucl = 0; //make sure that Para doesn't accuthetalate through loops
		Para_evt = 0; //make sure that Para doesn't accuthetalate through loops
               	Para_nucl = gammafunnucl->GetRandom();
//                	Para_nucl += Bi_Para_nucl;
//                }
		h->Fill(Para_nucl);
	}
	h->Draw();
}
