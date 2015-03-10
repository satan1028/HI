#include "../../../Quality/root_setting.h"
#include "../../produceandcheck/file.h"
void DrawSpike(){
    gStyle->SetOptStat(0);
    TCanvas *c1  = new TCanvas();
    TCanvas *c2  = new TCanvas();
    TH2F* Spikeetaphi = (TH2F*)fDataPPbJetIDids->Get("Spikeetaphi");
    TH2F* Spikeetapt = (TH2F*)fDataPPbJetIDids->Get("Spikeetapt");
    c1->cd();
    c1->SetLogz();
    Spikeetaphi->Rebin2D(10,5);
    Spikeetaphi->SetTitle("");
    Spikeetaphi->GetXaxis()->SetTitle("jet_#eta");
    Spikeetaphi->GetYaxis()->SetTitle("jet_#phi");
    Spikeetaphi->SetMaximum(5e4);
    Spikeetaphi->SetMinimum(1);
    Spikeetaphi->GetXaxis()->SetRangeUser(-3.5,3);
    Spikeetaphi->GetYaxis()->SetRangeUser(-4,4);
    Spikeetaphi->Draw("colz");
    c2->cd();
    c2->SetLogz();
    c2->SetLogy();
    Spikeetapt->SetTitle("");
    Spikeetapt->Rebin2D(10,10);
    Spikeetapt->GetXaxis()->SetTitle("jet_#eta");
    Spikeetapt->GetYaxis()->SetTitle("jet_p_{T}");
    Spikeetapt->SetMaximum(5e4);
    Spikeetapt->SetMinimum(1);
    Spikeetapt->GetXaxis()->SetRangeUser(-3.5,3);
    Spikeetapt->GetYaxis()->SetRangeUser(28,599);
    Spikeetapt->GetYaxis()->SetMoreLogLabels();
    Spikeetapt->GetYaxis()->SetNoExponent();
    Spikeetapt->Draw("colz");
    bool save=1;
    if(save){
        c1->Print("Spikeetaphi.gif");
        c2->Print("Spikeetapt.gif");
    }
}

