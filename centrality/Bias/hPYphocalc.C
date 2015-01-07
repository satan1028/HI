#include <vector>
void hPYphocalc(){

	double yUCM=0, yPCM=0, yVCM=0;
	double C=1e-6;
	double PNcoll[100]={};
	for(Ev=0;Ev<Nevent;Ev++){
		t->GetEntry(Ev);
		PNcoll[(int)Ncoll]++;
	}
	for(int i=0;i<100;i++)
		PNcoll[i]/=Nevent;
	for(Ev=0;Ev<Nevent;Ev++){
	if(Para>kpoint[i] && Para<kpoint[i+1]){
	double PNcollET = gammafun[Npart]->Eval(Para);
	double YNcollUCM = C*Ncoll;
	double YNcollPCM = C*Ncoll;
	double YNcollVCM = C*Ncoll;
	yUCM += PNcoll[(int)Ncoll]*PNcollET*YNcollUCM;
	yPCM += PNcoll[(int)Ncoll]*PNcollET*YNcollPCM;
	yVCM += PNcoll[(int)Ncoll]*PNcollET*YNcollVCM;


