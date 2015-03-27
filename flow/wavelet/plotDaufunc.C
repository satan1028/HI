#include "Dauwave.h"
void plotDaufunc(){
    const int N=8;
    Dauwave dau(N);
    const int np=1000;
    int m=100;
    int n = (int)np/m;
    double x[np],yphi[np],ypsi[np];
    for(int i=0;i<m;i++){
        for(int j=0;j<n;j++){
            x[j+i*n] = i*TMath::Power(2,-j);
            yphi[j+i*n] = dau.phi(i,j);
            ypsi[j+i*n] = dau.psi(i,j);
        }
    }
    TGraph *g1 = new TGraph(np,x,yphi);
    TGraph *g2 = new TGraph(np,x,ypsi);
    TLatex T;
    T.SetTextSize(0.05);
    T.SetNDC();
    TCanvas *c1 = new TCanvas();
    c1->cd();
    g1->GetXaxis()->SetRangeUser(-0.1,2*N-1);
    g1->GetXaxis()->SetTitle("x");
    g1->GetYaxis()->SetTitle("#varphi(x)");
    g1->SetMarkerSize(0.8);
    g1->SetMarkerStyle(20);
    g1->Draw("AP");
    T.DrawLatex(0.7,0.2,Form("order of %d",N));
    TCanvas *c2 = new TCanvas();
    c2->cd();
    g2->GetXaxis()->SetRangeUser(-0.1,2*N-1);
    g2->GetXaxis()->SetTitle("x");
    g2->GetYaxis()->SetTitle("#psi(x)");
    g2->SetMarkerSize(0.8);
    g2->SetMarkerStyle(20);
    g2->Draw("AP");
    T.DrawLatex(0.7,0.2,Form("order of %d",N));
    c1->Print(Form("scale_N%d.png",N));
    c2->Print(Form("wavelet_N%d.png",N));
}
