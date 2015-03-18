#include "Dauwave.h"
void plotDaufunc(){
    const int N=2;
    Dauwave dau(N);
    const int np=1000;
    int m=30;
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
    g2->SetMarkerSize(0.8);
    g2->SetMarkerStyle(20);
    g2->Draw("AP");
}
