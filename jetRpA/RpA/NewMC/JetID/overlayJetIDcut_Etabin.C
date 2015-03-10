#include "../../Quality/root_setting.h"
#include "../produceandcheck/file.h"

TLatex *T=new TLatex();

//int ieta=7;
TGraphAsymmErrors* makegraph(TH1* histo1, TH1* histo2){
const int Npoint=1000;
double x[Npoint],y[Npoint],xerrlow[Npoint],xerrhigh[Npoint],yerrlow[Npoint],yerrhigh[Npoint];
TGraphAsymmErrors *g=new TGraphAsymmErrors();
g->BayesDivide(histo1,histo2);
for(int ipoint=0;ipoint<g->GetN();ipoint++){
x[ipoint]=g->GetX()[ipoint];
y[ipoint]=g->GetY()[ipoint];
yerrhigh[ipoint]=0;
yerrlow[ipoint]=0;
//yerrhigh[ipoint]=g->GetErrorYhigh(ipoint);
//yerrlow[ipoint]=g->GetErrorYlow(ipoint);
xerrhigh[ipoint]=0;
xerrlow[ipoint]=0;
}
g0=new TGraphAsymmErrors(g->GetN(),x,y,xerrlow,xerrhigh,yerrlow,yerrhigh);
return g0;
}

