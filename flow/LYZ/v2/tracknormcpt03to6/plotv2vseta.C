#include "/home/xuq7/HI/jetRpA/RpA/Quality/root_setting.h"
void plotv2vseta(){
const int neta24 = 24;
//const double eta[neta24]={-2.3,-2.1,-1.9,-1.7,-1.5,-1.3,-1.1,-0.9,-0.7,-0.5,-0.3,-0.1,0.1,0.3,0.5,0.7,0.9,1.1,1.3,1.5,1.7,1.9,2.1,2.3};
const double eta[neta24]={2.3,2.1,1.9,1.7,1.5,1.3,1.1,0.9,0.7,0.5,0.3,0.1,-0.1,-0.3,-0.5,-0.7,-0.9,-1.1,-1.3,-1.5,-1.7,-1.9,-2.1,-2.3};
const double v26[5][neta24]={
    {0.0372967,0.0454809,0.0526946,0.040252,0.0568755,0.0402211,0.041394,0.0423501,0.0505429,0.0348172,0.046218,0.0587727,0.0377846,0.0470679,0.0422496,0.0500769,0.0503031,0.0548387,0.0572582,0.0457487,0.049558,0.046186,0.0505475,0.0394379},
    {0.0285363,0.0393923,0.0400587,0.0489756,0.0540125,0.0312662,0.0429369,0.0531532,0.0543499,0.0439156,0.0417407,0.0430776,0.0428994,0.0509004,0.0480431,0.0444528,0.0496354,0.0559514,0.0394878,0.0415313,0.05425,0.0532839,0.0470465,0.0403547},
    {0.0459206,0.0355538,0.0419957,0.0344166,0.0526823,0.0417837,0.0433983,0.0498982,0.0487397,0.0571734,0.0415559,0.0469645,0.0514987,0.0489165,0.0456416,0.0482855,0.0484072,0.0516254,0.043176,0.0435458,0.0392863,0.0450654,0.0406578,0.0389489},
    {0.022798,0.026030,0.035934,0.047467,0.037035,0.041117,0.055143,0.045940,0.028821,0.047708,0.039324,0.056697,0.049173,0.037814,0.051821,0.043677,0.056958,0.042394,0.041518,0.038374,0.046884,0.038156,0.040849,0.048296}
};
const double v26err[5][neta24]={
    {0.00935143,0.00982847,0.00564785,0.00905794,0.0111128,0.00836526,0.0107956,0.0050948,0.00458922,0.00703032,0.00536614,0.00617455,0.00668817,0.00778934,0.0054874,0.00867388,0.00670244,0.00746278,0.0101004,0.00868972,0.00522075,0.00643437,0.00750222,0.0104727},
    {0.00496363,0.00568563,0.00789724,0.0048323,0.00424556,0.00381064,0.00549587,0.00698582,0.00606858,0.005248,0.00389068,0.00377182,0.00558966,0.00829005,0.00499524,0.0048063,0.00470981,0.00472216,0.00394499,0.00481531,0.00674246,0.00472761,0.00462292,0.00781334},
    {0.00545676,0.00422763,0.00492144,0.00519605,0.00478717,0.00489905,0.00360426,0.00377393,0.00562225,0.00593851,0.00600243,0.00362091,0.00439534,0.00214222,0.00588959,0.0060104,0.00502334,0.00448944,0.00550453,0.00430516,0.0046234,0.00400195,0.00446609,0.00440899},
    {0.00638419,0.00604659,0.00874978,0.00639421,0.00870034,0.00465647,0.00681883,0.00506355,0.00564328,0.00414517,0.00490768,0.00585097,0.00484191,0.00889346,0.00481556,0.00689774,0.0100838,0.00806311,0.00644624,0.00440426,0.00577399,0.00511675,0.0054603,0.00638806}
};
const double v28[5][neta24]={
    {0.0715431,0.0622705,0.032117,0.0217226,0.0672875,0.0424787,0.0176958,0.053471,0.040624,0.0637778,0.0481112,0.031055,0.0563658,0.0549635,0.0613547,0.0317414,0.0166499,0.0569516,0.0356099,0.0634825,0.0593198,0.0287702,0.029394,0.0728652},
    {0.00645559,0.0391586,0.0417692,0.0219347,0.0332012,0.0350643,0.022722,0.0145884,0.0449616,0.0458014,0.0352739,0.0583895,0.0283404,0.0515102,0.0462868,0.0586263,0.0491252,0.07865,0.0621928,0.0481825,0.0679307,0.0417835,0.0398492,0.070694},
    {0.0142113,0.0149623,0.0352779,0.0210192,0.0242208,0.0164288,0.0547812,0.0833789,0.066554,0.0481297,0.0383759,0.0512297,0.047438,0.0201015,0.0610993,0.0305725,0.0602495,0.0962027,0.0417315,0.0078534,0.0395888,0.0375707,0.0372333,0.0384892},
    {-0.056093,-0.014727,0.012444,0.060825,0.124009,0.189203,0.147548,-0.025069,-0.042198,0.144555,0.056154,-0.042462,-0.010954,0.011064,0.117553,0.077408,-0.013897,0.008107,-0.099659,0.028184,0.120390,0.080015,-0.064097,0.067662}
};
const double v28err[5][neta24]={
    {0.0189027,0.020825,0.0205137,0.0245923,0.0220476,0.0163261,0.0167048,0.0151245,0.0135629,0.0193551,0.0149366,0.0187209,0.0182479,0.0179809,0.0138375,0.022175,0.0128636,0.0171511,0.0199959,0.0167045,0.00998071,0.0129204,0.0156432,0.0131616},
    {0.0126504,0.0185545,0.0113774,0.00622928,0.0131663,0.00996583,0.0124426,0.0130636,0.0152539,0.0133118,0.0132147,0.0133987,0.0113255,0.0118079,0.0137243,0.0126674,0.0104211,0.0124122,0.00840302,0.0116605,0.00999918,0.0111701,0.0133083,0.0123068},
    {0.0118897,0.016531,0.017573,0.0177533,0.0175104,0.0163231,0.013498,0.0145697,0.0159273,0.0130186,0.0109738,0.00834695,0.0129921,0.0221044,0.014129,0.0152436,0.0193347,0.0141917,0.0178025,0.0183253,0.0154219,0.00937566,0.0139814,0.013235},
    {0.056716,0.0691342,0.0559995,0.0615565,0.0712773,0.0464516,0.0479385,0.0548723,0.0430702,0.0407193,0.0674964,0.0461579,0.0411515,0.0489988,0.0480329,0.0501363,0.0655108,0.0547294,0.0678025,0.0537292,0.0347939,0.0559245,0.0643674,0.0614759}
};
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
	//TFile *fProderr = TFile::Open(Form("M%d%d/mergedv_Prod2_eta_sub.root",trkpointmax[i],trkpointmin[i]));
	TFile *fProderr = TFile::Open(Form("M%d%d/mergedv_Prod2_coarse_eta_sub.root",trkpointmax[i],trkpointmin[i]));
	//TFile *fProd = TFile::Open(Form("M%d%d/mergedv_Prod2_eta.root",trkpointmax[i],trkpointmin[i]));
        
	TVectorD *vecDv2_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/vmeanmean",ibin));
	TVectorD *vecDv2err_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/sigmavmeanmean",ibin));
	TVectorD *vecDavgeta_Proderr = (TVectorD*)fProderr->Get(Form("D_%d/avgavgeta",ibin));
	double *avgeta_Proderr = vecDavgeta_Proderr->GetMatrixArray();
	double *v2_Proderr = vecDv2_Proderr->GetMatrixArray();
	double *v2err_Proderr = vecDv2err_Proderr->GetMatrixArray();
	
        /*
	TVectorD *vecDv2_Prod = (TVectorD*)fProd->Get(Form("D_%d/vmean",ibin));
	TVectorD *vecDv2err_Prod = (TVectorD*)fProd->Get(Form("D_%d/deltavmean",ibin));
        TVectorD *vecDavgeta_Prod = (TVectorD*)fProd->Get(Form("D_%d/avgeta",ibin));

	double *avgeta_Prod = vecDavgeta_Prod->GetMatrixArray();
	double *v2_Prod = vecDv2_Prod->GetMatrixArray();
	double *v2err_Prod = vecDv2err_Prod->GetMatrixArray();
        */
	int neta = vecDavgeta_Proderr->GetNrows();
	
	c1->cd(i+1);
	//TGraphErrors *grProd=new TGraphErrors(neta,avgeta_Prod,v2_Prod,0,v2err_Prod);
	TGraphErrors *grProd=new TGraphErrors(neta,avgeta_Proderr,v2_Proderr,0,v2err_Proderr);
	TGraphErrors *gr26=new TGraphErrors(neta24,eta,v26[i],0,v26err[i]);
	TGraphErrors *gr28=new TGraphErrors(neta24,eta,v28[i],0,v28err[i]);
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
        if(i!=(ntotbin-1)){
	gr26->Draw("Psame");
	gr28->Draw("Psame");
        }
	TLegend *tl = new TLegend(0.4,0.5,0.7,0.65);
	tl->SetFillColor(0);
	tl->SetBorderSize(0);
	tl->SetTextSize(0.05);
	tl->AddEntry(grProd,"v_{2}{LYZ}","lp");
	tl->AddEntry(gr26,"v_{2}{6} cumulant","lp");
	tl->AddEntry(gr28,"v_{2}{8} cumulant","lp");
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
	c1->Print("v2vseta_coarse.png");
	c1->Print("v2vseta_coarse.pdf");

}

