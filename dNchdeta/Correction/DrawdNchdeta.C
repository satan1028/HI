void DrawdNchdeta(){
    gStyle->SetOptStat(kFALSE);
    TString MCtype="Hijing";
    TCanvas *c1 = new TCanvas("c1","c1",600,600);
    TH1D* hHijing_reco = Draw(0,MCtype,1,20);
    //TH1D* hHijing_reco_nowtrack = Draw(2,MCtype,1,24);
    TH1D* hHijing_gen = Draw(-1,MCtype,2,24);
    TH1D* hdata = Draw(1,MCtype,4,32);
    TH1D* hFrame = new TH1D("","",100,-3,3);
    hFrame->SetTitle("");
    hFrame->GetXaxis()->SetTitle("#eta_{lab}");
    hFrame->GetYaxis()->SetTitle("#frac{1}{N_{evt}}#frac{dN_{ch}}{d#eta}");
    hFrame->GetYaxis()->SetRangeUser(0,50);
    hFrame->GetYaxis()->SetTitleOffset(1.1);
    TLegend *leg = new TLegend(0.3,0.75,0.85,0.88);
    leg->SetBorderSize(0);
    leg->SetFillColor(0);
    leg->SetTextSize(0.025);
    leg->AddEntry(hHijing_reco,"MC reco from Hijing","lp");
   // leg->AddEntry(hHijing_reco_nowtrack,"MC reco from Hijing without track","lp");
    leg->AddEntry(hHijing_gen,"MC gen from Hijing","lp");
    leg->AddEntry(hdata,"Data","lp");
    hFrame->Draw();
    hHijing_reco->Draw("Psame");
   // hHijing_reco_nowtrack->Draw("Psame");
    hHijing_gen->Draw("Psame");
    hdata->Draw("Psame");
    leg->Draw("same");

    c1->Print(Form("dNchdeta_%s_pt1.png",MCtype.Data()));
}
TH1D* Draw(int type, TString MCtype, int color, int marker){
    TString stype;
    if(type==-1) stype=Form("%s_gen",MCtype.Data());        else if(type==0) stype=Form("%s_recoMC",MCtype.Data()); else if(type==1) stype="data"; else stype=Form("%s_recoMC_nowtrack",MCtype.Data());
    TFile *f = new TFile(Form("Corr%s_pt1.root",stype.Data()),"ReadOnly");
    
    TH1D* dNchdeta = (TH1D*)f->Get("dNchdeta");
    dNchdeta->SetMarkerStyle(marker);
    dNchdeta->SetMarkerColor(color);
    dNchdeta->SetLineColor(color);
    dNchdeta->SetMarkerSize(1.5);

    return dNchdeta;
}



