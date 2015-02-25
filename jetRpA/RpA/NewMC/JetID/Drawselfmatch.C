#include "../../Quality/root_setting.h"
#include "../produceandcheck/file.h"
void Drawselfmatch(){
	gStyle->SetOptStat(kFALSE);
	gStyle->SetOptFit(kFALSE);
	gStyle->SetErrorX(0);
	TH1D* hNmatched = (TH1D*)fMCPPb->Get("hNmatched");
	TH1D* hdeltaR = (TH1D*)fMCPPb->Get("hdeltaR");
	TH2F* hptdeltaptfrcmatch1 = (TH2F*)fMCPPb->Get("hptdeltaptfrcmatch1");
	TH2F* hptdeltaptfrcmatch20 = (TH2F*)fMCPPb->Get("hptdeltaptfrcmatch20");
	TH2F* hptdeltaptfrcmatch21 = (TH2F*)fMCPPb->Get("hptdeltaptfrcmatch21");
	TH2F* hptgenptmatch1 = (TH2F*)fMCPPb->Get("hptgenptmatch1");
	TH2F* hptgenptmatch20 = (TH2F*)fMCPPb->Get("hptgenptmatch20");
	TH2F* hptgenptmatch21 = (TH2F*)fMCPPb->Get("hptgenptmatch21");
	hdeltaR->Rebin(10);
	TCanvas *c1 = new TCanvas("c1","c1",600,600);
	TCanvas *c2 = new TCanvas("c2","c2",600,600);
	TCanvas *c3 = new TCanvas("c3","c3",600,600);
	TCanvas *c4 = new TCanvas("c4","c4",600,600);
	TLatex tl;
	tl.SetNDC();
	tl.SetTextSize(0.04);
	c1->cd()->SetLogy();
	hFrame = new TH1D("hFrame","hFrame",1000,0,1000);
	hFrame->SetTitle("");
	hFrame->GetXaxis()->SetTitle("matched gen");
	hFrame->GetYaxis()->SetTitle("Number of jets");
	hFrame->GetXaxis()->SetRangeUser(0,4);
	hFrame->GetYaxis()->SetRangeUser(1,1e9);
	hFrame->DrawCopy();
	fixedFontHist(hFrame,1.2,1.4);
	hNmatched->SetMarkerSize(1.2);
	hNmatched->SetMarkerStyle(20);
	hNmatched->Draw("Psame");
	c2->cd()->SetLogy();
	hFrame1 = new TH1D("hFrame1","hFrame1",100,0,10);
	fixedFontHist(hFrame1,1.2,1.4);
	hFrame1->SetTitle("");
	hFrame1->GetXaxis()->SetTitle("#Delta R");
	hFrame1->GetYaxis()->SetTitle("Number of jets");
	hFrame1->GetXaxis()->SetRangeUser(0,10);
	hFrame1->GetYaxis()->SetRangeUser(1,1e9);
	hFrame1->DrawCopy();
	hdeltaR->SetMarkerSize(1.2);
	hdeltaR->SetMarkerStyle(20);
	hdeltaR->Draw("Psame");
	TLine *l = new TLine(0.3,0,0.3,1e9);
	l->SetLineStyle(2);
	l->Draw("same");	
	c3->cd()->SetLogz();
	c3->SetRightMargin(0.12);
	hFrame2 = new TH2F("hFrame2","hFrame2",1000,0,1000,100,0.,10.);
	fixedFontHist(hFrame2,1.2,1.3);
	hFrame2->SetTitle("");
	hFrame2->GetXaxis()->SetTitle("p^{reco}_{T}");
	hFrame2->GetYaxis()->SetTitle("|p^{reco}_{T}-p^{gen}_{T}|/p^{reco}_{T}");
	hFrame2->GetXaxis()->SetRangeUser(0,1000);
	hFrame2->GetYaxis()->SetRangeUser(0,10);
	hFrame2->DrawCopy();
	tl.DrawLatex(0.4,0.4,"One jet matched case");

	hptdeltaptfrcmatch1->Draw("colz same");
	c4->cd()->SetLogz();
	c4->SetRightMargin(0.12);
	hFrame3 = new TH2F("hFrame3","hFrame3",1000,0,1000,100,0.,1000.);
	fixedFontHist(hFrame2,1.2,1.3);
	hFrame3->SetTitle("");
	hFrame3->GetXaxis()->SetTitle("p^{reco}_{T}");
	hFrame3->GetYaxis()->SetTitle("p^{gen}_{T}");
	hFrame3->GetXaxis()->SetRangeUser(0,1000);
	hFrame3->GetYaxis()->SetRangeUser(0,1000);
	hFrame3->DrawCopy();
	tl.DrawLatex(0.5,0.3,"One jet matched case");

	hptgenptmatch1->Draw("colz same");
	/*
	c5->cd()->SetLogz();
	c5->SetRightMargin(0.12);
	hFrame4 = new TH1D("hFrame4","hFrame4",1000,0,1000);
	fixedFontHist(hFrame2,1.2,1.3);
	hFrame4->SetTitle("");
	hFrame4->GetXaxis()->SetTitle("p^{reco}_{T}");
	hFrame4->GetYaxis()->SetTitle("cross section");
	hFrame4->GetXaxis()->SetRangeUser(0,1000);
	hFrame4->GetYaxis()->SetRangeUser(1e-9,1e-2);
	hFrame4->DrawCopy();

	jetpt_fake->Draw("colz same");
*/
	c1->Print("pic/hNmatched.png");
	c2->Print("pic/hdeltaR.png");
	c3->Print("pic/ptvsdeltaptfraction.png");
	c4->Print("pic/ptvsgenpt.png");
}

