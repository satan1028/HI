#include "/home/xuq7/HI/jetRpA/RpA/Quality/root_setting.h"
void plotv2vseta(){

const int ntotbin=5;

const int trkpointmin[ntotbin] = {120,150,185,220,260};
const int trkpointmax[ntotbin] = {150,185,220,260,300};
int ibin=0;
c1 = new TCanvas("c1"," ",1200,700);
makeMultiPanelCanvas(c1,3,2,0,0,0.25,0.2,0.03);
    gStyle->SetOptFit(1);
    gStyle->SetOptStat(0);
    gStyle->SetOptTitle(0);
    gStyle->SetErrorX(0);
    TH1D *hFrame = new TH1D("","",60,-3,3);
    hFrame->SetTitle();
    hFrame->GetXaxis()->SetTitle("#eta");
    hFrame->GetYaxis()->SetTitle("v_{2}");	
    hFrame->GetXaxis()->SetTitleSize(0.06);
    hFrame->GetYaxis()->SetTitleSize(0.06);	
    hFrame->GetXaxis()->SetLabelSize(0.06);
    hFrame->GetYaxis()->SetLabelSize(0.06);	
    hFrame->GetXaxis()->CenterTitle();
    hFrame->GetYaxis()->CenterTitle();	
    hFrame->GetXaxis()->SetRangeUser(-2.5,2.5);
    hFrame->SetMaximum(0.18);

for(int i=0;i<ntotbin;i++){
	TFile *fProderr = TFile::Open(Form("M%d%d/mergedv_Prod2_eta_sub.root",trkpointmax[i],trkpointmin[i]));
	//TFile *fProd = TFile::Open(Form("M%d%d/mergedv_Prod2_eta.root",trkpointmax[i],trkpointmin[i]));
	TVectorD *vecDv2_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/vmeanmean",ibin));
	TVectorD *vecDv2err_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/sigmavmeanmean",ibin));
	TVectorD *vecDavgeta_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/avgavgeta",ibin));
	
	//TVectorD *vecDv2_Prod = (TVectorD*)fProd->Get(Form("D_%d/vmean",ibin));
	//TVectorD *vecDv2err_Prod = (TVectorD*)fProd->Get(Form("D_%d/deltavmean",ibin));
	//TVectorD *vecDavgeta_Prod = (TVectorD*)fProd->Get(Form("D_%d/avgeta",ibin));
	double *avgeta_Proderr = vecDavgeta_Proderr->GetMatrixArray();
	double *v2_Proderr = vecDv2_Proderr->GetMatrixArray();
	double *v2err_Proderr = vecDv2err_Proderr->GetMatrixArray();

	//double *avgeta_Prod = vecDavgeta_Prod->GetMatrixArray();
	//double *v2_Prod = vecDv2_Prod->GetMatrixArray();
	//double *v2err_Prod = vecDv2err_Prod->GetMatrixArray();
	int neta = vecDavgeta_Proderr->GetNrows();
	
	c1->cd(i+1);
	//TGraphErrors *grProd=new TGraphErrors(neta,avgeta_Prod,v2_Prod,0,v2err_Prod);
	TGraphErrors *grProd=new TGraphErrors(neta,avgeta_Proderr,v2_Proderr,0,v2err_Proderr);
	grProd->SetMarkerStyle(20);
	grProd->SetMarkerSize(1.4);
	grProd->SetMarkerColor(4);
	grProd->SetLineColor(4);
	hFrame->Draw();
	grProd->Draw("Psame");
	TLegend *tl = new TLegend(0.4,0.5,0.7,0.65);
	tl->SetFillColor(0);
	tl->SetBorderSize(0);
	tl->SetTextSize(0.05);
	tl->AddEntry(grProd,"v_2{LYZ}","lp");
	if(i==0 || i==3) 
		TLatex *tlx2 = new TLatex(0.3,0.8,Form("%d<Ntrkoffline<%d",trkpointmin[i],trkpointmax[i]));
	else
		TLatex *tlx2 = new TLatex(0.1,0.8,Form("%d<Ntrkoffline<%d",trkpointmin[i],trkpointmax[i]));
	tlx2->SetNDC();
	tlx2->Draw("same");
	//fProd->Close();
	}
	c1->cd(ntotbin+1);
	TLatex *tlx0 = new TLatex(0.12,0.3,Form(""));
        TLatex *tlx1 = new TLatex(0.12,0.25,Form("%.1f<p_{T}<%.1f (GeV/c)",0.3,6.0));
	tlx0->SetNDC();
	tlx1->SetNDC();
	tlx0->SetTextSize(0.045);
	tlx1->SetTextSize(0.045);
	tlx2->SetTextSize(0.045);
        hFrame->Draw();
	//tlx0->Draw("same");
	tlx1->Draw("same");
	tl->Draw("same");
	c1->Print("v2vseta.png");
	c1->Print("v2vseta.pdf");

}

