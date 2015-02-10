void DrawhiBin(){
    TFile *f = new TFile("/cms/store/user/qixu/centrality/software/Hydjet_5020GMB_test/eventtree_checkdup.root","ReadOnly");
    TTree *tree = (TTree*)f->Get("hiEvtAnalyzer/HiTree");
    Int_t hiBin;
    TH1D* hbin = new TH1D("hiBin","hiBin",200,0,200);
    TH1D* hFrame=new TH1D("","",200,0,200);
    tree->SetBranchAddress("hiBin",&hiBin);
    for(int i=0;i<tree->GetEntries();i++){
        tree->GetEntry(i);
        hbin->Fill(hiBin);
    }
    TCanvas *c1 = new TCanvas();
    c1->SetLogx();
/*    hFrame->SetTitle("");
    hFrame->GetXaxis()->SetTitleSize(0.05);
    hFrame->GetYaxis()->SetTitleSize(0.05);
    hFrame->GetXaxis()->SetTitle("Centrality");
    hFrame->GetYaxis()->SetTitle("# of event");
    hFrame->GetXaxis()->SetLimits(0,200);
    hFrame->GetYaxis()->SetRangeUser(10,1000);
    hFrame->Draw();*/
    hbin->SetMarkerStyle(24);
    hbin->SetMarkerSize(1.0);
    hbin->SetMarkerColor(1);
    hbin->SetLineColor(1);
    hbin->Draw("P");
    c1->SaveAs("hiBin_Dupcheck.gif");
}
