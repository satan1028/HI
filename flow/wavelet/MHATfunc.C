void MHATfunc(){
    int ifile=0;
     TFile *f = TFile::Open(Form("/cms/store/user/qixu/flow/STEG/pPbDataV200m100/vndata_50k_%d.root",ifile));
    TTree *t = (TTree*)f->Get("tree");
    const int nbinx=100;
    const int nbiny=100;
    Float_t eta[1000]={1,2.75,3.25,5,6,7};
    Float_t phi[1000];
    int n=6;
//    t->SetBranchAddress("etag",eta);
//    t->SetBranchAddress("phig",phi);
//    t->SetBranchAddress("n",&n);
//    Int_t N = t->GetEntries();
    double W[nbinx][nbiny] = {};
    double a[nbinx], b[nbiny];
    TGraph2D* gr2d = new TGraph2D(nbinx*nbiny);
    int i=0;
    for(double ia=0.02; ia<=2;ia+=0.02){
        int j=0;
    	for(double ib=0; ib<8;ib+=0.08){
    for(int ievt=0;ievt<1;ievt++){
 //   if(ievt%10000==0)        cout<<"Processing "<<ievt<<" events"<<endl;
  //      t->GetEntry(ievt);
       for(int imult = 0;imult<n; imult++){
    //    h->Fill(eta[imult],phi[imult]);
    	W[i][j] += 1./n*TMath::Sqrt(1./ia)*MHATg2((eta[imult]-ib)/ia);
       }
    }
//    W[i][j]/=N;
    gr2d->SetPoint(j+i*nbiny,ia,ib,W[i][j]);
    b[j] = ib;
    j++;
    }
    a[i] = ia;
    cout<<i<<endl;
    i++;
    }

    gr2d->Draw("colz");

}

double MHATg2(double x){
     return (1-x*x)*(TMath::Exp(-x*x/2));
}

