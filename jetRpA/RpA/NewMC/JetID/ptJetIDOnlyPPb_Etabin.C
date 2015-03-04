#include "TH1.h"
#include "TH2.h"
#include "TFile.h"
#include "TCanvas.h"
#include "TStyle.h"
#include "TLegend.h"
#include "TAxis.h"
#include "TMath.h"
#include "TLine.h"
#include "TObject.h"
#include "iostream"
#include "fstream"
#include "../../Quality/root_setting.h"
#include "../produceandcheck/file.h"

TH1* myRebin(TH1* histo,int Nbin, double binbound[]){
//rehisto->Scale(1/rehisto->Integral());

TH1* rehisto=histo->Clone("rehisto");
TH1* rehisto=(TH1*)histo->Rebin(Nbin,histo->GetName(),binbound);
TString histoname=Form("%s",histo->GetName());
if(!histoname.Contains("Prof")){
normalizeByBinWidth(rehisto);
}

return rehisto;
}

void ptJetIDOnlyPPb_Etabin(){

using namespace std;
gStyle->SetOptStat(kFALSE);
//gStyle->SetOptStat(100);
gStyle->SetErrorX(0);
gStyle->SetLabelFont(70);

//------------------------------------------------------------Get Histograms---------------------------------------------
int isMatch=1;
double xrange_JetIDcut[2]; double JetIDcut[2];
int ilist=atoi(getenv("LIST"));
TString JetIDName=JetIDNameList[ilist];
if(ilist== 0)  { JetID = "chargedMax"; JetIDcut[0]=4; JetIDcut[1]=9999;}
else if(ilist== 1)      JetID = "chargedSum";
else if(ilist== 2)      JetID = "neutralMax";
else if(ilist== 3) JetID = "neutralSum";
else if(ilist== 4) JetID = "photonMax";
else if(ilist== 5) JetID = "photonSum";
else if(ilist== 6)  {    JetID = "Max h^{#pm}/p_{T}"; JetIDcut[0]=0.05; JetIDcut[1]=2;}
else if(ilist== 7)  {    JetID = "#Sigma h^{#pm}/p_{T}"; JetIDcut[0] = 0; JetIDcut[1]=0.6;}
else if(ilist== 8)  {   JetID = "Max h^{0}/p_{T}"; JetIDcut[0] = 0;  JetIDcut[1]=0.08;}
else if(ilist== 9)  {    JetID = "#Sigma h^{0}/p_{T}"; JetIDcut[0] = 0; JetIDcut[1]=0.15;}
else if(ilist== 10)  {   JetID = "Max #gamma/p_{T}";	JetIDcut[0] = 0; JetIDcut[1]=0.50;}
else if(ilist== 11) {    JetID = "#Sigma #gamma/p_{T}";	JetIDcut[0] = 0; JetIDcut[1]=0.3;}
else if(ilist== 12) {    JetID = "(#Sigma h^{#pm}+#Sigma #gamma +#Sigma h^{0}+#Sigma #mu+#Sigma e)/p_{T}^{jet}";JetIDcut[0]=0; JetIDcut[1]=1.01;}
else if(ilist== 13) {    JetID = "(#Sigma h^{#pm}+#Sigma #gamma +#Sigma h^{0}+#Sigma #mu+#Sigma e)/p_{T}^{raw}"; JetIDcut[0]=0;JetIDcut[1]=1.20;}
else if(ilist== 14)   {  JetID = "Max h^{0}/Max(#Sigma h^{0},#Sigma h^{#pm})";JetIDcut[0]=0;JetIDcut[1]=0.975;}
else if(ilist== 15)     JetID = "charged Multiplicity";
else if(ilist== 16)     JetID = "neutral Multiplicity";
else if(ilist== 17)     JetID = "photon Multiplicity";
else if(ilist== 18)   {  JetID = "PP cut True or False";JetIDcut[0]=1;JetIDcut[1]=2;}
else if(ilist== 19)   {  JetID = "PP cut Tight True or False";JetIDcut[0]=1;JetIDcut[1]=2;}
else if(ilist== 20)   {  JetID = "Max h^{0}/#Sigma h^{#pm}";JetIDcut[0]=0;JetIDcut[1]=2;}
else{   exit();}

if(JetIDName.Contains("pt") || JetIDName=="neuMaxr"){
if(ilist==12 || ilist==13){
double binbound_JetID[]={0,0.4,0.8,0.84,0.86,0.88,0.9,0.92,0.94,0.96,0.98,1.0,1.02,1.04,1.06,1.1,1.15,1.2,1.3,1.4,1.6,1.8,2.};}
else if(ilist==14){
double binbound_JetID[]={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.6,0.7,0.8,0.84,0.88,0.92,0.96,1.02};}
else if(ilist==8 || ilist==10){
double binbound_JetID[]={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5};}
else{
//double binbound_JetID[]={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,1.,1.1,1.5,2};}
double binbound_JetID[]={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,1.0};}

Unit="";
}
else if(JetIDName.Contains("N")){
if(ilist==17){
double binbound_JetID[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,20,30};}
else if(ilist==16){
double binbound_JetID[]={0,1,2,3,4,5,6,7,8,10};}
else if(ilist==15){
double binbound_JetID[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,24,30,40};}
Unit="";
}
else if(JetIDName.Contains("PP")){
double binbound_JetID[]={0,1,2};
Unit="";
}
else{
double binbound_JetID[]={0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,200};
Unit="(GeV/c)";
}
int Nbin_JetID=sizeof(binbound_JetID)/sizeof(double)-1;

//--------------------------------------------------------SetUp canvas---------------------------------------------------
c1 = new TCanvas("c1"," ",1200,600);
c2 = new TCanvas("c2"," ",1200,600);
c2_ = new TCanvas("c2_"," ",1600,400);
c3 = new TCanvas("c3"," ",1200,600);
c4 = new TCanvas("c4"," ",1200,600);
c5 = new TCanvas("c5"," ",1200,600);
c6 = new TCanvas("c6"," ",1200,600);
c7 = new TCanvas("c7"," ",1200,600);
c8 = new TCanvas("c8"," ",1200,600);
c9 = new TCanvas("c9"," ",1200,600);
makeMultiPanelCanvas(c1,4,2,0,0,0.25,0.2,0.03);
makeMultiPanelCanvas(c2,4,2,0,0,0.25,0.2,0.03);
makeMultiPanelCanvas(c2_,4,1,0,0,0.25,0.2,0.03);
makeMultiPanelCanvas(c3,4,2,0,0,0.25,0.2,0.03);
makeMultiPanelCanvas(c4,4,2,0,0,0.25,0.2,0.03);
makeMultiPanelCanvas(c5,4,2,0,0,0.25,0.2,0.03);
makeMultiPanelCanvas(c6,4,2,0,0,0.25,0.2,0.03);
makeMultiPanelCanvas(c7,4,2,0,0,0.25,0.2,0.03);
makeMultiPanelCanvas(c8,4,2,0,0,0.25,0.2,0.03);
makeMultiPanelCanvas(c9,4,2,0,0,0.25,0.2,0.03);
TH1F* hFrame1=new TH1F("","",1000,0,1000);
TH1F* hFrame2=new TH1F("","",500,0,5);
fixedFontHist(hFrame1,2.0,3.0);
fixedFontHist(hFrame2,2.0,3.0);
hFrame1->SetTitle("");
hFrame2->SetTitle("");
TLegend *leg1=new TLegend(0.36,0.82,0.60,0.95);
leg1->SetBorderSize(0);
leg1->SetFillColor(0);
leg1->SetLineWidth(0);
leg1->SetTextSize(0.065);
TLegend *leg2=new TLegend(0.62,0.23,0.75,0.53);
leg2->SetBorderSize(0);
leg2->SetFillColor(0);
leg2->SetLineWidth(0);
leg2->SetTextSize(0.055);
TLatex T1;
T1.SetNDC();
T1.SetTextSize(0.065);
T1.SetTextFont(42);

for(int i=0;i<Neta;i++){
	if(canvas[i]==0){
		double ybase=0.15;	double xbase=0.28;
	}
	else if(canvas[i]>4){
		double ybase=0.30;	double xbase=0.05;
	}
	else{
		double ybase=0.15;	double xbase=0.05;
	}
if(isMatch){
    if(i==7){
	TH2F *hPPb2D= (TH2F*)fMCPPb->Get(Form("jetpt%s",JetIDName.Data()));
	TH2F *hPPb2D_real= (TH2F*)fMCPPb->Get(Form("jetpt%s_real1",JetIDName.Data()));
	TH2F *hPPb2D_fake= (TH2F*)fMCPPb->Get(Form("jetpt%s_fake1",JetIDName.Data()));
	TH1F *hPPb_pt= (TH1F*)fMCPPb->Get(Form("jetpt"));
	TH1F *hPPb_pt_real= (TH1F*)fMCPPb->Get(Form("jetpt_real1"));
	TH1F *hPPb_pt_fake= (TH1F*)fMCPPb->Get(Form("jetpt_fake1"));
    }
    else{
	TH2F *hPPb2D= (TH2F*)fMCPPb->Get(Form("jetpt%sEtaBin%s",JetIDName.Data(),etabinnameswap[i].Data()));
	TH2F *hPPb2D_real= (TH2F*)fMCPPb->Get(Form("jetpt%sEtaBin%s_real1",JetIDName.Data(),etabinnameswap[i].Data()));
	TH2F *hPPb2D_fake= (TH2F*)fMCPPb->Get(Form("jetpt%sEtaBin%s_fake1",JetIDName.Data(),etabinnameswap[i].Data()));
	TH1F *hPPb_pt= (TH1F*)fMCPPb->Get(Form("jetptEtaBin%s",etabinnameswap[i].Data()));
	TH1F *hPPb_pt_real= (TH1F*)fMCPPb->Get(Form("jetptEtaBin%s_real1",etabinnameswap[i].Data()));
	TH1F *hPPb_pt_fake= (TH1F*)fMCPPb->Get(Form("jetptEtaBin%s_fake1",etabinnameswap[i].Data()));
    }
	}
else{
    if(i==7){
	TH2F *hPPb2D= (TH2F*)fMCPPb->Get(Form("jetpt%s",JetIDName.Data()));
	TH2F *hPPb2D_real= (TH2F*)fMCPPb->Get(Form("jetpt%s_real",JetIDName.Data()));
	TH2F *hPPb2D_fake= (TH2F*)fMCPPb->Get(Form("jetpt%s_fake",JetIDName.Data()));
	TH1F *hPPb_pt= (TH1F*)fMCPPb->Get(Form("jetpt"));
	TH1F *hPPb_pt_real= (TH1F*)fMCPPb->Get(Form("jetpt_real"));
	TH1F *hPPb_pt_fake= (TH1F*)fMCPPb->Get(Form("jetpt_fake"));
    }
    else{
	TH2F *hPPb2D= (TH2F*)fMCPPb->Get(Form("jetpt%sEtaBin%s",JetIDName.Data(),etabinnameswap[i].Data()));
	TH2F *hPPb2D_real= (TH2F*)fMCPPb->Get(Form("jetpt%sEtaBin%s_real",JetIDName.Data(),etabinnameswap[i].Data()));
	TH2F *hPPb2D_fake= (TH2F*)fMCPPb->Get(Form("jetpt%sEtaBin%s_fake",JetIDName.Data(),etabinnameswap[i].Data()));
	TH1F *hPPb_pt= (TH1F*)fMCPPb->Get(Form("jetptEtaBin%s",etabinnameswap[i].Data()));
	TH1F *hPPb_pt_real= (TH1F*)fMCPPb->Get(Form("jetptEtaBin%s_real",etabinnameswap[i].Data()));
	TH1F *hPPb_pt_fake= (TH1F*)fMCPPb->Get(Form("jetptEtaBin%s_fake",etabinnameswap[i].Data()));
    }
}

double xrange_JetID[2]={binbound_JetID[0]+1e-4,binbound_JetID[Nbin_JetID]-1e-4};
xrange_JetIDcut[0]=JetIDcut[0]+1e-4;
xrange_JetIDcut[1]=JetIDcut[1]-1e-4;
TH1D* hPPb_JetID_ptbin[Nbin_pt_coarse];
TH1D* hPPb_JetID_ptbin_real[Nbin_pt_coarse];
TH1D* hPPb_JetID_ptbin_fake[Nbin_pt_coarse];
TH1F* rehisto_hPPb_JetID_ptbin[Nbin_pt_coarse];
TH1F* rehisto_hPPb_JetID_ptbin_real[Nbin_pt_coarse];
TH1F* rehisto_hPPb_JetID_ptbin_fake[Nbin_pt_coarse];
//TH1D* hPPb_pt=hPPb2D->ProjectionX("hPPb_pt",hPPb2D->GetYaxis()->FindBin(xrange_JetID[0]),hPPb2D->GetYaxis()->FindBin(xrange_JetID[1]));
//TH1D* hPPb_pt_real=hPPb2D_real->ProjectionX("hPPb_pt_real",hPPb2D_real->GetYaxis()->FindBin(xrange_JetID[0]),hPPb2D_real->GetYaxis()->FindBin(xrange_JetID[1]));
//TH1D* hPPb_pt_fake=hPPb2D_fake->ProjectionX("hPPb_pt_fake",hPPb2D_fake->GetYaxis()->FindBin(xrange_JetID[0]),hPPb2D_fake->GetYaxis()->FindBin(xrange_JetID[1]));
TH1D* hPPb_JetID=hPPb2D->ProjectionY("hPPb_JetID",hPPb2D->GetXaxis()->FindBin(xrange_pt[0]),hPPb2D->GetXaxis()->FindBin(xrange_pt[1]));
TH1D* hPPb_JetID_real=hPPb2D_real->ProjectionY("hPPb_JetID_real",hPPb2D_real->GetXaxis()->FindBin(xrange_pt[0]),hPPb2D_real->GetXaxis()->FindBin(xrange_pt[1]));
TH1D* hPPb_JetID_fake=hPPb2D_fake->ProjectionY("hPPb_JetID_fake",hPPb2D_fake->GetXaxis()->FindBin(xrange_pt[0]),hPPb2D_fake->GetXaxis()->FindBin(xrange_pt[1]));
    for(int ipt=0;ipt<Nbin_pt_coarse;ipt++){
        hPPb_JetID_ptbin[ipt]=hPPb2D->ProjectionY(Form("hPPb_JetID_ptbin_%d",ipt),hPPb2D->GetXaxis()->FindBin(binbound_pt_coarse[ipt]+1e-4),hPPb2D->GetXaxis()->FindBin(binbound_pt_coarse[ipt+1]-1e-4));
        hPPb_JetID_ptbin_real[ipt]=hPPb2D_real->ProjectionY(Form("hPPb_JetID_ptbin_real_%d",ipt),hPPb2D_real->GetXaxis()->FindBin(binbound_pt_coarse[ipt]+1e-4),hPPb2D_real->GetXaxis()->FindBin(binbound_pt_coarse[ipt+1]-1e-4));
        hPPb_JetID_ptbin_fake[ipt]=hPPb2D_fake->ProjectionY(Form("hPPb_JetID_ptbin_fake_%d",ipt),hPPb2D_fake->GetXaxis()->FindBin(binbound_pt_coarse[ipt]+1e-4),hPPb2D_fake->GetXaxis()->FindBin(binbound_pt_coarse[ipt+1]-1e-4));
    }
TH1D* hPPb_JetIDcut_pt=hPPb2D->ProjectionX("hPPb_JetIDcut_pt",hPPb2D->GetYaxis()->FindBin(xrange_JetIDcut[0]),hPPb2D->GetYaxis()->FindBin(xrange_JetIDcut[1]));
TH1D* hPPb_JetIDcut_pt_real=hPPb2D_real->ProjectionX("hPPb_JetIDcut_pt_real",hPPb2D_real->GetYaxis()->FindBin(xrange_JetIDcut[0]),hPPb2D_real->GetYaxis()->FindBin(xrange_JetIDcut[1]));
TH1D* hPPb_JetIDcut_pt_fake=hPPb2D_fake->ProjectionX("hPPb_JetIDcut_pt_fake",hPPb2D_fake->GetYaxis()->FindBin(xrange_JetIDcut[0]),hPPb2D_fake->GetYaxis()->FindBin(xrange_JetIDcut[1]));

TProfile *hProfPPb=(TProfile*)hPPb2D->ProfileX("hProfPPb",1,-1);
TProfile *hProfPPb_fake=(TProfile*)hPPb2D_fake->ProfileX("hProfPPb_fake",1,-1);
TProfile *hProfPPb_real=(TProfile*)hPPb2D_real->ProfileX("hProfPPb_real",1,-1);

//---------------------------------------------------Rebin and Format histograms-----------------------------------------
TH1F* rehisto_hPPb_pt=(TH1F*)myRebin(hPPb_pt,Nbin_pt,binbound_pt);
TH1F* rehisto_hPPb_pt_real=(TH1F*)myRebin(hPPb_pt_real,Nbin_pt,binbound_pt);
TH1F* rehisto_hPPb_pt_fake=(TH1F*)myRebin(hPPb_pt_fake,Nbin_pt,binbound_pt);

TH1F* rehisto_hPPb_JetIDcut_pt=(TH1F*)myRebin(hPPb_JetIDcut_pt,Nbin_pt,binbound_pt);
TH1F* rehisto_hPPb_JetIDcut_pt_real=(TH1F*)myRebin(hPPb_JetIDcut_pt_real,Nbin_pt,binbound_pt);
TH1F* rehisto_hPPb_JetIDcut_pt_fake=(TH1F*)myRebin(hPPb_JetIDcut_pt_fake,Nbin_pt,binbound_pt);
TH1F* rehisto_hPPb_JetID=(TH1F*)myRebin(hPPb_JetID,Nbin_JetID,binbound_JetID);
TH1F* rehisto_hPPb_JetID_real=(TH1F*)myRebin(hPPb_JetID_real,Nbin_JetID,binbound_JetID);
TH1F* rehisto_hPPb_JetID_fake=(TH1F*)myRebin(hPPb_JetID_fake,Nbin_JetID,binbound_JetID);
    for(int ipt=0;ipt<Nbin_pt_coarse;ipt++){
        rehisto_hPPb_JetID_ptbin[ipt]=(TH1F*)myRebin(hPPb_JetID_ptbin[ipt],Nbin_JetID,binbound_JetID);
        rehisto_hPPb_JetID_ptbin_real[ipt]=(TH1F*)myRebin(hPPb_JetID_ptbin_real[ipt],Nbin_JetID,binbound_JetID);
        rehisto_hPPb_JetID_ptbin_fake[ipt]=(TH1F*)myRebin(hPPb_JetID_ptbin_fake[ipt],Nbin_JetID,binbound_JetID);
    }
TProfile *rehisto_hProfPPb=(TProfile*)myRebin(hProfPPb,Nbin_pt,binbound_pt);
TProfile *rehisto_hProfPPb_fake=(TProfile*)myRebin(hProfPPb_fake,Nbin_pt,binbound_pt);
TProfile *rehisto_hProfPPb_real=(TProfile*)myRebin(hProfPPb_real,Nbin_pt,binbound_pt);
rehisto_hPPb_pt->SetTitle(Form("%.2f--%.2f %s",xrange_JetID[0],xrange_JetID[1], Unit.Data()));
rehisto_hPPb_pt->SetMarkerStyle(20);
rehisto_hPPb_pt->SetMarkerSize(1.5);
rehisto_hPPb_pt->SetMarkerColor(1);
rehisto_hPPb_pt->SetLineColor(1);
rehisto_hPPb_pt->SetLineColor(1);
rehisto_hPPb_JetIDcut_pt->SetTitle("");

    for(int ipt=0;ipt<Nbin_pt_coarse;ipt++){
rehisto_hPPb_JetID_ptbin[ipt]->SetMarkerSize(1.5);
rehisto_hPPb_JetID_ptbin[ipt]->SetMarkerStyle(24);
rehisto_hPPb_JetID_ptbin[ipt]->SetMarkerColor(1);
rehisto_hPPb_JetID_ptbin[ipt]->SetLineColor(1);
rehisto_hPPb_JetID_ptbin_fake[ipt]->SetMarkerStyle(20);
rehisto_hPPb_JetID_ptbin_fake[ipt]->SetMarkerSize(1.5);
rehisto_hPPb_JetID_ptbin_fake[ipt]->SetMarkerColor(2);
rehisto_hPPb_JetID_ptbin_fake[ipt]->SetLineColor(2);
rehisto_hPPb_JetID_ptbin_real[ipt]->SetMarkerStyle(29);
rehisto_hPPb_JetID_ptbin_real[ipt]->SetMarkerSize(1.5);
rehisto_hPPb_JetID_ptbin_real[ipt]->SetMarkerColor(4);
rehisto_hPPb_JetID_ptbin_real[ipt]->SetLineColor(4);
    }
rehisto_hPPb_JetID->SetMarkerSize(1.5);
rehisto_hPPb_JetID->SetMarkerStyle(24);
rehisto_hPPb_JetID->SetMarkerColor(1);
rehisto_hPPb_JetID->SetLineColor(1);
rehisto_hPPb_JetID_fake->SetMarkerStyle(20);
rehisto_hPPb_JetID_fake->SetMarkerSize(1.5);
rehisto_hPPb_JetID_fake->SetMarkerColor(2);
rehisto_hPPb_JetID_fake->SetLineColor(2);
rehisto_hPPb_JetID_real->SetMarkerStyle(29);
rehisto_hPPb_JetID_real->SetMarkerSize(1.5);
rehisto_hPPb_JetID_real->SetMarkerColor(4);
rehisto_hPPb_JetID_real->SetLineColor(4);

rehisto_hProfPPb->SetMarkerSize(1.3);
rehisto_hProfPPb_fake->SetMarkerSize(1.3);
rehisto_hProfPPb_real->SetMarkerSize(1.3);
rehisto_hProfPPb->SetMarkerStyle(24);
rehisto_hProfPPb_fake->SetMarkerStyle(20);
rehisto_hProfPPb_real->SetMarkerStyle(29);

rehisto_hProfPPb->SetMarkerColor(1);
rehisto_hProfPPb->SetLineColor(1);
rehisto_hProfPPb_fake->SetMarkerColor(2);
rehisto_hProfPPb_fake->SetLineColor(2);
rehisto_hProfPPb_real->SetMarkerColor(4);
rehisto_hProfPPb_real->SetLineColor(4);


//--------------------------------------------------------pT distribution------------------------------------------------

c1->cd(canvas[i]+1)->SetGridx();
c1->cd(canvas[i]+1)->SetLogy();
    if(canvas[i]==0  || canvas[i]==4){
        hFrame1->GetYaxis()->SetTitle("Jet Yield");
        hFrame1->SetLabelSize(18,"Y");
    }
    else{
        hFrame1->SetLabelSize(0,"Y");
        hFrame1->GetYaxis()->SetTitle("");
    }
    if(canvas[i]>=4)
        hFrame1->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
	
   hFrame1->GetXaxis()->SetNdivisions(510);
   hFrame1->GetXaxis()->SetLimits(28,599);
   hFrame1->SetMinimum(2e-12);
   hFrame1->SetMaximum(5e-3);
   hFrame1->DrawCopy();

if(canvas[i]!=4){
rehisto_hPPb_pt->DrawCopy("E1same");
T1.SetTextSize(0.065);
T1.DrawLatex(0.4,ybase,etastring[i]);
}
if(canvas[i]==4){
leg1->AddEntry(hFrame1,"PYTHIA+HIJING","");
leg1->Draw("same");
}
//-------------------------------------------------PP&PPb JetID distribution---------------------------------------------

c2->cd(canvas[i]+1)->SetLogy();
c2->cd(canvas[i]+1)->SetGridx();
    if(canvas[i]==0  || canvas[i]==4){
        hFrame2->GetYaxis()->SetTitle("Jet Yield");
        hFrame2->SetLabelSize(18,"Y");
    }
    else{
        hFrame2->SetLabelSize(0,"Y");
        hFrame2->GetYaxis()->SetTitle("");
    }
    if(canvas[i]>=4)
        hFrame2->GetXaxis()->SetTitle(Form("%s %s",JetID.Data(),Unit.Data()));
hFrame2->GetXaxis()->SetNdivisions(510);
hFrame2->GetXaxis()->SetLimits(-binbound_JetID[1]*0.7,binbound_JetID[Nbin_JetID]*1.02);
//hFrame2->SetMinimum(1e-11);
hFrame2->SetMinimum(8e-5);
//hFrame2->SetMaximum(1);
hFrame2->SetMaximum(2e-1);
hFrame2->DrawCopy();
if(canvas[i]!=4){
rehisto_hPPb_JetID->Draw("E1same");
rehisto_hPPb_JetID_fake->Draw("E1same");
rehisto_hPPb_JetID_real->Draw("E1same");
TLine *l1 = new TLine(JetIDcut[0],0,JetIDcut[0],hFrame2->GetMaximum());
TLine *l2 = new TLine(JetIDcut[1],0,JetIDcut[1],hFrame2->GetMaximum());
l1->SetLineStyle(2);
l2->SetLineStyle(2);
l1->Draw("same");
l2->Draw("same");
}
if(canvas[i]==4){
leg2->AddEntry(rehisto_hPPb_JetID,"Inclusive","lp");
leg2->AddEntry(rehisto_hPPb_JetID_fake,"fake","lp");
leg2->AddEntry(rehisto_hPPb_JetID_real,"real","lp");
leg1->Draw("same");
leg2->Draw("same");
T1.SetTextSize(0.065);
T1.DrawLatex(0.30,0.28,Form("%.f<p_{T}<%.f (GeV/c)",xrange_pt[0],xrange_pt[1]));
T1.DrawLatex(0.28,0.73,Form("Cut: %.2f - %.2f",JetIDcut[0],JetIDcut[1]));
}
if(canvas[i]!=4){
T1.SetTextSize(0.042);
T1.DrawLatex(xbase,ybase+0.1,Form("Inc rm: %.2f%%",100-hPPb_JetID->Integral(hPPb_JetID->FindBin(xrange_JetIDcut[0]),hPPb_JetID->FindBin(xrange_JetIDcut[1])-1)/hPPb_JetID->Integral(0, -1)*100));
T1.DrawLatex(xbase,ybase+0.05,Form("real rm: %.2f%%",100-hPPb_JetID_real->Integral(hPPb_JetID_real->FindBin(xrange_JetIDcut[0]),hPPb_JetID_real->FindBin(xrange_JetIDcut[1])-1)/hPPb_JetID_real->Integral(0, -1)*100));
T1.DrawLatex(xbase,ybase,Form("fake rm: %.2f%%",100-hPPb_JetID_fake->Integral(hPPb_JetID_fake->FindBin(xrange_JetIDcut[0]),hPPb_JetID_fake->FindBin(xrange_JetIDcut[1])-1)/hPPb_JetID_fake->Integral(0, -1)*100));
T1.DrawLatex(xbase+0.45,ybase+0.05,Form("fake w cut: %.2f%%",hPPb_JetID_fake->Integral(hPPb_JetID_fake->FindBin(xrange_JetIDcut[0]),hPPb_JetID_fake->FindBin(xrange_JetIDcut[1]))/hPPb_JetID->Integral(hPPb_JetID->FindBin(xrange_JetIDcut[0]), hPPb_JetID->FindBin(xrange_JetIDcut[1]))*100));
T1.DrawLatex(xbase+0.45,ybase,Form("fake wo cut: %.2f%%",hPPb_JetID_fake->Integral(0,-1)/hPPb_JetID->Integral(0, -1)*100));
T1.SetTextSize(0.065);
T1.DrawLatex(0.4,ybase-0.06,etastring[i]);
}

if(i==7){
        hFrame2->GetYaxis()->SetTitle("Jet Yield");
        hFrame2->GetXaxis()->SetTitle(Form("%s %s",JetID.Data(),Unit.Data()));
        hFrame2->GetXaxis()->SetNdivisions(510);
        hFrame2->GetXaxis()->SetLimits(-binbound_JetID[1]*0.7,binbound_JetID[Nbin_JetID]*1.02);
        hFrame2->SetMinimum(1e-11);
        hFrame2->SetMaximum(1);
        fixedFontHist(hFrame2,1.6,2.1);
        for(int ipt=0;ipt<Nbin_pt_coarse;ipt++){
        c2_->cd(ipt+1)->SetLogy();
        hFrame2->DrawCopy();
        rehisto_hPPb_JetID_ptbin[ipt]->Draw("E1same");
        rehisto_hPPb_JetID_ptbin_fake[ipt]->Draw("E1same");
        rehisto_hPPb_JetID_ptbin_real[ipt]->Draw("E1same");
        T1.SetTextSize(0.050);
        if(ipt==0)
        T1.DrawLatex(0.25,0.4,etastring[i]);
        T1.DrawLatex(0.25,0.9,Form("%.f < p_{T} < %.f (GeV/c)",binbound_pt_coarse[ipt],binbound_pt_coarse[ipt+1]));
        T1.DrawLatex(0.25,0.28,Form("Inc: Mean=%.3f",rehisto_hPPb_JetID_ptbin[ipt]->GetMean()));
        T1.DrawLatex(0.25,0.24,Form("Real: Mean=%.3f",rehisto_hPPb_JetID_ptbin_real[ipt]->GetMean()));
        T1.DrawLatex(0.25,0.20,Form("Fake: Mean=%.3f",rehisto_hPPb_JetID_ptbin_fake[ipt]->GetMean()));
        }
}

//---------------------------------------PPb JetID f/i&r/i ratio before cut ------------------------------------------ 
c3->cd(canvas[i]+1)->SetLogy();
c3->cd(canvas[i]+1)->SetGridx();
    if(canvas[i]==0  || canvas[i]==4){
        hFrame2->GetYaxis()->SetTitle("Ratio");
        hFrame2->SetLabelSize(18,"Y");
    }
    else{
        hFrame2->SetLabelSize(0,"Y");
        hFrame2->GetYaxis()->SetTitle("");
    }
    if(canvas[i]>=4)
        hFrame2->GetXaxis()->SetTitle(JetID);
hFrame2->GetXaxis()->SetNdivisions(510);
hFrame2->GetXaxis()->SetLimits(-binbound_JetID[1]*0.7,binbound_JetID[Nbin_JetID]*1.02);
//hFrame2->GetXaxis()->SetLimits((binbound_JetID[0]-1e-3)*0.9,binbound_JetID[Nbin_JetID]*1.02);
fixedFontHist(hFrame2,2.0,3.0);
hFrame2->SetMinimum(5e-8);
hFrame2->SetMaximum(5);
hFrame2->DrawCopy();
ratio_hPPb_JetID_fake=(TH1F*)rehisto_hPPb_JetID_fake->Clone("ratio_hPPb_JetID_fake");
ratio_hPPb_JetID_fake->Divide(rehisto_hPPb_JetID);
ratio_hPPb_JetID_fake->GetYaxis()->SetTitle("ratio");
ratio_hPPb_JetID_real=(TH1F*)rehisto_hPPb_JetID_real->Clone("ratio_hPPb_JetID_real");
ratio_hPPb_JetID_real->Divide(rehisto_hPPb_JetID);
if(canvas[i]!=4){
ratio_hPPb_JetID_fake->Draw("same");
ratio_hPPb_JetID_real->Draw("same");
TLine *l1 = new TLine(JetIDcut[0],0,JetIDcut[0],hFrame2->GetMaximum());
TLine *l2 = new TLine(JetIDcut[1],0,JetIDcut[1],hFrame2->GetMaximum());
l1->SetLineStyle(2);
l2->SetLineStyle(2);
l1->Draw("same");
l2->Draw("same");
T1.SetTextSize(0.065);
T1.DrawLatex(0.4,ybase-0.06,etastring[i]);
TLine *l = new TLine(hFrame2->GetXaxis()->GetXmin(),1,hFrame2->GetXaxis()->GetXmax(),1);
l->SetLineStyle(2);
l->Draw("same");
}
if(canvas[i]==4){
TLegend* leg3 = new TLegend(*leg2);
leg3->Clear();
leg3->SetX1(0.45);
leg3->SetX2(0.9);
leg3->AddEntry(ratio_hPPb_JetID_fake,"fake Jet/Inc Jet","lp");
leg3->AddEntry(ratio_hPPb_JetID_real,"real Jet/Inc Jet","lp");
leg1->Draw("same");
leg3->Draw("same");
}
//----------------------------------------------PPb f&r&i cutvsnocut-------------------------------------------------

c4->cd(canvas[i]+1)->SetGridx();
    if(canvas[i]==0  || canvas[i]==4){
 //       hFrame1->GetYaxis()->SetTitle("Cut effeciency");
	hFrame1->GetYaxis()->SetTitle(Form("#frac{cut}{no cut}"));
        hFrame1->SetLabelSize(18,"Y");
    }
    else{
        hFrame1->SetLabelSize(0,"Y");
        hFrame1->GetYaxis()->SetTitle("");
    }
    if(canvas[i]>=4)
        hFrame1->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
hFrame1->GetXaxis()->SetLimits(28,599);
hFrame1->SetMaximum(1.015);
hFrame1->SetMinimum(0.915);
hFrame1->DrawCopy();
TH1F* ratio_hPPb_JetIDcutvsnocut_pt=(TH1F*)rehisto_hPPb_JetIDcut_pt->Clone("ratio_hPPb_JetIDcut_ptcutvsnocut_pt");
ratio_hPPb_JetIDcutvsnocut_pt->Divide(rehisto_hPPb_pt);
getRidYError(ratio_hPPb_JetIDcutvsnocut_pt);
ratio_hPPb_JetIDcutvsnocut_pt->SetMarkerSize(1.5);
ratio_hPPb_JetIDcutvsnocut_pt->SetMarkerStyle(24);
ratio_hPPb_JetIDcutvsnocut_pt->SetMarkerColor(1);
ratio_hPPb_JetIDcutvsnocut_pt->SetLineColor(1);
//TH1F* ratio_hPPb_JetIDcutvsnocut_pt_fake=(TH1F*)hPPb_JetIDcut_pt_fake->Clone("ratio_hPPb_JetIDcutvsnocut_pt_fake");
TH1F* ratio_hPPb_JetIDcutvsnocut_pt_fake=(TH1F*)rehisto_hPPb_JetIDcut_pt_fake->Clone("ratio_hPPb_JetIDcutvsnocut_pt_fake");
TH1F* cl_rehisto_hPPb_pt_fake=(TH1F*)hPPb_pt_fake->Clone("cl_rehisto_hPPb_pt_fake");
cl_rehisto_hPPb_pt_fake=(TH1F*)cl_rehisto_hPPb_pt_fake->Rebin(Nbin_pt_coarse,"cl_rehisto_hPPb_pt_fake",binbound_pt_coarse);
//ratio_hPPb_JetIDcutvsnocut_pt_fake=(TH1F*)ratio_hPPb_JetIDcutvsnocut_pt_fake->Rebin(Nbin_pt_coarse,"ratio_hPPb_JetIDcutvsnocut_pt_fake",binbound_pt_coarse);
//normalizeByBinWidth(ratio_hPPb_JetIDcutvsnocut_pt_fake);
normalizeByBinWidth(cl_rehisto_hPPb_pt_fake);
//ratio_hPPb_JetIDcutvsnocut_pt_fake->Divide(cl_rehisto_hPPb_pt_fake);
ratio_hPPb_JetIDcutvsnocut_pt_fake->Divide(rehisto_hPPb_pt_fake);
getRidYError(ratio_hPPb_JetIDcutvsnocut_pt_fake);
ratio_hPPb_JetIDcutvsnocut_pt_fake->GetYaxis()->SetTitle("");
ratio_hPPb_JetIDcutvsnocut_pt_fake->SetMarkerSize(1.5);
ratio_hPPb_JetIDcutvsnocut_pt_fake->SetMarkerStyle(20);
ratio_hPPb_JetIDcutvsnocut_pt_fake->SetMarkerColor(2);
ratio_hPPb_JetIDcutvsnocut_pt_fake->SetLineColor(2);
TH1F* ratio_hPPb_JetIDcutvsnocut_pt_real=(TH1F*)rehisto_hPPb_JetIDcut_pt_real->Clone("ratio_hPPb_JetIDcutvsnocut_pt_real");
ratio_hPPb_JetIDcutvsnocut_pt_real->Divide(rehisto_hPPb_pt_real);
ratio_hPPb_JetIDcutvsnocut_pt_real->GetYaxis()->SetTitle("");
ratio_hPPb_JetIDcutvsnocut_pt_real->SetMarkerSize(1.5);
ratio_hPPb_JetIDcutvsnocut_pt_real->SetMarkerStyle(29);
ratio_hPPb_JetIDcutvsnocut_pt_real->SetMarkerColor(4);
ratio_hPPb_JetIDcutvsnocut_pt_real->SetLineColor(4);
getRidYError(ratio_hPPb_JetIDcutvsnocut_pt_real);
if(canvas[i]!=4){
ratio_hPPb_JetIDcutvsnocut_pt->Draw("Psame");
ratio_hPPb_JetIDcutvsnocut_pt_fake->Draw("Psame");
ratio_hPPb_JetIDcutvsnocut_pt_real->Draw("Psame");
T1.DrawLatex(0.4,ybase-0.06,etastring[i]);
TLine *l =new TLine(28,1,600,1);
l->SetLineStyle(2);
l->Draw("same");
}
if(canvas[i]==4){
leg1->Draw("same");
leg2->Draw("same");
T1.SetTextSize(0.060);
T1.DrawLatex(0.28,0.63,Form("Var: %s", JetID.Data()));
T1.SetTextSize(0.065);
T1.DrawLatex(0.28,0.73,Form("Cut: %.2f - %.2f",JetIDcut[0],JetIDcut[1]));
}

//---------------------------------------PPb pT f/i&r/i ratio before and after cut-----------------------------------

c5->cd(canvas[i]+1)->SetGridx();
c5->cd(canvas[i]+1)->SetLogy();
    if(canvas[i]==0  || canvas[i]==4){
	hFrame1->GetYaxis()->SetTitle(Form("Ratio"));
        hFrame1->SetLabelSize(18,"Y");
    }
    else{
        hFrame1->SetLabelSize(0,"Y");
        hFrame1->GetYaxis()->SetTitle("");
    }
    if(canvas[i]>=4)
        hFrame1->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
hFrame1->GetXaxis()->SetLimits(28,599);
hFrame1->SetMaximum(5);
hFrame1->SetMinimum(5e-8);
hFrame1->DrawCopy();
TH1F* ratio_hPPb_JetIDcut_pt_fakevsInc=(TH1F*)rehisto_hPPb_JetIDcut_pt_fake->Clone("ratio_hPPb_JetIDcut_pt_fakevsInc");
ratio_hPPb_JetIDcut_pt_fakevsInc->Divide(rehisto_hPPb_JetIDcut_pt);
ratio_hPPb_JetIDcut_pt_fakevsInc->SetTitle("");
ratio_hPPb_JetIDcut_pt_fakevsInc->SetMarkerStyle(20);
ratio_hPPb_JetIDcut_pt_fakevsInc->SetMarkerSize(1.5);
ratio_hPPb_JetIDcut_pt_fakevsInc->SetMarkerColor(2);
ratio_hPPb_JetIDcut_pt_fakevsInc->SetLineColor(2);

TH1F* ratio_hPPb_JetIDcut_pt_realvsInc=(TH1F*)rehisto_hPPb_JetIDcut_pt_real->Clone("ratio_hPPb_JetIDcut_pt_realvsInc");
ratio_hPPb_JetIDcut_pt_realvsInc->Divide(rehisto_hPPb_JetIDcut_pt);
ratio_hPPb_JetIDcut_pt_realvsInc->SetMarkerStyle(29);
ratio_hPPb_JetIDcut_pt_realvsInc->SetMarkerSize(1.5);
ratio_hPPb_JetIDcut_pt_realvsInc->SetMarkerColor(4);
ratio_hPPb_JetIDcut_pt_realvsInc->SetLineColor(4);
if(canvas[i]!=4){
ratio_hPPb_JetIDcut_pt_fakevsInc->Draw("same");
ratio_hPPb_JetIDcut_pt_realvsInc->Draw("same");
T1.DrawLatex(0.4,ybase-0.06,etastring[i]);
TLine *l = new TLine(hFrame1->GetXaxis()->GetXmin(),1,hFrame1->GetXaxis()->GetXmax(),1);
l->SetLineStyle(2);
l->Draw("same");
}
if(canvas[i]==4){
T1.SetTextSize(0.060);
T1.DrawLatex(0.28,0.63,Form("Var: %s", JetID.Data()));
T1.SetTextSize(0.065);
T1.DrawLatex(0.28,0.73,Form("Cut: %.2f - %.2f",JetIDcut[0],JetIDcut[1]));
leg1->Draw("same");
leg3->Draw("same");
}


c6->cd(canvas[i]+1)->SetGridx();
c6->cd(canvas[i]+1)->SetLogy();
    if(canvas[i]==0  || canvas[i]==4){
	hFrame1->GetYaxis()->SetTitle(Form("Ratio"));
        hFrame1->SetLabelSize(18,"Y");
    }
    else{
        hFrame1->SetLabelSize(0,"Y");
        hFrame1->GetYaxis()->SetTitle("");
    }
    if(canvas[i]>=4)
        hFrame1->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
hFrame1->GetXaxis()->SetLimits(28,599);
hFrame1->SetMaximum(5);
hFrame1->SetMinimum(5e-8);
hFrame1->DrawCopy();
TH1F* ratio_hPPb_pt_fakevsInc=(TH1F*)rehisto_hPPb_pt_fake->Clone("ratio_hPPb_pt_fakevsInc");
ratio_hPPb_pt_fakevsInc->Divide(rehisto_hPPb_pt);
ratio_hPPb_pt_fakevsInc->SetTitle("");
ratio_hPPb_pt_fakevsInc->SetMarkerStyle(20);
ratio_hPPb_pt_fakevsInc->SetMarkerSize(1.5);
ratio_hPPb_pt_fakevsInc->SetMarkerColor(2);
ratio_hPPb_pt_fakevsInc->SetLineColor(2);

TH1F* ratio_hPPb_pt_realvsInc=(TH1F*)rehisto_hPPb_pt_real->Clone("ratio_hPPb_pt_realvsInc");
ratio_hPPb_pt_realvsInc->Divide(rehisto_hPPb_pt);
ratio_hPPb_pt_realvsInc->SetMarkerStyle(29);
ratio_hPPb_pt_realvsInc->SetMarkerSize(1.5);
ratio_hPPb_pt_realvsInc->SetMarkerColor(4);
ratio_hPPb_pt_realvsInc->SetLineColor(4);
if(canvas[i]!=4){
T1.DrawLatex(0.4,ybase-0.06,etastring[i]);
ratio_hPPb_pt_fakevsInc->Draw("same");
ratio_hPPb_pt_realvsInc->Draw("same");
l->Draw("same");
}
if(canvas[i]==4){
T1.DrawLatex(0.28,0.73,Form("No Cut"));
leg1->Draw("same");
leg3->Draw("same");
}

//-------------------------------PPb pT distribution before and after cut-------------------------------------------
c7->cd(canvas[i]+1)->SetGridx();
c7->cd(canvas[i]+1)->SetLogy();
    if(canvas[i]==0  || canvas[i]==4){
	hFrame1->GetYaxis()->SetTitle(Form("Jet Yield"));
        hFrame1->SetLabelSize(18,"Y");
    }
    else{
        hFrame1->SetLabelSize(0,"Y");
	hFrame1->GetYaxis()->SetTitle("");
    }
    if(canvas[i]>=4)
        hFrame1->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
	
   hFrame1->GetXaxis()->SetNdivisions(510);
   hFrame1->GetXaxis()->SetLimits(28,599);
   hFrame1->SetMinimum(2e-15);
   hFrame1->SetMaximum(5e-3);
   hFrame1->DrawCopy();

rehisto_hPPb_pt->SetMarkerStyle(24);
rehisto_hPPb_pt->SetMarkerSize(1.5);
rehisto_hPPb_pt_real->SetMarkerStyle(29);
rehisto_hPPb_pt_real->SetMarkerColor(4);
rehisto_hPPb_pt_real->SetLineColor(4);
rehisto_hPPb_pt_real->SetMarkerSize(1.5);
rehisto_hPPb_pt_fake->SetMarkerStyle(20);
rehisto_hPPb_pt_fake->SetMarkerColor(2);
rehisto_hPPb_pt_fake->SetLineColor(2);
rehisto_hPPb_pt_fake->SetMarkerSize(1.5);

if(canvas[i]!=4){
T1.DrawLatex(0.4,ybase-0.06,etastring[i]);
rehisto_hPPb_pt->Draw("E1same");
rehisto_hPPb_pt_real->Draw("E1same");
rehisto_hPPb_pt_fake->Draw("E1same");
}
if(canvas[i]==4){
T1.DrawLatex(0.28,0.73,Form("No Cut"));
leg1->Draw("same");
leg2->Draw("same");
}

c8->cd(canvas[i]+1)->SetGridx();
c8->cd(canvas[i]+1)->SetLogy();
    if(canvas[i]==0  || canvas[i]==4){
	hFrame1->GetYaxis()->SetTitle(Form("Jet Yield"));
        hFrame1->SetLabelSize(18,"Y");
    }
    else
        hFrame1->SetLabelSize(0,"Y");
    if(i>=4)
        hFrame1->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
	
   hFrame1->GetXaxis()->SetNdivisions(510);
   hFrame1->GetXaxis()->SetLimits(28,599);
   hFrame1->SetMinimum(2e-15);
   hFrame1->SetMaximum(5e-3);
   hFrame1->DrawCopy();
rehisto_hPPb_JetIDcut_pt->SetMarkerStyle(24);
rehisto_hPPb_JetIDcut_pt->SetMarkerSize(1.5);
rehisto_hPPb_JetIDcut_pt->SetMaximum(1e-2);
rehisto_hPPb_JetIDcut_pt->SetMinimum(1e-13);
rehisto_hPPb_JetIDcut_pt_real->SetMarkerSize(1.5);
rehisto_hPPb_JetIDcut_pt_real->SetMarkerStyle(29);
rehisto_hPPb_JetIDcut_pt_real->SetMarkerColor(4);
rehisto_hPPb_JetIDcut_pt_real->SetLineColor(4);
rehisto_hPPb_JetIDcut_pt_fake->SetMarkerStyle(20);
rehisto_hPPb_JetIDcut_pt_fake->SetMarkerColor(2);
rehisto_hPPb_JetIDcut_pt_fake->SetLineColor(2);
rehisto_hPPb_JetIDcut_pt_fake->SetMarkerSize(1.5);
if(canvas[i]!=4){
T1.DrawLatex(0.4,ybase-0.06,etastring[i]);
rehisto_hPPb_JetIDcut_pt->Draw("E1same");
rehisto_hPPb_JetIDcut_pt_real->Draw("E1same");
rehisto_hPPb_JetIDcut_pt_fake->Draw("E1same");
}
if(canvas[i]==4){
T1.SetTextSize(0.060);
T1.DrawLatex(0.28,0.63,Form("Var: %s", JetID.Data()));
T1.SetTextSize(0.065);
T1.DrawLatex(0.28,0.73,Form("Cut: %.2f - %.2f",JetIDcut[0],JetIDcut[1]));
leg1->Draw("same");
leg2->Draw("same");
}
//--------------------------------------------------PP&PPb JetID,pT Profile histograms-----------------------------------

c9->cd(canvas[i]+1)->SetGridx();
    if(canvas[i]==0  || canvas[i]==4){
	hFrame1->GetYaxis()->SetTitle(Form("%s %s",JetID.Data(), Unit.Data()));
        hFrame1->SetLabelSize(18,"Y");
    }
    else{
        hFrame1->SetLabelSize(0,"Y");
        hFrame1->GetXaxis()->SetTitle("");
    }
    if(canvas[i]>=4)
        hFrame1->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
	
   hFrame1->GetXaxis()->SetNdivisions(510);
   hFrame1->GetXaxis()->SetLimits(28,599);
   if(i==0){
	double hFrameMax = TMath::Max(rehisto_hProfPPb_fake->GetMaximum(),rehisto_hProfPPb_real->GetMaximum())*1.12;
        double hFrameMin = (rehisto_hPPb_JetID->GetMean()*2 - hFrameMax)*1.2;
        if(hFrameMin<0)
            hFrameMin = 0;
   }

   hFrame1->SetMaximum(hFrameMax);
   hFrame1->SetMinimum(hFrameMin);
   hFrame1->DrawCopy();
if(canvas[i]!=4){
T1.DrawLatex(0.4,ybase-0.06,etastring[i]);
rehisto_hProfPPb->Draw("same");
rehisto_hProfPPb_fake->Draw("same");
rehisto_hProfPPb_real->Draw("same");
TLine *l1 = new TLine(hFrame1->GetXaxis()->GetXmin(),JetIDcut[0],hFrame1->GetXaxis()->GetXmax(),JetIDcut[0]);
TLine *l2 = new TLine(hFrame1->GetXaxis()->GetXmin(),JetIDcut[1],hFrame1->GetXaxis()->GetXmax(),JetIDcut[1]);
l1->SetLineStyle(5);
l2->SetLineStyle(5);
l1->Draw("same");
l2->Draw("same");
}
if(canvas[i]==4){
T1.DrawLatex(0.28,0.73,Form("Cut: %.2f - %.2f",JetIDcut[0],JetIDcut[1]));
leg1->Draw("same");
leg2->Draw("same");
}
gPad->RedrawAxis();
}

if(isMatch){
c1->Print(Form("pic/%s/jetpt_PPb_Etabin_cut1.png",JetIDName.Data()));
c2->Print(Form("pic/%s/jetid_Etabin_cut1.png",JetIDName.Data()));
c2_->Print(Form("pic/%s/jetid_Etabin_ptbin_cut1.png",JetIDName.Data()));
c3->Print(Form("pic/%s/ratio_jetid_Etabin_cut1.png",JetIDName.Data()));
c4->Print(Form("pic/%s/ratio_jetpt_cutvsnocut_Etabin_cut1.png",JetIDName.Data()));
c5->Print(Form("pic/%s/ratio_jetpt_aftcut_%s_Etabin_cut1.png",JetIDName.Data(),JetIDName.Data()));
c6->Print(Form("pic/%s/ratio_jetpt_befcut_Etabin_cut1.png",JetIDName.Data(),JetIDName.Data()));
c7->Print(Form("pic/%s/jetpt_befcut_Etabin_cut1.png",JetIDName.Data()));
c8->Print(Form("pic/%s/jetpt_aftcut_Etabin_cut1.png",JetIDName.Data()));
c9->Print(Form("pic/%s/Profile_Etabin_cut1.png",JetIDName.Data()));
}
else{
c1->Print(Form("pic/%s/jetpt_PPb_Etabin.png",JetIDName.Data()));
c2->Print(Form("pic/%s/jetid_Etabin.png",JetIDName.Data()));
c2_->Print(Form("pic/%s/jetid_Etabin_ptbin.png",JetIDName.Data()));
c3->Print(Form("pic/%s/ratio_jetid_Etabin.png",JetIDName.Data()));
c4->Print(Form("pic/%s/ratio_jetpt_cutvsnocut_Etabin.png",JetIDName.Data()));
c5->Print(Form("pic/%s/ratio_jetpt_aftcut_%s_Etabin.png",JetIDName.Data(),JetIDName.Data()));
c6->Print(Form("pic/%s/ratio_jetpt_befcut_Etabin.png",JetIDName.Data(),JetIDName.Data()));
c7->Print(Form("pic/%s/jetpt_befcut_Etabin.png",JetIDName.Data()));
c8->Print(Form("pic/%s/jetpt_aftcut_Etabin.png",JetIDName.Data()));
c9->Print(Form("pic/%s/Profile_Etabin.png",JetIDName.Data()));
}
}
