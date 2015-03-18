void DauwaveD21D(){
    int ifile=0;
    TFile *f = TFile::Open(Form("/cms/store/user/qixu/flow/STEG/pPbDataV200m100/vndata_50k_%d.root",ifile));
    TTree *t = (TTree*)f->Get("tree");
    const int nbin=200;
    TH1F* h = new TH1F("h","h",nbin,0,2*TMath::Pi());
    h->Sumw2();
    Float_t pt[1000],eta[1000],phi[1000];
    int n;
    t->SetBranchAddress("ptg",pt);
    t->SetBranchAddress("etag",eta);
    t->SetBranchAddress("phig",phi);
    t->SetBranchAddress("n",&n);
    Int_t N = t->GetEntries();
    for(int ievt=0;ievt<N;ievt++){
        t->GetEntry(ievt);
       for(int imult = 0;imult<n; imult++){
        h->Fill(phi[imult]);
       }
    }
    h->Draw();
    double binc[nbin];
    for(int i=0;i<nbin;i++){
            binc[i] = h->GetBinContent(i);
        }
}
