class Dauwave{
    public:
	Dauwave(int);
	~Dauwave(){};
	double phi(int, int, int);
	double phi(int, int);
	double psi(int, int, int);

    private:
	int N;
    	double sq3;
	double sq2;
	TVectorD vecphi0;
	TVectorD vech;
};

Dauwave::Dauwave(int N_){
	if(N_<=0) exit("N must be an positive integral!");
	N = N_;
    	sq3 = (double)TMath::Sqrt(3);
    	sq2 = (double)TMath::Sqrt(2);
	if(N_==1){
	    double phi0[] = {1,0};
    	    double h[] = {1/sq2,1/sq2};
	}
	else if(N_==2){
    	    double phi0[] = {0,(1+sq3)/sq2,(1-sq3)/sq2,0};
    	    double h[] = {(1+sq3)/4./sq2,(3+sq3)/4./sq2,(3-sq3)/4./sq2,(1-sq3)/4./sq2};
	}
	else if(N_==3){
	    double phi0[]={};
	    double h[]={0.47046721,};
		exit();	//need to add higher order
	}
	cout<<h[0]<<endl;
	vecphi0.ResizeTo(2*N);
	vecphi0.SetElements(phi0);
	vech.ResizeTo(2*N);
	vech.SetElements(h);
}

double Dauwave::phi(int m, int n){ //x = m * 2^(-n)
    double res=0;
    if(m<0 || m*TMath::Power(2,-n)>2*N-1) return 0;
    if(m*n==0) return vecphi0[m];
    for(int i=0;i<2*N;i++){
        res+=sq2*vech[i]*phi(m-i*TMath::Power(2,n-1),n-1);
    }
    return res;
}

double Dauwave::psi(int m, int n){
    double res=0;
    for(int i=0;i<2*N;i++){
        res+=sq2*TMath::Power(-1,i)*vech[2*N-1-i]*phi(m-i*TMath::Power(2,n-1),n-1);
    }
    return res;
}
