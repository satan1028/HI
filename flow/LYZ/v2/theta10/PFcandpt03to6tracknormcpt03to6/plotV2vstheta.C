#include "M150120/par.h"
void plotV2vstheta(){
	TFile *f;
        int isSum=0;
        const int ntotbin=5;
        const int trkpointmin[ntotbin] = {120,150,185,220,260};
        const int trkpointmax[ntotbin] = {150,185,220,260,300};
        int trkbin=0;
	int xbin=0;
	if(isSum==0){
	    f = TFile::Open(Form("M%d%d/mergedV_Prod.root",trkpointmax[trkbin],trkpointmin[trkbin]));
	}
	else{
	    f = TFile::Open(Form("M%d%d/mergedV_Sum.root",trkpointmax[trkbin],trkpointmin[trkbin]));
	}
	TVectorD* vecVmean = (TVectorD*)f->Get(Form("D_%d/Vmean",xbin));
        TVectorD* vecV = (TVectorD*)f->Get(Form("D_%d/D_0/V",xbin));

        double Vmean = (*vecVmean)[0];
        double *V = vecV->GetMatrixArray();
        double theta[ntheta];
        for(int itheta=0;itheta<ntheta;itheta++){
            theta[itheta]=itheta*TMath::Pi()/ntheta/nn;
            cout<<TMath::Abs(V[itheta]-Vmean)/Vmean<<endl;
        }
        int maxper10 = findmaxper(V,ntheta,Vmean);
        double maxper = (double)(maxper10+1)/10;
        TGraph *gV2theta = new TGraph(ntheta,theta,V);
        gV2theta->SetTitle("");
        gV2theta->GetXaxis()->SetTitle("#theta");
        gV2theta->GetYaxis()->SetTitle("reference V_{2}");
        gV2theta->GetYaxis()->SetTitleOffset(1.1);
        gV2theta->GetXaxis()->SetTitleSize(0.04);
        gV2theta->GetYaxis()->SetTitleSize(0.04);
        gV2theta->SetMarkerStyle(20);
        gV2theta->SetMarkerSize(1.3);
        gV2theta->SetMarkerColor(1);
        gV2theta->SetLineColor(1);
        gV2theta->SetMinimum(Vmean*(1-maxper*1.5));
        gV2theta->SetMaximum(Vmean*(1+maxper*1.5));
	gV2theta->Draw("AP");
        TLine *lup = new TLine(gV2theta->GetXaxis()->GetXmin(),Vmean*(1+maxper), gV2theta->GetXaxis()->GetXmax(),Vmean*(1+maxper));
        TLine *ldown = new TLine(gV2theta->GetXaxis()->GetXmin(),Vmean*(1-maxper), gV2theta->GetXaxis()->GetXmax(),Vmean*(1-maxper));
        TLine *l = new TLine(gV2theta->GetXaxis()->GetXmin(),Vmean, gV2theta->GetXaxis()->GetXmax(),Vmean);
        l->SetLineStyle(2);
        lup->SetLineStyle(2);
        ldown->SetLineStyle(2);
        l->SetLineWidth(1.2);
        lup->SetLineWidth(1.2);
        ldown->SetLineWidth(1.2);
        TLatex *tl = new TLatex();
 //     tl->SetNDC();
        tl->SetTextFont(42);
        tl->SetTextSize(0.04);
 //     tl->SetBorderStyle(0);
        tl->DrawLatex(0,Vmean*(1+maxper),Form("mean up %.f%%",maxper*100));
        tl->DrawLatex(0,Vmean*(1-maxper),Form("mean down %.f%%",maxper*100));
        tl->DrawLatex(1,0.05,Form("Multiplicity %d to %d",120,150));
        l->Draw("same");
        lup->Draw("same");
        ldown->Draw("same");
	if(isSum==0)c1->SaveAs("hV2theta_Prod.png");
	else c1->SaveAs("hV2theta_Sum.png");
}

int findmaxper(double* x, int n, double xmean){
    double temp=0;
    for(int i=0;i<n;i++){
        if(TMath::Abs(x[i]-xmean)>temp)
            temp=TMath::Abs(x[i]-xmean);
    }
    return (int)(temp/xmean*10);
}
