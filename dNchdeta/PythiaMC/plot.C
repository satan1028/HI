double function(double *v, double *par){
	TF1 *gamma = new TF1("gamma","TMath::GammaDist(x,[0],0,[1])",0,100);
	TF1 *gaus = new TF1("gaus","[0]*TMath::Gaus(x,[1]-[2],[3])",0,100);
	gamma->SetParameters(par[0],par[1]);
	gaus->SetParameters(par[2],v[0],par[3],par[4]);
	TF1 *conv = new TF1("conv","gamma*gaus",0,100);
	return conv->Integral(0,v[0]);
}

void plot(){
	TFile *f = TFile::Open("/lio/lfs/cms/store/user/qixu/dNchdeta/MC/pythia6/pPbMC.root");
	TDirectory *dir = f->GetDirectory("demo");
	TH1D* hHFp4 = dir->Get("hHFp4");
	TH1D* hHFp = dir->Get("hHFp");
//	hHFp4->Rebin(10);
//	hHFp->Rebin(10);
	hHFp4->Scale(1.0/hHFp4->Integral());
	hHFp->Scale(1.0/hHFp->Integral());
	hHFp4->GetXaxis()->SetRangeUser(0,50);
	hHFp->GetXaxis()->SetRangeUser(0,50);
	TCanvas *c1= new TCanvas;
	c1->SetLogy();
	TF1 *g = new TF1("g",function,1,100,5);
	g->SetParameters(2,3,0.1,0,1);
//	hHFp->Fit("g");
	hHFp4->Fit("g","","",0,100);
	c1->Print("hHFp4FitGamma.png");
	cout<<g->GetParameter(0)<<"\t"<<g->GetParError(0)<<endl;
	cout<<g->GetParameter(1)<<"\t"<<g->GetParError(1)<<endl;
	cout<<g->GetParameter(2)<<"\t"<<g->GetParError(2)<<endl;
	cout<<g->GetParameter(3)<<"\t"<<g->GetParError(3)<<endl;
	cout<<g->GetParameter(4)<<"\t"<<g->GetParError(4)<<endl;
	cout<<g->GetNDF()<<"\t"<<g->GetChisquare()<<endl;
}
