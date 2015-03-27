#include "TVectorD.h"
#include "TMath.h"
#include "TMatrixT.h"
#include "TMatrixDEigen.h"
#define sq2 1.41421356237309515
using namespace std;

class Dauwave{
    public:
	Dauwave(int);
	~Dauwave(){};
	double phi(int, int);
	double psi(int, int);
        TVectorD GetInit(double*, int);

    private:
	int N;
	TVectorD vecphi0;
	TVectorD vech;
};

Dauwave::Dauwave(int N_){
	if(N_<=0) exit(0);
	N = N_;
	if(N_==1){
	//    double phi0[] = {1,0};
    	    double h[] = 
            {0.7071067811865476,
            0.7071067811865476
            };
	}
	else if(N_==2){
    	//    double phi0[] = {0,(1+sq3)/2,(1-sq3)/2,0};
    	//    h[] = {(1+sq3)/4./sq2,(3+sq3)/4./sq2,(3-sq3)/4./sq2,(1-sq3)/4./sq2};
            double h[]=
            {0.48296291314469025,
             0.836516303737469,
             0.22414386804185735,
             -0.12940952255092145
            };
	}
	else if(N_==3){
//	    double phi0[]={};
//	    double h[]={0.47046721};
	    double h[]=
            {0.3326705529509569,
             0.8068915093133388,
             0.4598775021193313,
             -0.13501102001039084,
             -0.08544127388224149,
             0.035226291882100656
            };
	}
        else if(N_==8){
            double h[]=
            {-0.00011747678400228192,
                0.0006754494059985568,
                -0.0003917403729959771,
                -0.00487035299301066,
                0.008746094047015655,
                0.013981027917015516,
                -0.04408825393106472,
                -0.01736930100202211,
                0.128747426620186,
                0.00047248457399797254,
                -0.2840155429624281,
                -0.015829105256023893,
                0.5853546836548691,
                0.6756307362980128,
                0.3128715909144659,
                0.05441584224308161
            };
        }
        else exit(0);
	vech.ResizeTo(2*N);
	vech.SetElements(h);
        vecphi0=GetInit(h,N_);
        vecphi0.Print();
//	vecphi0.ResizeTo(2*N);
//	vecphi0.SetElements(phi0);
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

TVectorD Dauwave::GetInit(double* h, int N_){
    TMatrixD a(2*N_-2,2*N_-2);
    for(int i=0;i<2*N_-2;i++){
        for(int j=0;j<2*N_-2;j++){
            if((2*i-j)>=0 && (2*i-j)<=2*N_-1)
                a(i,j)=TMath::Sqrt(2)*h[2*i-j];
            else
                a(i,j)=0;
        }
    }
    a.Print();
    TVectorD ev;
    a.EigenVectors(ev);
    ev.Print();
    return ev;
}
