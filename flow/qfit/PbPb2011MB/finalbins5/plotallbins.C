#include "par.h"
void plotallbins(){
    const int nnonf = 2;
    int fixv2=0;
    double avgmult[nnonf][nbin],avgtrk[nnonf][nbin], v2[nnonf][nbin],v2err[nnonf][nbin],g2[nnonf][nbin],g2err[nnonf][nbin];
    for(int ibin=0;ibin<nbin;ibin++){
        for(int inonf=0;inonf<nnonf;inonf++){
        TFile *f = TFile::Open(Form("qfitV.root"));
        if(!inonf)
        TVectorD *r = (TVectorD*)f->Get(Form("r_%d_%d",ibin,fixv2));
        else
        TVectorD *r = (TVectorD*)f->Get(Form("rnonf_%d_%d",ibin,fixv2));
        g2[inonf][ibin]=(*r)[0];
        g2err[inonf][ibin]=(*r)[1];
        v2[inonf][ibin]=TMath::Abs((*r)[2]);
        v2err[inonf][ibin]=(*r)[3];
        avgmult[inonf][ibin]=(*r)[4];
        avgtrk[inonf][ibin]=(*r)[5];
        }
    }
    TGraphErrors *grvfinal = new TGraphErrors(nbin,avgtrk[0],v2[0],0,v2err[0]);
    TGraphErrors *grvnonffinal = new TGraphErrors(nbin,avgtrk[0],v2[1],0,v2err[1]);
    TGraphErrors *grgfinal = new TGraphErrors(nbin,avgtrk[0],g2[0],0,g2err[0]);
    TGraphErrors *grgnonfinal = new TGraphErrors(nbin,avgtrk[0],g2[1],0,g2err[1]);

    double avgmult_[nnonf][nbin],avgtrk_[nnonf][nbin], v2_[nnonf][nbin],v2err_[nnonf][nbin],g2_[nnonf][nbin],g2err_[nnonf][nbin];
    const int nbinsf = 17;
    for(int ibin=0;ibin<nbinsf;ibin++){
        for(int inonf=0;inonf<nnonf;inonf++){
        TFile *f = TFile::Open(Form("../qfitV.root"));
        if(!inonf)
        TVectorD *r = (TVectorD*)f->Get(Form("r_%d_%d",ibin,fixv2));
        else
        TVectorD *r = (TVectorD*)f->Get(Form("rnonf_%d_%d",ibin,fixv2));
        g2_[inonf][ibin]=(*r)[0];
        g2err_[inonf][ibin]=(*r)[1];
        v2_[inonf][ibin]=TMath::Abs((*r)[2]);
        v2err_[inonf][ibin]=(*r)[3];
        avgmult_[inonf][ibin]=(*r)[4];
        avgtrk_[inonf][ibin]=(*r)[5];
        }
    }
    TGraphErrors *grv = new TGraphErrors(nbinsf,avgtrk_[0],v2_[0],0,v2err_[0]);
    TGraphErrors *grvnonf = new TGraphErrors(nbinsf,avgtrk_[0],v2_[1],0,v2err_[1]);
    TGraphErrors *grg = new TGraphErrors(nbinsf,avgtrk_[0],g2_[0],0,g2err_[0]);
    TGraphErrors *grgnonf = new TGraphErrors(nbinsf,avgtrk_[0],g2_[1],0,g2err_[1]);

    TLegend *tl = new TLegend(0.15,0.75,0.45,0.88);
    tl->SetTextSize(0.035);
    tl->SetBorderSize(0);
    tl->SetFillColor(0);

    TCanvas *c1 = new TCanvas("c1","c1",600,600);
    grvfinal->SetTitle("");
    grvfinal->GetXaxis()->SetTitle("Ntrkoffline");
    grvfinal->GetYaxis()->SetTitle("v_{2}");
    grvfinal->GetYaxis()->SetRangeUser(0,0.15);
    grvfinal->SetMarkerStyle(20);
    grvfinal->SetMarkerSize(1);
//    grvnonf->SetMarkerStyle(24);
//    grvnonf->SetMarkerColor(2);
//    grvnonf->SetLineColor(2);
    grv->SetMarkerStyle(24);
    grv->SetMarkerColor(2);
    grv->SetLineColor(2);
    tl->AddEntry(grv,"bin width coarser","p");
    tl->AddEntry(grvfinal,"bin width ~ 5","p");
    grvfinal->Draw("AP");
    grv->Draw("Psame");
    tl->Draw("same");

    TCanvas *c2 = new TCanvas("c2","c2",600,600);
    grgfinal->SetTitle("");
    grgfinal->GetXaxis()->SetTitle("Ntrkoffline");
    grgfinal->GetYaxis()->SetTitle("g_{2}");
    grgfinal->GetYaxis()->SetRangeUser(-1,5);
    grgfinal->SetMarkerStyle(20);
    grgfinal->SetMarkerSize(1);
//    grgnonf->SetMarkerStyle(24);
//    grgnonf->SetMarkerColor(2);
//    grgnonf->SetLineColor(2);
    grg->SetMarkerStyle(24);
    grg->SetMarkerColor(2);
    grg->SetLineColor(2);
    grgfinal->Draw("AP");
    grg->Draw("Psame");
    tl->Draw("same");

    c1->Print("v2vsNtrk.png");
    c2->Print("g2vsNtrk.png");
}

