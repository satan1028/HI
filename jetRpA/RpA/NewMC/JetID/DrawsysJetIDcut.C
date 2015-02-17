#include "/home/xuq7/HI/jetRpA/RpA/Quality/root_setting.h"
#include "file.h"
#include <iomanip>
#include <iostream>
const int Npoint=1000;
const double binbound_pt[]={ 3, 4, 5, 7, 9, 12, 15, 18, 22, 27, 33, 39, 47, 55, 64,74, 84, 97, 114, 133, 153, 174, 196, 220, 245, 272, 300, 429, 692, 1000};
int Nbin_pt=sizeof(binbound_pt)/sizeof(double)-1;
int ilist0=12, ilist1=6, ilist2=14;
double JetIDcut[2];
double xrange_JetIDcut[2];
const int Neta=8;
const TString etabinname[Neta]={"15_20","10_15","5_10","-5_5","-10_-5","-15_-10","-20_-15",""};
const TString etabinnameswap[Neta]={"-20_-15","-15_-10","-10_-5","-5_5","5_10","10_15","15_20",""};
const double etabin[Neta]={0.5,0.5,0.5,1.0,0.5,0.5,0.5,2.0};
const TString etastring[Neta]={"-2.0<#eta_{CM}<-1.5","-1.5<#eta_{CM}<-1.0","-1.0<#eta_{CM}<-0.5","-0.5<#eta_{CM}<0.5","0.5<#eta_{CM}<1.0","1.0<#eta_{CM}<1.5","1.5<#eta_{CM}<2.0","-1.0<#eta_{CM}<1.0"};

ofstream fstr[Neta];

TH1D* makehisto(int ilist, int i,double cut, TString coll){
TString JetID;
TString JetIDNameList[18]={"chMax", "chSum", "neuMax", "neuSum", "phoMax", "phoSum", "chMaxpt", "chSumpt", "neuMaxpt", "neuSumpt", "phoMaxpt", "phoSumpt","SumSumpt","SumSumrawpt","neuMaxr","chN","neuN","phoN"};
TString JetIDName = JetIDNameList[ilist];

int ilistw;
if(ilist== 6)  {    JetID = "Max p_{T}^{charged}/p_{T}^{jet}"; JetIDcut[0]=0.05; JetIDcut[1]=1; ilistw=1;}
else if(ilist== 7)  {    JetID = "#Sum p_{T}^{charged}/p_{T}^{jet}"; JetIDcut[0] = 0; JetIDcut[1]=0.6;}
else if(ilist== 8)  {   JetID = "Max p_{T}^{neutral}/p_{T}^{jet}"; JetIDcut[0] = 0;  JetIDcut[1]=0.08;}
else if(ilist== 9)  {    JetID = "#Sum p_{T}^{neutral}/p_{T}^{jet}"; JetIDcut[0] = 0; JetIDcut[1]=0.15;}
else if(ilist== 10)  {   JetID = "Max p_{T}^{photons}/p_{T}^{jet}";     JetIDcut[0] = 0; JetIDcut[1]=0.50;}
else if(ilist== 11) {    JetID = "#Sum p_{T}^{photons}/p_{T}^{jet}";     JetIDcut[0] = 0; JetIDcut[1]=0.3;}
else if(ilist== 12) {    JetID = "#frac{#Sigma p_{T}^{charged}+#Sigma p_{T}^{photons}+#Sigma p_{T}^{neutral}+#Sigma p_{T}^{#mu}+#Sigma p_{T}^{e}}{p_{T}^{jet}}";JetIDcut[0]=0; JetIDcut[1]=cut; ilistw=3;}
else if(ilist== 13) {    JetID = "#Sigma p_{T}^{charged}+#Sigma p_{T}^{photons}+#Sigma p_{T}^{neutral}+#Sigma p_{T}^{#mu}+#Sigma p_{T}^{e}/p_{T}^{raw}"; JetIDcut[0]=0;JetIDcut[1]=1.13;}
else if(ilist== 14)   {  JetID = "Max p_{T}^{neutral} /Max(#Sigma p_{T}^{charged},#Sigma p_{T}^{neutral})";JetIDcut[0]=0;JetIDcut[1]=0.975;ilistw=2;}

if(ilist==12 || ilist==13 || ilist==14 ){
double binbound_JetID[]={0,0.2,0.4,0.6,0.7,0.8,0.84,0.86,0.88,0.9,0.92,0.94,0.96,0.98,1.0,1.02,1.04,1.06,1.1,1.15,1.2,1.3,1.4,1.6,1.8,2.};}
else{
double binbound_JetID[]={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1.};}
//double binbound_JetID[]={0,0.025,0.05,0.075,0.1,0.125,0.15,0.175,0.2,0.225,0.25,0.275,0.3,0.325,0.35,0.375,0.4,0.425,0.45,0.475,0.5};
int Nbin_JetID=sizeof(binbound_JetID)/sizeof(double)-1;

if(i==7){
    if(coll=="PPb")
TString histonameIDData=Form("jetpt%s%s",JetIDName.Data(),etabinname[i].Data());
    else
TString histonameIDData=Form("jetpt%s%s",JetIDName.Data(),etabinnameswap[i].Data());
}
else{
    if(coll=="PPb")
TString histonameIDData=Form("jetpt%sEtaBin%s",JetIDName.Data(),etabinname[i].Data());
    else
TString histonameIDData=Form("jetpt%sEtaBin%s",JetIDName.Data(),etabinnameswap[i].Data());
}
    fdataJetID = TFile::Open(Form("/cms/store/user/qixu/jetRpA/RpA/NewMC/DATA%sakPu3PFskimJetID.root",coll.Data()),"ReadOnly");
TH2F* hdata2F=(TH2F*)fdataJetID->Get(histonameIDData);

xrange_JetIDcut[0]=JetIDcut[0]+1e-4;
xrange_JetIDcut[1]=JetIDcut[1]-1e-4;
TH1D* histo=NULL;
histo=(TH1D*)hdata2F->ProjectionX("histo",hdata2F->GetYaxis()->FindBin(xrange_JetIDcut[0]),hdata2F->GetYaxis()->FindBin(xrange_JetIDcut[1]));
rehisto=(TH1D*)histo->Rebin(Nbin_pt,"rehisto",binbound_pt);
normalizeByBinWidth(rehisto);
    for(int ibin = 1; ibin <= rehisto->GetNbinsX(); ibin++) {
        rehisto->SetBinError(ibin,1e-18);
    }
rehisto->SetMarkerSize(1.4);
rehisto->SetTitle(Form("%s",JetID.Data()));
hdata2F=NULL;
return rehisto;
}

