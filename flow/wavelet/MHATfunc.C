void MHATfunc(){
    int ifile=0;
    TFile *f = TFile::Open(Form("/cms/store/user/qixu/flow/STEG/pPbDataV200m100/vndata_50k_%d.root",ifile));
    TTree *t = (TTree*)f->Get("tree");
    const int nbinx=100;
    const int nbiny=100;
    Float_t eta[1000],phi[1000];
    int n;
    t->SetBranchAddress("etag",eta);
    t->SetBranchAddress("phig",phi);
    t->SetBranchAddress("n",&n);
    Int_t N = t->GetEntries();
    double W[nbinx][nbiny] = {};
    double a[nbinx], b[nbiny];
    for(int ia=0; ia<2;ia+=0.02){
    	for(int ib=-3; ib<3;ib+=0.06){
    for(int ievt=0;ievt<N;ievt++){
        t->GetEntry(ievt);
       for(int imult = 0;imult<n; imult++){
    //    h->Fill(eta[imult],phi[imult]);
    	W[i][j] += 1./n*TMath::Sqrt(1./a)*MHATg2((eta[imult]-b)/a);
       }
    }
    W[i][j]/=N;
    b[j] = ib;
    j++;
    }
    a[i] = ia;
    cout<<i<<endl;
    i++;
    }

    TGraph2D* gr2d = new TGraph2D(nbinx*nbiny,a,b,W);
    gr2d->Draw("surf1");

}

double MHATg2(double x){
     return (1-x*x)*(TMath::Exp(-x*x/2));
}

