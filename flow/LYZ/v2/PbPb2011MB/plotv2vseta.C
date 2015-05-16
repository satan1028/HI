#include "par.h"
#include "/home/xuq7/HI/jetRpA/RpA/Quality/root_setting.h"
void plotv2vseta(){
const int neta24 = 24;
//const double eta[neta24]={-2.3,-2.1,-1.9,-1.7,-1.5,-1.3,-1.1,-0.9,-0.7,-0.5,-0.3,-0.1,0.1,0.3,0.5,0.7,0.9,1.1,1.3,1.5,1.7,1.9,2.1,2.3};
const double eta[neta24]={2.3,2.1,1.9,1.7,1.5,1.3,1.1,0.9,0.7,0.5,0.3,0.1,-0.1,-0.3,-0.5,-0.7,-0.9,-1.1,-1.3,-1.5,-1.7,-1.9,-2.1,-2.3};
const double v26[5][neta24]={
    {0.0698353,0.0674578,0.0701126,0.0740889,0.0723163,0.0772272,0.0787459,0.0771181,0.0757145,0.0767567,0.0736143,0.0783684,0.0779356,0.0740544,0.0783681,0.075646,0.0765108,0.076381,0.0748234,0.0758794,0.0709415,0.0756891,0.0721829,0.0688984},
    {0.0719736,0.0744834,0.0707642,0.0797949,0.0774255,0.0751839,0.0774485,0.0809766,0.0803162,0.0795533,0.0793848,0.0786047,0.0772192,0.0806598,0.0781835,0.0785929,0.0766863,0.0749174,0.0746777,0.0767554,0.0763254,0.0721273,0.0736845,0.075026},
    {0.0774853,0.0739604,0.0779217,0.0771751,0.0785331,0.0754135,0.0814076,0.0812749,0.0815164,0.0809609,0.0773887,0.0790749,0.0811397,0.0781089,0.0810887,0.0775819,0.0818938,0.0797963,0.078027,0.0760762,0.0775883,0.07774,0.0759628,0.0770093},
    {0.074631,0.078212,0.077162,0.078795,0.081661,0.080929,0.082362,0.081479,0.082993,0.081619,0.081933,0.083040,0.082783,0.083576,0.081336,0.081846,0.082239,0.079069,0.078846,0.081326,0.077925,0.075981,0.073892,0.076535}
};
const double v26err[5][neta24]={
    {0.00202074,0.00188693,0.00234092,0.00224527,0.00277428,0.00202551,0.00225547,0.0015232,0.00222886,0.00155444,0.00352697,0.00255879,0.00164763,0.00158746,0.00191524,0.00205444,0.00349981,0.00296349,0.00222796,0.00221425,0.00173976,0.00189586,0.00264308,0.0030459},
    {0.00185746,0.00153775,0.0014702,0.00103125,0.0018447,0.00156544,0.00114703,0.00155986,0.00162496,0.00139404,0.00146171,0.00147799,0.00149658,0.00152542,0.00180672,0.00137691,0.00138118,0.00143161,0.00110545,0.00199934,0.00148097,0.00163199,0.00132512,0.00168893},
    {0.00172089,0.00221588,0.00128001,0.00165193,0.00231875,0.00180012,0.00145671,0.00179855,0.00184973,0.00233934,0.001281,0.0019083,0.00246046,0.00230096,0.00198631,0.00070524,0.00136858,0.00120981,0.00143651,0.00169002,0.0017728,0.00135688,0.00238421,0.0019525},
    {0.00157304,0.0013452,0.0012497,0.0019078,0.00191553,0.00201187,0.00188412,0.00225266,0.00141891,0.00168298,0.000861194,0.00147016,0.00144681,0.00231159,0.0020938,0.00110657,0.00191657,0.0022186,0.00172634,0.00176154,0.00193607,0.00239119,0.00179386,0.00128246}
};

const double v28[5][neta24]={
    {0.0703799,0.0632553,0.0616807,0.0680809,0.069353,0.0686975,0.0726891,0.0776879,0.0763945,0.076995,0.0784191,0.0762258,0.0771385,0.0718564,0.0716861,0.0749685,0.0725933,0.0744487,0.0671167,0.0744043,0.0746593,0.0672982,0.0648116,0.0688902},
    {0.0707066,0.0653589,0.0719127,0.0766868,0.0729991,0.0781885,0.0778864,0.0744974,0.0746715,0.076284,0.0729979,0.0762163,0.0797652,0.0748603,0.0771378,0.0734484,0.0729084,0.0767356,0.073777,0.0744072,0.0710563,0.0750633,0.0708203,0.0704283},
    {0.0728944,0.0746714,0.0697357,0.0785848,0.0773327,0.0757385,0.0781958,0.0803861,0.0791625,0.0799084,0.0777439,0.0780875,0.0766712,0.0798926,0.0774699,0.0792878,0.0772325,0.0757724,0.0748541,0.0749899,0.0749455,0.073348,0.0738717,0.0757759},
    {0.076235,0.077169,0.077348,0.078594,0.079693,0.078565,0.081069,0.081109,0.081304,0.080757,0.079852,0.081634,0.081986,0.080779,0.081515,0.080912,0.080820,0.079042,0.079806,0.079014,0.076892,0.076598,0.074468,0.076813}
};
const double v28err[5][neta24]={
    {0.00410875,0.00349733,0.00277241,0.00291892,0.00311365,0.00427795,0.00265593,0.00366801,0.00504061,0.00359895,0.00318604,0.00260679,0.00387787,0.00344256,0.00295219,0.00266175,0.00303032,0.00223042,0.00456962,0.00276932,0.00225899,0.0032795,0.00493799,0.00427078},
    {0.00232884,0.00222479,0.00207691,0.00234734,0.00253482,0.0025278,0.00292522,0.00268199,0.00255083,0.00172428,0.00329572,0.00200459,0.0023981,0.00217226,0.00255702,0.00249039,0.00254521,0.00234383,0.0020052,0.00249521,0.00227454,0.0014484,0.00193949,0.00260838},
    {0.00206888,0.00173173,0.00201329,0.0014341,0.00213552,0.00144999,0.00152124,0.00173827,0.0017869,0.00132091,0.00169224,0.00154138,0.00217968,0.00188371,0.00203254,0.00185431,0.00178061,0.00192844,0.0015147,0.00173505,0.00187276,0.00155715,0.00162744,0.00205031},
    {0.00134706,0.000783446,0.00120925,0.00113826,0.00159855,0.000929901,0.00121292,0.0016164,0.00153186,0.00131391,0.000772956,0.00126226,0.00119439,0.00145174,0.00149232,0.000718566,0.00124586,0.00155541,0.00147971,0.00144989,0.00141621,0.00145641,0.00143035,0.000977202}
};
const int ntotbin = 5;
c1 = new TCanvas("c1"," ",1200,700);
makeMultiPanelCanvas(c1,3,2,0,0,0.25,0.2,0.03);
    gStyle->SetOptFit(1);
    gStyle->SetOptStat(0);
    gStyle->SetOptTitle(0);
    gStyle->SetErrorX(0);
    TH1D *hFrame = new TH1D("","",60,-3,3);
    hFrame->SetTitle("v_{2} vs #eta");
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

    double shift=5;
for(int i=shift;i<ntotbin+shift;i++){
	//TFile *fProderr = TFile::Open(Form("M%d%d/mergedv_Prod2_sub.root",trkpointmax[i],trkpointmin[i]));
	TFile *fProd = TFile::Open(Form("mergedv_Prod2_eta.root"));
	//TFile *fProd = TFile::Open(Form("mergedv_Prod2_finer_eta.root"));
	//TVectorD *vecDv2_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/vmeanmean",ibin));
	//TVectorD *vecDv2err_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/sigmavmeanmean",ibin));
	//TVectorD *vecDavgeta_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/avgavgeta",ibin));
	
	TVectorD *vecDv2_Prod = (TVectorD*)fProd->Get(Form("D_%d/vmean",nbin-i));
	TVectorD *vecDv2err_Prod = (TVectorD*)fProd->Get(Form("D_%d/deltavmean",nbin-i));
	TVectorD *vecDavgeta_Prod = (TVectorD*)fProd->Get(Form("D_%d/avgeta",nbin-i));
	//double *avgeta_Proderr = vecDavgeta_Proderr->GetMatrixArray();
	//double *v2_Proderr = vecDv2_Proderr->GetMatrixArray();
	//double *v2err_Proderr = vecDv2err_Proderr->GetMatrixArray();

	double *avgeta_Prod = vecDavgeta_Prod->GetMatrixArray();
	double *v2_Prod = vecDv2_Prod->GetMatrixArray();
	double *v2err_Prod = vecDv2err_Prod->GetMatrixArray();
	int neta = vecDavgeta_Prod->GetNrows();
	c1->cd(i-shift+1);
	TGraphErrors *grProd=new TGraphErrors(neta,avgeta_Prod,v2_Prod,0,v2err_Prod);
	TGraphErrors *gr26=new TGraphErrors(neta24,eta,v26[i-shift],0,v26err[i-shift]);
	TGraphErrors *gr28=new TGraphErrors(neta24,eta,v28[i-shift],0,v28err[i-shift]);
	grProd->SetMarkerStyle(20);
	grProd->SetMarkerSize(1.4);
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
	grProd->Draw("Psame");
        if((i-shift)!=(ntotbin-1)){
	gr26->Draw("Psame");
	gr28->Draw("Psame");
        }
	TLegend *tl = new TLegend(0.4,0.4,0.7,0.65);
	tl->SetFillColor(0);
	tl->SetBorderSize(0);
	tl->SetTextSize(0.05);
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