TGraphAsymmErrors* makeJetIDcut(int ilist, int dataType, int ieta){
int ilistw;
if(ilist== 6)       {   JetID = "Max p_{T}^{charged}/p_{T}^{jet}"; JetIDcut[0]=0.05; JetIDcut[1]=1; ilistw=1;}
else if(ilist== 7)  {    JetID = "#Sum p_{T}^{charged}/p_{T}^{jet}"; JetIDcut[0] = 0; JetIDcut[1]=0.6;}
else if(ilist== 8)  {   JetID = "Max p_{T}^{neutral}/p_{T}^{jet}"; JetIDcut[0] = 0;  JetIDcut[1]=0.08;}
else if(ilist== 9)  {    JetID = "#Sum p_{T}^{neutral}/p_{T}^{jet}"; JetIDcut[0] = 0; JetIDcut[1]=0.15;}
else if(ilist== 10) {   JetID = "Max p_{T}^{photons}/p_{T}^{jet}";     JetIDcut[0] = 0; JetIDcut[1]=0.50;}
else if(ilist== 11) {    JetID = "#Sum p_{T}^{photons}/p_{T}^{jet}";     JetIDcut[0] = 0; JetIDcut[1]=0.3;}
else if(ilist== 12) {    JetID = "(#Sigma p_{T}^{charged}+#Sigma p_{T}^{photons}+#Sigma p_{T}^{neutral}+#Sigma p_{T}^{#mu}+#Sigma p_{T}^{e})/p_{T}^{jet}";JetIDcut[0]=0; JetIDcut[1]=1.01; ilistw=3;}
else if(ilist== 13) {    JetID = "(#Sigma p_{T}^{charged}+#Sigma p_{T}^{photons}+#Sigma p_{T}^{neutral}+#Sigma p_{T}^{#mu}+#Sigma p_{T}^{e})/p_{T}^{raw}"; JetIDcut[0]=0;JetIDcut[1]=1.13;}
else if(ilist== 14) {  JetID = "Max p_{T}^{neutral} /Max(#Sigma p_{T}^{charged},#Sigma p_{T}^{neutral})";JetIDcut[0]=0;JetIDcut[1]=0.975;ilistw=2;}
else if(ilist== 21)   {  JetID = "PP cut Tighter True or False";JetIDcut[0]=8;JetIDcut[1]=16;}

if(ilist==12 || ilist==13 || ilist==14 ){
double binbound_JetID[]={0,0.2,0.4,0.6,0.7,0.8,0.84,0.86,0.88,0.9,0.92,0.94,0.96,0.98,1.0,1.02,1.04,1.06,1.1,1.15,1.2,1.3,1.4,1.6,1.8,2.};}
else{
double binbound_JetID[]={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1.};}
//double binbound_JetID[]={0,0.025,0.05,0.075,0.1,0.125,0.15,0.175,0.2,0.225,0.25,0.275,0.3,0.325,0.35,0.375,0.4,0.425,0.45,0.475,0.5};

int Nbin_JetID=sizeof(binbound_JetID)/sizeof(double)-1;

TString JetIDName=JetIDNameList[ilist];
TString histonameID;
if(ieta==7){
    histonameID = Form("jetpt%s",JetIDName.Data());
}
else{
    histonameID = Form("jetpt%sEtaBin%s",JetIDName.Data(),etabinnameswap[ieta].Data());
}

TH2F* hdata2F=(TH2F*)fDataPPbJetIDids->Get(histonameID);
TH2F *hPPb2D= (TH2F*)fMCPPbids->Get(histonameID);
TH2F *hPPb2D_fake= (TH2F*)fMCPPbids->Get(Form("%s_fake",histonameID.Data()));

const double binbound_pt_coarse[]={0,30,70,150,200,600};
const int Nbin_pt_coarse=sizeof(binbound_pt_coarse)/sizeof(double)-1;
const double xrange_JetID[2]={binbound_JetID[0]+1e-4,binbound_JetID[Nbin_JetID]-1e-4};
xrange_JetIDcut[0]=JetIDcut[0]+1e-4;
xrange_JetIDcut[1]=JetIDcut[1]-1e-4;

TH1D* hPPb_pt=hPPb2D->ProjectionX("hPPb_pt");
TH1D* hPPb_pt_fake=hPPb2D_fake->ProjectionX("hPPb_pt_fake");
TH1D* hPPb_JetIDcut_pt=hPPb2D->ProjectionX("hPPb_JetIDcut_pt",hPPb2D->GetYaxis()->FindBin(xrange_JetIDcut[0]),hPPb2D->GetYaxis()->FindBin(xrange_JetIDcut[1]));
TH1D* hPPb_JetIDcut_pt_fake=hPPb2D_fake->ProjectionX("hPPb_JetIDcut_pt_fake",hPPb2D_fake->GetYaxis()->FindBin(xrange_JetIDcut[0]),hPPb2D_fake->GetYaxis()->FindBin(xrange_JetIDcut[1]));

hPPb_JetIDcut_pt = (TH1D*)hPPb_JetIDcut_pt->Rebin(Nbin_pt,hPPb_JetIDcut_pt->GetName(),binbound_pt);
hPPb_pt = (TH1D*)hPPb_pt->Rebin(Nbin_pt,hPPb_pt->GetName(),binbound_pt);

TGraphAsymmErrors *g = new TGraphAsymmErrors();
TH1D* histo1=(TH1D*)hdata2F->ProjectionX("histo1",hdata2F->GetYaxis()->FindBin(xrange_JetIDcut[0]),hdata2F->GetYaxis()->FindBin(xrange_JetIDcut[1]));
TH1D* histo2=(TH1D*)hdata2F->ProjectionX("histo2");
histo1=(TH1D*)histo1->Rebin(Nbin_pt,"histo1",binbound_pt);
histo2=(TH1D*)histo2->Rebin(Nbin_pt,"histo2",binbound_pt);
normalizeByBinWidth(histo1);
normalizeByBinWidth(histo2);
g=makegraph(histo1,histo2);
g->SetMarkerSize(1.4);

TGraphAsymmErrors *gfake = new TGraphAsymmErrors();
TGraphAsymmErrors *ginc = new TGraphAsymmErrors();
TH1D* ratio_hPPb_JetIDcutvsnocut_pt=(TH1D*)hPPb_JetIDcut_pt->Clone("ratio_hPPb_JetIDcut_ptcutvsnocut_pt");
ginc=makegraph(ratio_hPPb_JetIDcutvsnocut_pt,hPPb_pt);
ginc->SetMarkerSize(1.4);

TH1D* ratio_hPPb_JetIDcutvsnocut_pt_fake=(TH1D*)hPPb_JetIDcut_pt_fake->Clone("ratio_hPPb_JetIDcutvsnocut_pt_fake");
TH1D* cl_hPPb_pt_fake=(TH1D*)hPPb_pt_fake->Clone("cl_hPPb_pt_fake");
cl_hPPb_pt_fake=(TH1D*)cl_hPPb_pt_fake->Rebin(Nbin_pt_coarse,"cl_hPPb_pt_fake",binbound_pt_coarse);
ratio_hPPb_JetIDcutvsnocut_pt_fake=(TH1D*)ratio_hPPb_JetIDcutvsnocut_pt_fake->Rebin(Nbin_pt_coarse,"ratio_hPPb_JetIDcutvsnocut_pt_fake",binbound_pt_coarse);
normalizeByBinWidth(ratio_hPPb_JetIDcutvsnocut_pt_fake);
normalizeByBinWidth(cl_hPPb_pt_fake);
gfake=makegraph(ratio_hPPb_JetIDcutvsnocut_pt_fake,cl_hPPb_pt_fake);
gfake->SetMarkerSize(1.4);
gfake->SetMarkerStyle(20);
gfake->SetMarkerColor(2);
gfake->SetLineColor(2);

T->SetNDC();
T->SetTextAlign(12);
T->SetTextSize(0.05);
T->SetTextColor(1);
T->SetTextFont(42);
//if(canvas[ieta]==4)
//if(dataType==1) T->DrawLatex(0.22,0.78,Form("%.2f<%s<%.2f",xrange_JetIDcut[0],JetID.Data(),xrange_JetIDcut[1]));

if(dataType==1) return g;
else return ginc;
}


