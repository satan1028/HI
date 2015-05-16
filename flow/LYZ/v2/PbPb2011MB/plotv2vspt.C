#include "par.h"
#include "/home/xuq7/HI/jetRpA/RpA/Quality/root_setting.h"
void plotv2vspt(){

const int ntotbin=5;
const int npt24=9;
const double pt[npt24]={0.4,0.7,1.2,1.7,2.2,2.7,3.4,4.4,5.4};
const double v24[5][npt24]={
{0.02809,0.04599,0.06869,0.08440,0.09715,0.09357,0.07924,0.04701,0.01620},
{0.02682,0.04447,0.06771,0.08586,0.09932,0.09782,0.08714,0.06139,0.05068},
{0.02582,0.04324,0.06644,0.08396,0.09725,0.1032,0.09603,0.07668,0.0605},
{0.02507,0.04214,0.06471,0.08294,0.09241,0.09917,0.09663,0.08479,0.06271},
};
const double v24err[5][npt24]={
{0.0007,0.00057,0.00085,0.0014,0.0022,0.0034,0.0041,0.0072,0.011},
{0.00058,0.00043,0.00063,0.00099,0.0016,0.0025,0.0031,0.0054,0.0086},
{0.00053,0.00038,0.00056,0.00088,0.0014,0.0022,0.0027,0.0049,0.0076},
{0.00079,0.00057,0.00084,0.0013,0.002,0.0032,0.004,0.0075,0.012},
};
const double v26[5][npt24]={
    {0.0436647,0.0766372,0.115253,0.134962,0.138116,0.132017,0.129223,0.0959764,0.159984},
    {0.0427129,0.07916,0.119421,0.142728,0.147721,0.142104,0.138136,0.111479,0.0930553},
    {0.0439986,0.0812754,0.121722,0.141086,0.144929,0.14576,0.141362,0.103954,0.118998},
    {0.045338,0.081817,0.124592,0.145770,0.148010,0.151483,0.135710,0.115941,0.088239}
};
const double v26err[5][npt24]={
    {0.00117633,0.00172456,0.00243925,0.00331087,0.00340786,0.00552076,0.0053438,0.00634,0.023902},
    {0.000714298,0.00115609,0.00178786,0.00201899,0.00247538,0.0042914,0.00441189,0.00375012,0.00991865},
    {0.0007454,0.00108873,0.00211174,0.00242773,0.002964,0.00406841,0.00325586,0.0105999,0.0164428},
    {0.000950693,0.00149145,0.00207434,0.00228235,0.0025587,0.00320457,0.00459367,0.00899185,0.00916074}
};
const double v28[5][npt24]={
    {0.0413359,0.0745479,0.111287,0.1315,0.13296,0.120331,0.132252,0.105274,0.158618},
    {0.0424299,0.0761756,0.115879,0.137643,0.138677,0.13397,0.125922,0.103297,0.115589},
    {0.0424748,0.079193,0.118646,0.143186,0.147939,0.139611,0.137666,0.118945,0.0998064},
    {0.044857,0.081403,0.122831,0.143983,0.145980,0.150662,0.140130,0.104239,0.101058}
};
const double v28err[5][npt24]={
    {0.00174636,0.00232066,0.00378455,0.00539576,0.00686651,0.0070001,0.00972887,0.0107575,0.0177152},
    {0.0014467,0.00177893,0.00310776,0.00351237,0.00391883,0.00406891,0.00434652,0.00735751,0.0165999},
    {0.000964082,0.00149995,0.00232247,0.00286737,0.00303328,0.00467016,0.00455719,0.00512068,0.00835018},
    {0.000613315,0.00112984,0.0017138,0.00182123,0.00204996,0.0027923,0.00233936,0.00455531,0.00993196}
};

c1 = new TCanvas("c1"," ",1200,700);
makeMultiPanelCanvas(c1,3,2,0,0,0.25,0.2,0.03);
    gStyle->SetOptFit(1);
    gStyle->SetOptStat(0);
    gStyle->SetOptTitle(0);
    gStyle->SetErrorX(0);
    TH1D *hFrame = new TH1D("","",80,-1,7);
    hFrame->SetTitle("v_{2} vs momentum");
    hFrame->GetXaxis()->SetTitle("p_{T} (GeV/c)");
    hFrame->GetYaxis()->SetTitle("v_{2}");	
    hFrame->GetXaxis()->SetTitleSize(0.06);
    hFrame->GetYaxis()->SetTitleSize(0.06);
    hFrame->GetXaxis()->SetLabelSize(0.06);
    hFrame->GetYaxis()->SetLabelSize(0.06);
    hFrame->GetXaxis()->CenterTitle();
    hFrame->GetYaxis()->CenterTitle();
    hFrame->GetXaxis()->SetRangeUser(-0.3,6.3);
    hFrame->SetMaximum(0.35);
    hFrame->SetMinimum(0);
int shift=5;
for(int i=shift;i<shift+ntotbin;i++){
	//TFile *fProderr = TFile::Open(Form("M%d%d/mergedv_Prod2_sub.root",trkpointmax[i],trkpointmin[i]));
	TFile *fProd = TFile::Open(Form("mergedv_Prod2.root"));
	//TVectorD *vecDv2_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/vmeanmean",ibin));
	//TVectorD *vecDv2err_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/sigmavmeanmean",ibin));
	//TVectorD *vecDavgpt_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/avgavgpt",ibin));
	
	TVectorD *vecDv2_Prod = (TVectorD*)fProd->Get(Form("D_%d/vmean",nbin-i));
	TVectorD *vecDv2err_Prod = (TVectorD*)fProd->Get(Form("D_%d/deltavmean",nbin-i));
	TVectorD *vecDavgpt_Prod = (TVectorD*)fProd->Get(Form("D_%d/avgpt",nbin-i));

	//double *avgpt_Proderr = vecDavgpt_Proderr->GetMatrixArray();
	//double *v2_Proderr = vecDv2_Proderr->GetMatrixArray();
	//double *v2err_Proderr = vecDv2err_Proderr->GetMatrixArray();

	double *avgpt_Prod = vecDavgpt_Prod->GetMatrixArray();
	double *v2_Prod = vecDv2_Prod->GetMatrixArray();
	double *v2err_Prod = vecDv2err_Prod->GetMatrixArray();
	int npt = vecDavgpt_Prod->GetNrows();
	
	c1->cd(i-shift+1);
	//if(i!=ntotbin-1)
	//TGraphErrors *gr24=new TGraphErrors(npt24,pt,v24[i],0,v24err[i]);
	TGraphErrors *grProd=new TGraphErrors(npt,avgpt_Prod,v2_Prod,0,v2err_Prod);
	TGraphErrors *gr26=new TGraphErrors(npt24,pt,v26[i-shift],0,v26err[i-shift]);
	TGraphErrors *gr28=new TGraphErrors(npt24,pt,v28[i-shift],0,v28err[i-shift]);
	//gr24->SetMarkerSize(1.3);
	//gr24->SetMarkerColor(1);
	//gr24->SetMarkerStyle(20);
	grProd->SetMarkerSize(1.4);
	grProd->SetMarkerStyle(20);
	grProd->SetMarkerColor(6);
	grProd->SetLineColor(6);
	gr26->SetMarkerSize(1.4);
	gr26->SetMarkerColor(4);
	gr26->SetMarkerStyle(34);
	gr26->SetLineColor(4);
	gr28->SetMarkerSize(1.4);
	gr28->SetMarkerColor(2);
	gr28->SetMarkerStyle(33);
	gr28->SetLineColor(2);
	hFrame->Draw();
	//gr24->Draw("Psame");
	grProd->Draw("Psame");
	if((i-shift)!=ntotbin-1){
	gr26->Draw("Psame");
	gr28->Draw("Psame");
        }
	TLegend *tl = new TLegend(0.4,0.5,0.7,0.65);
	tl->SetFillColor(0);
	tl->SetBorderSize(0);
	tl->SetTextSize(0.05);
	//tl->AddEntry(gr24,"v2 4-particle cum","lp");
	tl->AddEntry(grProd,"v_{2}{LYZ}","lp");
	tl->AddEntry(gr26,"v_{2}{6} cumulant","lp");
	tl->AddEntry(gr28,"v_{2}{8} cumulant","lp");
	if(i-shift==0 || i-shift==3) 
		TLatex *tlx2 = new TLatex(0.3,0.8,Form("%d<Ntrkoffline<%d",trkbin[nbin-i+1],trkbin[nbin-i]));
	else
		TLatex *tlx2 = new TLatex(0.1,0.8,Form("%d<Ntrkoffline<%d",trkbin[nbin-i+1],trkbin[nbin-i]));
	tlx2->SetNDC();
	tlx2->Draw("same");
	fProd->Close();
	}
	c1->cd(ntotbin+1);
	TLatex *tlx0 = new TLatex(0.12,0.3,Form("track"));
        TLatex *tlx1 = new TLatex(0.12,0.25,Form("%.1f<#eta<%.1f",-2.4,2.4));
	tlx0->SetNDC();
	tlx1->SetNDC();
	tlx0->SetTextSize(0.045);
	tlx1->SetTextSize(0.045);
	tlx2->SetTextSize(0.045);
        hFrame->Draw();
	//tlx0->Draw("same");
	tlx1->Draw("same");
	tl->Draw("same");
	c1->Print("v2vspt.png");
	c1->Print("v2vspt.pdf");

}

