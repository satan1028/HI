    double sq3 = (double)TMath::Sqrt(3);
    double sq2 = (double)TMath::Sqrt(2);
void plotDaufunc(){
    const int N=1;
  //  std::vector<double> h(2*N);
//    if(N<1) exit("N is not right!");
//    if(N==1)   double h[] = {1./sq2,1./sq2};
    //if(N==2)   double h[] = {(1+sq3)/4./sq2,(3+sq3)/4./sq2,(3-sq3)/4./sq2,1.2 };
   // if(N==2) 
    const int np=100;
    int m=20;
    int n = (int)np/m;
    double x[np],yphi[np],ypsi[np];
    for(int i=0;i<m;i++){
        for(int j=0;j<n;j++){
            x[i+j*m] = i*TMath::Power(2,-j);
            cout<<x[i+j*m]<<endl;
            yphi[i+j*n] = phi(N,i,j);
            ypsi[i+j*n] = Psi(N,i,j);
        }
    }
cout<<coeff(N)[0]<<endl;
    TGraph *g1 = new TGraph(np,x,yphi);
    TGraph *g2 = new TGraph(np,x,yPsi);
    g1->Draw();
}

double phi(int N,int m, int n){ //x = m * 2^(-n)
    double res=0;
    if(n<0) exit();
    if(N==1){
        if(m==0) return 1;
        if(n==0) return 0;
        for(int i=0;i<2*N;i++){
            res+=sq2*coeff(N)[i]*phi(N,m-i,n-1-i);
        }
        return res;
    }
    else return 0;
}

double Psi(int N, int m, int n){
    double res=0;
    for(int i=0;i<2*N;i++){
        res+=sq2*TMath::Power(-1,i)*coeff(N)[2*N-1-i]*phi(N,m-i,n-1-i);
    }
    return res;
}

double* coeff(int N){
    if(N==1) double h[10] = {1/sq2,1/sq2};
    if(N==2) double h[10] = {(1+sq3)/4./sq2,(3+sq3)/4./sq2,(3-sq3)/4./sq2,(1-sq3)};
 //       double h[] = {1,1,1,1.};
//    vector<int> vec (h, h + sizeof(h) / sizeof(double) );
    return h;
}