void overlayJetIDcut_Etabin(){
gStyle->SetOptStat(kFALSE);
c1 = new TCanvas("c1"," ",1200,600);
makeMultiPanelCanvas(c1,4,2,0,0,0.25,0.2,0.03);
TH1F* hFrame=new TH1F("","",1000,0,1000);
hFrame->SetLineColor(0);
hFrame->GetXaxis()->SetLimits(28,599);
hFrame->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
hFrame->GetYaxis()->SetTitle("Cut Efficiency");
hFrame->SetMaximum(1.005);
hFrame->SetMinimum(0.980);
fixedFontHist(hFrame,2.0,3.0);
hFrame->DrawCopy();
TLegend *leg1=new TLegend(0.42,0.35,0.72,0.75);
leg1->SetBorderSize(0);
leg1->SetFillColor(0);
leg1->SetTextSize(0.05);
for(int i=0;i<Neta;i++){
    c1->cd(canvas[i]+1)->SetGridx();
    if(i==0  || i==6){
        hFrame->GetYaxis()->SetTitle("Cut Effciency");
   //     hFrame->GetXaxis()->SetNdivisions(510);
    }
    else{
 //       hFrame->GetXaxis()->SetNdivisions(505);
    }
    if(i>=4)
        hFrame->GetXaxis()->SetTitle("p_{T}^{jet} (GeV/c)");
    else
        hFrame->GetXaxis()->SetTitle("");

    hFrame->DrawCopy();
TGraphAsymmErrors *g6Data = makeJetIDcut(6,1,i);
g6Data->SetMarkerStyle(20);
g6Data->SetMarkerColor(1);
g6Data->SetLineColor(1);
TGraphAsymmErrors *g6MC = makeJetIDcut(6,0,i);
g6MC->SetMarkerStyle(24);
g6MC->SetMarkerColor(1);
g6MC->SetLineColor(1);
//g6MC->Draw("Psame");
TGraphAsymmErrors *g12Data = makeJetIDcut(12,1,i);
g12Data->SetMarkerStyle(20);
g12Data->SetMarkerColor(1);
g12Data->SetLineColor(1);
TGraphAsymmErrors *g12MC = makeJetIDcut(12,0,i);
g12MC->SetMarkerStyle(24);
g12MC->SetMarkerColor(1);
g12MC->SetLineColor(1);
TGraphAsymmErrors *g14Data = makeJetIDcut(14,1,i);
g14Data->SetMarkerStyle(28);
g14Data->SetMarkerColor(4);
g14Data->SetLineColor(4);
TGraphAsymmErrors *g14MC = makeJetIDcut(14,0,i);
g14MC->SetMarkerStyle(25);
g14MC->SetMarkerColor(4);
g14MC->SetLineColor(4);
TGraphAsymmErrors *g21Data = makeJetIDcut(21,1,i);
g21Data->SetMarkerStyle(29);
g21Data->SetMarkerColor(4);
g21Data->SetLineColor(4);
TGraphAsymmErrors *g21MC = makeJetIDcut(21,0,i);
g21MC->SetMarkerStyle(25);
g21MC->SetMarkerColor(2);
g21MC->SetLineColor(2);
//g14MC->Draw("Psame");
TLine *l =new TLine(30,1,600,1);
l->SetLineStyle(2);
l->SetLineColor(1);
if(canvas[i]!=4){
//g14Data->Draw("Psame");
//g12Data->Draw("Psame");
//g6Data->Draw("Psame");
//g12MC->Draw("Psame");
g21Data->Draw("Psame");
g21MC->Draw("Psame");
l->Draw("same");
}
if(canvas[i]==4){
//leg1->AddEntry(g6Data,"cut 1 Data","lp");
//leg1->AddEntry(g6MC,"cut 1 PYTHIA+HIJING","lp");
//leg1->AddEntry(g14Data,"cut 2 Data","lp");
//leg1->AddEntry(g14MC,"cut 2 PYTHIA+HIJING","lp");
//leg1->AddEntry(g12Data,"cut 3 Data","lp");
//leg1->AddEntry(g12MC,"cut 3 PYTHIA+HIJING","lp");
leg1->AddEntry(g21Data,"PP cut Data","lp");
leg1->AddEntry(g21MC,"PP cut PYTHIA+HIJING","lp");
leg1->Draw("same");
}
T->SetTextSize(0.065);
if(canvas[i]!=4)
T->DrawLatex(0.40,0.30,etastring[i]);
}
c1->Print(Form("pic/overlay_JetIDcut_Etabin.png"));
}
