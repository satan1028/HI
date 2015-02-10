void Drawdistr(){
    gStyle->SetOptStat(kFALSE);
    gStyle->SetErrorX(0);
    TString fs1 = "/cms/store/user/qixu/centrality/software/Hydjet_5020GMB_test/eventtree_checkdup.root";
    TString fs2 = "/cms/store/user/qixu/centrality/software/Hydjet_5020GMB_test/eventtree.root";
    TString par = "hiHFplusEta4";
    TCanvas *c1 = new TCanvas();
    if(par=="hiBin")
        c1->SetLogx();
    TH1D* hbin1 = Draw(par,fs1,20,1);
    TH1D* hbin2 = Draw(par,fs2,24,2);
    hbin1->Draw();
    hbin2->Draw("same");
    TLegend *tl = new TLegend(0.5,0.7,0.8,0.8);
    tl->SetBorderSize(0);
    tl->SetFillColor(0);
    tl->AddEntry(hbin1,"check Duplicate");
    tl->AddEntry(hbin2,"non check Duplicate");
    tl->Draw("same");
    c1->SaveAs("hHFplus4_Compare.gif");
}

TH1D* Draw(TString parname, TString filename, int marker, int color){
    TFile *f = new TFile(filename,"ReadOnly");
    TTree *tree = (TTree*)f->Get("hiEvtAnalyzer/HiTree");
    if(parname=="hiBin"){
        Int_t par;
        TH1D* h = new TH1D("hbin","hbin",200,0,200);
        h->GetXaxis()->SetTitle("hiBin");
    }
    if(parname.Contains("HF")){
        Float_t par;
        TH1D* h = new TH1D(Form("h%s",parname.Data()),Form("h%s",parname.Data()),150,0,150);
        h->GetXaxis()->SetTitle(parname);
    }
    tree->SetBranchAddress(parname,&par);
    h->Sumw2();
    h->GetYaxis()->SetTitle("# of events");
    for(int i=0;i<tree->GetEntries();i++){
        tree->GetEntry(i);
        h->Fill(par);
    }
    h->SetMarkerSize(1.0);
    h->SetMarkerStyle(marker);
    h->SetMarkerColor(color);
    h->SetLineColor(color);
    return h;
}

