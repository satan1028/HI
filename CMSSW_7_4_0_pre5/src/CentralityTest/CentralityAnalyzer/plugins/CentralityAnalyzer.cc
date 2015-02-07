// -*- C++ -*-
//
// Package:    CentralityTest/CentralityAnalyzer
// Class:      CentralityAnalyzer
// 
/**\class CentralityAnalyzer CentralityAnalyzer.cc CentralityTest/CentralityAnalyzer/plugins/CentralityAnalyzer.cc

 Description: [one line class summary]

 Implementation:
     [Notes on implementation]
*/
//
// Original Author:  Qiao Xu
//         Created:  Fri, 06 Feb 2015 19:42:41 GMT
//
//


// system include files
#include <memory>
#include <vector>
#include "TFile.h"
#include "TDirectory.h"
#include "TH1.h"
#include "TH2.h"


// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/EDAnalyzer.h"
#include "FWCore/ServiceRegistry/interface/Service.h"
#include "CommonTools/UtilAlgos/interface/TFileService.h"


#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"
//
// class declaration
//

class CentralityAnalyzer : public edm::EDAnalyzer {
   public:
      explicit CentralityAnalyzer(const edm::ParameterSet&);
      ~CentralityAnalyzer();

      static void fillDescriptions(edm::ConfigurationDescriptions& descriptions);


   private:
      virtual void beginJob() override;
      virtual void analyze(const edm::Event&, const edm::EventSetup&) override;
      virtual void endJob() override;

      //virtual void beginRun(edm::Run const&, edm::EventSetup const&) override;
      //virtual void endRun(edm::Run const&, edm::EventSetup const&) override;
      //virtual void beginLuminosityBlock(edm::LuminosityBlock const&, edm::EventSetup const&) override;
      //virtual void endLuminosityBlock(edm::LuminosityBlock const&, edm::EventSetup const&) override;

      // ----------member data ---------------------------

   	edm::Service<TFileService> fs;
	std::vector<int> selectedBins_;
	edm::Handle<int> cbin_;
	edm::EDGetTokenT<int> tag_;
	TH1D* h;
};

//
// constants, enums and typedefs
//

//
// static data member definitions
//

//
// constructors and destructor
//
CentralityAnalyzer::CentralityAnalyzer(const edm::ParameterSet& iConfig)

{
   //now do what ever initialization is needed
   selectedBins_ = iConfig.getParameter<std::vector<int> >("selectedBins");
   tag_ = consumes<int>(iConfig.getParameter<edm::InputTag>("centralityBinLabel"));


}


CentralityAnalyzer::~CentralityAnalyzer()
{
 
   // do anything here that needs to be done at desctruction time
   // (e.g. close files, deallocate resources etc.)

}


//
// member functions
//

// ------------ method called for each event  ------------
void
CentralityAnalyzer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
   using namespace edm;
   using namespace std;
   bool result = false;
   h=fs->make<TH1D>("bin","bin",200,0,100);
   iEvent.getByToken(tag_,cbin_);
   int bin = *cbin_;
    for(unsigned int i = 0; i < selectedBins_.size(); ++i){
	if(bin == selectedBins_[i]) result = true;
    }
    std::cout<<result<<std::endl;


#ifdef THIS_IS_AN_EVENT_EXAMPLE
   Handle<ExampleData> pIn;
   iEvent.getByLabel("example",pIn);
#endif
   
#ifdef THIS_IS_AN_EVENTSETUP_EXAMPLE
   ESHandle<SetupData> pSetup;
   iSetup.get<SetupRecord>().get(pSetup);
#endif
}


// ------------ method called once each job just before starting event loop  ------------
void 
CentralityAnalyzer::beginJob()
{
}

// ------------ method called once each job just after ending the event loop  ------------
void 
CentralityAnalyzer::endJob() 
{
}

// ------------ method called when starting to processes a run  ------------
/*
void 
CentralityAnalyzer::beginRun(edm::Run const&, edm::EventSetup const&)
{
}
*/

// ------------ method called when ending the processing of a run  ------------
/*
void 
CentralityAnalyzer::endRun(edm::Run const&, edm::EventSetup const&)
{
}
*/

// ------------ method called when starting to processes a luminosity block  ------------
/*
void 
CentralityAnalyzer::beginLuminosityBlock(edm::LuminosityBlock const&, edm::EventSetup const&)
{
}
*/

// ------------ method called when ending the processing of a luminosity block  ------------
/*
void 
CentralityAnalyzer::endLuminosityBlock(edm::LuminosityBlock const&, edm::EventSetup const&)
{
}
*/

// ------------ method fills 'descriptions' with the allowed parameters for the module  ------------
void
CentralityAnalyzer::fillDescriptions(edm::ConfigurationDescriptions& descriptions) {
  //The following says we do not know what parameters are allowed so do no validation
  // Please change this to state exactly what you do use, even if it is no parameters
  edm::ParameterSetDescription desc;
  desc.setUnknown();
  descriptions.addDefault(desc);
}

//define this as a plug-in
DEFINE_FWK_MODULE(CentralityAnalyzer);