void DrawsysJetIDcut(){
gStyle->SetOptStat(kFALSE);
gStyle->SetErrorX(0);
gStyle->SetOptFit(1);
gStyle->SetOptTitle(0);
TH1F* hFrame=new TH1F("","",1000,0,1000);
//c1 = new TCanvas("c1","",600,1000);
//makeMultiPanelCanvas(c1,1,2,0.03,0.03,0.1,0.12,0.03);
c1 = new TCanvas("c1"," ",1200,700);
makeMultiPanelCanvas(c1,4,2,0,0,0.25,0.2,0.03);
fixedFontHist(hFrame,2.0,3.0);
hFrame->SetTitle("");
//hFrame->GetXaxis()->SetTitle("p_{T}");
//hFrame->GetYaxis()->SetTitle("Yield Ratio");
hFrame->GetXaxis()->SetLimits(25,600);
hFrame->GetYaxis()->SetRangeUser(0.925,1.085);
TH1D* histo1PPb;
TH1D* histo2PPb;
TH1D* hratioPPb;
TH1D* histo1PbP;
TH1D* histo2PbP;
TH1D* hratioPbP;
TLatex *T=new TLatex();

for(int i=0;i<Neta;i++){
    c1->cd(i+1);
    if(i==0  || i==4)
        hFrame->GetYaxis()->SetTitle("Yield Ratio");
    else
        hFrame->GetYaxis()->SetTitle("");
    if(i>=4)
        hFrame->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
    else
        hFrame->GetXaxis()->SetTitle("");

    hFrame->DrawCopy();
fstr[i].open(Form("jetIDsys%s.txt",etabinname[i].Data()));
fstr[i]<<setprecision(4)<<fixed;
//TH1D* histo0 = makehisto(ilist0,i,1.01);
histo1PPb = makehisto(ilist1,i,0.99,"PPb");
histo2PPb = makehisto(ilist2,i,1.03,"PPb");
hratioPPb = (TH1D*)histo2PPb->Clone();
hratioPPb->Divide(histo1PPb);
hratioPPb->SetMarkerSize(1.2);
hratioPPb->SetMarkerStyle(30);
hratioPPb->SetMarkerColor(4);
hratioPPb->SetLineColor(4);
histo1PbP = makehisto(ilist1,i,0.99,"PbP");
histo2PbP = makehisto(ilist2,i,1.03,"PbP");
hratioPbP = (TH1D*)histo2PbP->Clone();
hratioPbP->Divide(histo1PbP);
hratioPbP->SetMarkerSize(1.2);
hratioPbP->SetMarkerStyle(27);
hratioPbP->SetMarkerColor(6);
hratioPbP->SetLineColor(6);

hratioPPb->Draw("same");
hratioPbP->Draw("same");

for(int ibin=1;ibin<histo1PPb->GetNbinsX();ibin++){
if(histo1PPb->GetBinContent(ibin)!=0 && histo1PPb->GetBinCenter(ibin)>25 && histo1PPb->GetBinCenter(ibin)<=600){
fstr[i]<<histo1PPb->GetBinCenter(ibin)<<'\t';
fstr[i]<<100*(TMath::Abs(histo2PPb->GetBinContent(ibin)/histo1PPb->GetBinContent(ibin)-1)+TMath::Abs(histo2PPb->GetBinContent(ibin)/histo1PPb->GetBinContent(ibin)-1))/2<<endl;
}
}
/*TString JetID0 = histo0->GetTitle();
JetID0=Form("JetID systematics");
JetID1.Prepend("Cut1: ");
JetID2.Prepend("Cut2: ");
histo0->SetMarkerStyle(20);
histo0->SetMarkerColor(1);
histo0->SetLineColor(1);
histo1->SetMarkerStyle(24);
histo1->SetMarkerColor(2);
histo1->SetLineColor(2);
histo2->SetMarkerStyle(29);
histo2->SetMarkerColor(4);
histo2->SetLineColor(4);
histo0->Draw("E1same");
histo1->Draw("E1same");
histo2->Draw("E1same");
TLegend *leg1=new TLegend(0.20,0.68,0.90,0.90);
TLegend *leg2=new TLegend(0.70,0.80,0.85,0.90);
leg1->SetHeader(JetID0);
leg1->SetBorderSize(0);
leg2->SetBorderSize(0);
leg1->SetFillColor(0);
leg2->SetFillColor(0);
leg1->SetTextSize(0.04);
leg2->SetTextSize(0.04);
leg1->AddEntry(hFrame,"","");
leg1->AddEntry(histo0,"Original: Var < 1.01","p");
leg1->AddEntry(histo1,"Cut1: Var < 0.99","p");
leg1->AddEntry(histo2,"Cut2: Var < 1.03","p");
leg1->Draw("same");
TLatex *T=new TLatex();
T->SetNDC();
T->SetTextAlign(12);
T->SetTextSize(0.04);
T->SetTextColor(1);
T->SetTextFont(42);
c1->cd(2);
TH1D* ratio1=(TH1D*)histo1->Clone("ratio1");
TH1D* ratio2=(TH1D*)histo2->Clone("ratio2");
hFrame->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
hFrame->GetYaxis()->SetTitle(Form("Ratio"));
hFrame->GetYaxis()->SetRangeUser(0.8,1.19);
hFrame->DrawCopy();
ratio1->Divide(histo0);
ratio2->Divide(histo0);
ratio1->Draw("E1same");
ratio2->Draw("E1same");
leg2->AddEntry(ratio1,"Cut1/Original","lp");
leg2->AddEntry(ratio2,"Cut2/Original","lp");
leg2->Draw("same");
*/
TLine *l =new TLine(30,1,600,1);
l->SetLineStyle(2);
l->SetLineColor(1);
l->Draw("same");
T->SetNDC();
T->SetTextAlign(12);
T->SetTextSize(0.04);
T->SetTextColor(1);
T->SetTextFont(42);
T->SetTextSize(0.055);
if(i==0 || i ==4)
T->DrawLatex(0.35,0.28,etastring[i]);
else
T->DrawLatex(0.25,0.28,etastring[i]);
if(i==Neta-1){
    TLegend *leg1=new TLegend(0.60,0.30,0.85,0.40);
    leg1->SetBorderSize(0);
    leg1->SetFillColor(0);
    leg1->SetTextSize(0.065);
    leg1->AddEntry(hratioPPb,"PbP","p");
    leg1->AddEntry(hratioPbP,"PPb","p");
    leg1->Draw("same");
    T->SetTextSize(0.065);
    T->DrawLatex(0.35,0.80,"CMS Preliminary");
}

}
c1->Print(Form("/home/xuq7/HI/jetRpA/RpA/NewMC/JetID/pic/JetIDcutsys.gif"));
c1->Print(Form("/home/xuq7/HI/jetRpA/RpA/NewMC/JetID/pic/JetIDcutsys.pdf"));

}
