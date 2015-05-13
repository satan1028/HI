#include "/home/xuq7/HI/jetRpA/RpA/Quality/root_setting.h"
void plotv2vseta_4p(){

const int ntotbin=4;
const int trkpointmin[ntotbin] = {120,150,185,220};
const int trkpointmax[ntotbin] = {150,185,220,260};
c1 = new TCanvas("c1"," ",1200,350);
makeMultiPanelCanvas(c1,4,1,0,0,0.15,0.15,0.01);
    gStyle->SetOptFit(1);
    gStyle->SetOptStat(0);
    gStyle->SetOptTitle(0);
    gStyle->SetErrorX(0);
    TH1D *hFrame = new TH1D("","",80,-3,3);
    hFrame->SetTitle("");
    hFrame->SetTitle("v_{2} vs #eta");
    hFrame->GetXaxis()->SetTitle("#eta");
    hFrame->GetYaxis()->SetTitle("v_{2}");	
    hFrame->GetXaxis()->SetTitleSize(0.06);
    hFrame->GetYaxis()->SetTitleSize(0.06);
    hFrame->GetXaxis()->SetLabelSize(0.06);
    hFrame->GetYaxis()->SetLabelSize(0.06);
    hFrame->GetXaxis()->CenterTitle();
    hFrame->GetYaxis()->CenterTitle();
    hFrame->GetYaxis()->SetNdivisions(505);
    hFrame->GetXaxis()->SetRangeUser(-2.5,2.5);
    hFrame->SetMaximum(0.18);

int shift=5;
int xbin=0;
for(int i=shift;i<shift+ntotbin;i++){
        int t = ntotbin-(i-shift);
	//TFile *fProderr = TFile::Open(Form("M%d%d/mergedv_Prod2_sub.root",trkpointmax[i],trkpointmin[i]));
	TFile *fProd = TFile::Open(Form("M%d%d/mergedv_Prod2_eta.root",trkpointmax[t-1],trkpointmin[t-1]));
	//TVectorD *vecDv2_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/vmeanmean",ibin));
	//TVectorD *vecDv2err_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/sigmavmeanmean",ibin));
	//TVectorD *vecDavgeta_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/avgavgeta",ibin));
	
	TVectorD *vecDv2_Prod = (TVectorD*)fProd->Get(Form("D_%d/vmean",xbin));
	TVectorD *vecDv2err_Prod = (TVectorD*)fProd->Get(Form("D_%d/deltavmean",xbin));
	TVectorD *vecDavgeta_Prod = (TVectorD*)fProd->Get(Form("D_%d/avgeta",xbin));

	//double *avgeta_Proderr = vecDavgeta_Proderr->GetMatrixArray();
	//double *v2_Proderr = vecDv2_Proderr->GetMatrixArray();
	//double *v2err_Proderr = vecDv2err_Proderr->GetMatrixArray();

	double *avgeta_Prod = vecDavgeta_Prod->GetMatrixArray();
	double *v2_Prod = vecDv2_Prod->GetMatrixArray();
	double *v2err_Prod = vecDv2err_Prod->GetMatrixArray();
	int neta = vecDavgeta_Prod->GetNrows();
	
	c1->cd(t);
	//if(i!=ntotbin-1)
	//TGraphErrors *gr24=new TGraphErrors(neta24,eta,v24[i],0,v24err[i]);
	TGraphErrors *grProd=new TGraphErrors(neta,avgeta_Prod,v2_Prod,0,v2err_Prod);
	//gr24->SetMarkerSize(1.3);
	//gr24->SetMarkerColor(1);
	//gr24->SetMarkerStyle(20);
	grProd->SetMarkerSize(1.5);
	grProd->SetMarkerStyle(20);
	grProd->SetMarkerColor(4);
	grProd->SetLineColor(4);
	hFrame->Draw();
	//gr24->Draw("Psame");
	grProd->Draw("Psame");
	TLegend *tl = new TLegend(0.4,0.8,0.7,0.85);
	tl->SetFillColor(0);
	tl->SetBorderSize(0);
	tl->SetTextSize(0.05);
	//tl->AddEntry(gr24,"v2 4-particle cum","lp");
	tl->AddEntry(grProd,"v2{LYZ}","lp");
            TLatex *tlx0 = new TLatex(0.2,0.85,Form("CMS pPb #sqrt{s_{NN}} = 5.02TeV"));
	tlx0->SetNDC();
	tlx0->SetTextSize(0.065);
	if(t==1)
	tlx0->Draw("same");
	if(t==1) 
		TLatex *tlx2 = new TLatex(0.6,0.2,Form("%d<N_{trk}^{offline}<%d",trkpointmin[t-1],trkpointmax[t-1]));
	else
		TLatex *tlx2 = new TLatex(0.5,0.2,Form("%d<N_{trk}^{offline}<%d",trkpointmin[t-1],trkpointmax[t-1]));
	if(i-shift==1) tl->Draw("same");
	tlx2->SetNDC();
	tlx2->SetTextSize(0.055);
	tlx2->Draw("same");
	fProd->Close();
        //TLatex *tlx1 = new TLatex(0.12,0.25,Form("%.1f<p_{T}<%.1f (GeV/c)",0.3,6.0));
	//tlx1->SetNDC();
	//tlx1->SetTextSize(0.045);
        }
	//tlx1->Draw("same");
	c1->Print("v2vseta_4p.png");
	c1->Print("v2vseta_4p.pdf");
}

