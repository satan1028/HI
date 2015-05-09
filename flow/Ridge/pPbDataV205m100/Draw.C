#include "par.h"
void Draw(){
    gStyle->SetOptStat(kFALSE);
    TFile *f = TFile::Open(Form("Ana_merged.root"));
    int xbin=0;
    TH2F* hr = (TH2F*)f->Get(Form("D_%d/hr",xbin));
    TH2F* s = (TH2F*)f->Get(Form("D_%d/s",xbin));
    TH2F* b = (TH2F*)f->Get(Form("D_%d/b",xbin));
    TH2F* hFrame = new TH2F("hFrame","",detastep,detamin,detamax,dphistep,dphimin,dphimax);
    hFrame->Clear();
    TVectorD* vavgtrk = (TVectorD*)f->Get(Form("avgtrk"));
    hFrame->SetTitle("");
    hFrame->GetXaxis()->SetRangeUser(-4,4);
    hFrame->GetYaxis()->SetRangeUser(-1,4);
 //   hr->GetZaxis()->SetRangeUser(0,2);
    hFrame->GetXaxis()->SetTitle("#Delta#eta");
    hFrame->GetXaxis()->CenterTitle();
    hFrame->GetYaxis()->SetTitle("#Delta#phi");
    hFrame->GetYaxis()->CenterTitle();
    hFrame->GetZaxis()->SetTitle("#frac{1}{N_{trig}}#frac{d^{2}N^{pair}}{d#Delta#eta d#Delta#phi}");
    TCanvas *c1 = new TCanvas();
    hFrame->Draw("surf1");
    hr->Draw("same surf1");
    TLatex l;
    l.SetNDC();
    l.SetTextSize(0.04);
    l.DrawLatex(0.1,0.9,Form("%d < N_{trk}^{offline} <%d",trkbin[xbin],trkbin[xbin+1]));
    l.DrawLatex(0.5,0.9,Form("Average N_{trk}^{offline} = %.1f",(*vavgtrk)[xbin]));
    l.DrawLatex(0.1,0.85,Form("%.1f < p_{T}^{trig} < %.1f",pttrigmin,pttrigmax));
    l.DrawLatex(0.5,0.85,Form("%.1f < #eta^{trig} < %.1f",etatrigmin,etatrigmax));
    l.DrawLatex(0.1,0.80,Form("%.1f < p_{T}^{ass} < %.1f",ptassmin,ptassmax));
    l.DrawLatex(0.5,0.80,Form("%.1f < #eta^{ass} < %.1f",etaassmin,etaassmax));
    c1->Print("ridgev2.png");
    TCanvas *c2 = new TCanvas();
    hFrame->Draw("surf2");
    s->Draw("same surf1");
    l.DrawLatex(0.5,0.80,Form("signal"));
    c2->Print("signal_v2.png");
    TCanvas *c3 = new TCanvas();
    hFrame->Draw("surf2");
    b->Draw("same surf1");
    l.DrawLatex(0.5,0.80,Form("background"));
    c3->Print("background_v2.png");
}

