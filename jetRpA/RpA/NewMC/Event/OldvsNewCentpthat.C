#include "/home/xuq7/HI/jetRpA/RpA/Quality/root_setting.h"
void OldvsNewCentpthat(){
	gStyle->SetOptStat(kFALSE);
	int pthat = 15;
	h1 = DrawTH1(0,"hiHFplusEta4",pthat);
	h1_old = DrawTH1(1,"hiHFplusEta4",pthat);
	h1->SetTitle("");
	h1->GetXaxis()->SetTitleSize(0.05);
	h1->GetYaxis()->SetTitleSize(0.05);
	h1->GetXaxis()->SetTitle("HF Energy #eta>4");
	h1->GetYaxis()->SetTitle("ratio, New/Old");
	h1->GetXaxis()->SetRangeUser(0,100);
	h1->GetYaxis()->SetRangeUser(0,2);

//	h2 = DrawTH1("hiBin",120);
//	h3 = DrawTH1("hiBin",460);
	h1->SetMarkerStyle(20);
	h1->SetMarkerSize(1.1);
	h1->SetMarkerColor(1);
	h1->SetLineColor(1);
//	h2->SetMarkerStyle(29);
//	h2->SetMarkerColor(2);
//	h2->SetLineColor(2);
//	h3->SetMarkerStyle(24);
//	h3->SetMarkerColor(4);
//	h3->SetLineColor(4);
	TH1D* ratio = (TH1D*)h1->Clone("ratio");
	ratio->Divide(h1_old);
	TCanvas *c1 = new TCanvas();
	c1->cd();
	TLegend *leg = new TLegend(0.65,0.6,0.8,0.8);
	leg->AddEntry(h1,Form("pthat = %d",pthat),"p");
	leg->SetBorderSize(0);
	leg->SetFillColor(0);
	leg->SetTextSize(0.04);
	TLine *l = new TLine(0,1,100,1);
	l->SetLineStyle(2);
	ratio->Draw();
	leg->Draw("same");
	l->Draw("same");
	c1->Print(Form("pthat%dratio.png",pthat));
}

TH1D* DrawTH1(bool isOld, TString var, int pthat){
	if(!isOld)
	TFile *f = TFile::Open(Form("/cms/store/user/ymao/pA5TEV/Mixing/STARTHI53V27/merged/QCD_Pt_%d_TuneZ2_Mix_5p02TeV_pythia.root",pthat));
	else
	TFile *f = TFile::Open(Form("/cms/store/user/qixu/jetRpA/OldForest/pPb_Full_BTagForest%d_Fix3output.root",pthat));
	TTree *t = (TTree*)f->Get("hiEvtAnalyzer/HiTree");
	Float_t hiHFplusEta4, vz;
	Int_t hiBin;
	TH1D* h = new TH1D("h","h",100,0,100);
	h->Sumw2();
	t->SetBranchAddress("hiHFplusEta4",&hiHFplusEta4);
	t->SetBranchAddress("vz",&vz);
	t->SetBranchAddress("hiBin",&hiBin);
	for(int Ev=0;Ev<t->GetEntries();Ev++){
		t->GetEntry(Ev);
		if(TMath::Abs(vz)>=15) continue;
		if(var == "hiBin")
		h->Fill(hiBin);
		else if(var == "hiHFplusEta4")
		h->Fill(hiHFplusEta4);
	}
//	t->Draw(Form("%s>>h",var.Data()),"TMath::Abs(vz)<15");
//	h = (TH1D*)gDirectory->Get("h");
	h->Scale(1.0/h->Integral());
	return h;
}
