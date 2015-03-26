#include "par.h"
#include <iomanip>
#include "../../../jetRpA/RpA/Quality/root_setting.h"

int xbin=0;	//xbin<1
int xtheta=0;
void plotqfit(){
    gStyle->SetOptStat(1011);
    gStyle->SetOptFit(1111);
TFile *f = TFile::Open("mergedV_Sum.root");
TVectorD *vecDavgmult = f->Get(Form("avgmult"));
double *avgmult = vecDavgmult->GetMatrixArray();
TLatex *t= new TLatex();
t->SetNDC();
t->SetTextSize(0.04);
t->SetTextFont(42);
TH1D* hq = (TH1D*)f->Get(Form("D_%d/D_%d/hq",xbin,xtheta));
TH1D* hqx = (TH1D*)f->Get(Form("D_%d/hqx",xbin));
TH1D* hqy = (TH1D*)f->Get(Form("D_%d/hqy",xbin));
        //hq->Scale(1./hq->Integral(0,-1));
        // multiplyByBinCenter(hq[ibin][itheta]);
        //normalizeByBinWidth(hq);
        //hqx->Scale(1./hqx->Integral(0,-1));
        //multiplyByBinCenter(hqx[ibin]);
        //normalizeByBinWidth(hqx);
        //hqy->Scale(1./hqy->Integral(0,-1));
        //multiplyByBinCenter(hqy[ibin]);
        //normalizeByBinWidth(hqy);
ffit = new TF1(Form("ffit"),"[3]/(0.5*(1+[0]))*TMath::Exp(-([1]*[1]*[2]+x*x)/(1+[0]))*TMath::BesselI0(x*[1]*TMath::Sqrt([2])/(0.5*(1+[0])))",0,10);
ffit0 = new TF1(Form("ffit0"),"[3]/(0.5*(1+[0]))*TMath::Exp(-([1]*[1]*[2]+x*x)/(1+[0]))*TMath::BesselI0(x*[1]*TMath::Sqrt([2])/(0.5*(1+[0])))",0,10);
f1fit = new TF1(Form("f1fit"),"[3]*x/(0.5*(1+[0]))*TMath::Exp(-([1]*[1]*[2]+x*x)/(1+[0]))*TMath::BesselI0(x*[1]*TMath::Sqrt([2])/(0.5*(1+[0])))",0,10);
f1fit0 = new TF1(Form("f1fit0"),"[3]*x/(0.5*(1+[0]))*TMath::Exp(-([1]*[1]*[2]+x*x)/(1+[0]))*TMath::BesselI0(x*[1]*TMath::Sqrt([2])/(0.5*(1+[0])))",0,10);
ffit->SetParNames("g2","v2","M","A");
ffit->SetParameters(0.05,0.05,avgmult[xbin],1e5);
ffit->FixParameter(2,avgmult[xbin]);
f1fit->SetParNames("g2","v2","M","A");
f1fit->SetParameters(0.05,0.05,avgmult[xbin],1e5);
f1fit->FixParameter(2,avgmult[xbin]);
hq->Fit(Form("ffit"),"R","P",0,10);
TCanvas *c2 = new TCanvas("c2","c2",500,1000);
c2->Divide(1,2);
c2->cd(1)->SetLogy();
fixedFontHist(hqx,1.6,2.0);
hqx->SetTitle("");
hqx->GetXaxis()->SetTitle("q_{x}");
hqx->GetYaxis()->SetTitle("#frac{dN}{q_{x}dq_{x}}");
hqx->GetYaxis()->SetRangeUser(1,1e6);
hqx->Fit(Form("ffit"),"R","",0,10);
ffit0->SetParameters(ffit->GetParameter(0),0,ffit->GetParameter(2),ffit->GetParameter(3));
ffit0->SetLineColor(1);
ffit0->SetLineStyle(2);
ffit0->Draw("same");
c2->cd(2);
TH1D* hqx_cp = (TH1D*)hqx->Clone("hqx_cp");
fixedFontHist(hqx_cp,1.6,2.0);
multiplyByBinCenter(hqx_cp);
hqx_cp->GetYaxis()->SetTitle("#frac{dN}{dq_{x}}");
hqx_cp->GetYaxis()->SetRangeUser(0,1e5);
hqx_cp->Fit(Form("f1fit"),"R","",0,10);
f1fit0->SetParameters(f1fit->GetParameter(0),0,f1fit->GetParameter(2),f1fit->GetParameter(3));
f1fit0->SetLineColor(1);
f1fit0->SetLineStyle(2);
f1fit0->Draw("same");
t->DrawLatex(0.5,0.2,Form("mult = %.f,input v_{2} = %.3f", avgmult[xbin], inV2));

TCanvas *c3 = new TCanvas("c3","c3",500,1000);
c3->Divide(1,2);
c3->cd(1)->SetLogy();
fixedFontHist(hqy,1.6,2.0);
hqy->GetXaxis()->SetTitle("q_{y}");
hqy->GetYaxis()->SetTitle("#frac{dN}{q_{y}dq_{y}}");
hqy->GetYaxis()->SetRangeUser(1,1e6);
hqy->Fit(Form("ffit"),"R","",0,10);
ffit0->SetParameters(ffit->GetParameter(0),0,ffit->GetParameter(2),ffit->GetParameter(3));
ffit0->Draw("same");
c3->cd(2);
TH1D* hqy_cp = (TH1D*)hqy->Clone("hqy_cp");
fixedFontHist(hqy_cp,1.6,2.0);
multiplyByBinCenter(hqy_cp);
hqy_cp->GetYaxis()->SetTitle("#frac{dN}{dq_{y}}");
hqy_cp->GetYaxis()->SetRangeUser(0,1e5);
hqy_cp->Fit(Form("f1fit"),"R","",0,10);
f1fit0->SetParameters(f1fit->GetParameter(0),0,f1fit->GetParameter(2),f1fit->GetParameter(3));
f1fit0->Draw("same");
t->DrawLatex(0.5,0.2,Form("mult = %.f,input v_{2} = %.3f", avgmult[xbin], inV2));
c1->Print("hqx_fit.png");
c2->Print("hqy_fit.png");
}

