//const double bin[]={0,12.61,18.99,23.23,29.50,150};	//G1.root
double bin[]={1.0,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0};	//G0.root
//const double bin[]={1.0,0};	//G2.root
int N=(int)(sizeof(bin)/sizeof(double));
int method=0; //method=0: use bin; method=1: use kpoint

TString datafile="/scratch/xuq7/Centrality/PbPbHistPlusEta4.root";

TString histoname="hHFEnergy";

struct para1 var1={40,4000,	2,10,1,	0,5,0.5, 0.5,1.5,0.1};  //standard Glauber
	
struct para1 var2={15,70,	1.00,2.01,0.50,	2.01,5.01,0.2, 0.9,1.1,0.05};   //Gribov Omega = 0.55

struct para1 var3={15,70,	1.00,2.01,0.50,	2.01,5.01,0.2, 0.9,1.1,0.05};   //Gribov Omega = 1.01

double binshift = 20;

struct para2 bestlist1[nGlau+2]=
{
    //{1.32,1.5},{1.31,2},{1.44,2.25},{1.35,2.35},{1.35,1.4},{1.44,1.35},{1.26,2.35},{1.38,2.25},{1.42,2.1},{1.44,2.25},{1.38,2.2}
    {3,2.5,0.6},{4,1,0.8},{3,1.5,0.6},{3,1.7,0.6},{3,2,0.6},{3,0.5,0.7},{4,1.5,0.8},{3,2.5,0.6},{3,2,0.6},{3,2.5,0.6},{3,2.5,0.6}
};

				

struct para2 bestlist2[nGlau+2]=
{{1.5,3.52},{1.5,3.916},{1.503,3.008},{1.5,3.52},{1.5,3.52},{1.402,2.604},{1.5,2.42},{1.601,3.117},{1.4,3.913},{1.5,3.12},{1.5,3.52}};



struct para2 bestlist3[nGlau+2]=
{{1.3,2.419},{1.3,2.918},{1.4,3.919},{1.3,2.419},{1.3,2.419},{1.3,3.42},{1.4,3.418},{1.5,3.92},{1.2,2.22},{1.4,3.82},{1.3,2.419}};


TString outG = Form("G%d.root",method);
