/** \class SiStripDigitizer
 *
 * SiStripDigitizer to convert hits to digis
 *
 ************************************************************/

#ifndef SiStripDigitizer_h
#define SiStripDigitizer_h

#include "boost/shared_ptr.hpp"

#include "FWCore/Framework/interface/EDProducer.h"
#include "FWCore/Framework/interface/Event.h"
#include "DataFormats/Common/interface/Handle.h"
#include "FWCore/Framework/interface/EventSetup.h"

#include "DataFormats/Common/interface/EDProduct.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"

#include "Geometry/CommonDetUnit/interface/GeomDetType.h"

#include "SimDataFormats/CrossingFrame/interface/MixCollection.h"
#include "SimTracker/SiStripDigitizer/interface/SiStripDigitizerAlgorithm.h"

#include "SimTracker/Common/interface/SimHitSelectorFromDB.h"

#include <string>
#include <vector>
#include <map>

namespace CLHEP {
  class HepRandomEngine;
}

class SiStripDigitizer : public edm::EDProducer
{
public:
  
  explicit SiStripDigitizer(const edm::ParameterSet& conf);
  
  virtual ~SiStripDigitizer();
  
  virtual void produce(edm::Event& e, const edm::EventSetup& c);
  
private:
  typedef std::vector<std::string> vstring;
  typedef std::map<unsigned int, std::vector<std::pair<const PSimHit*, int> >,std::less<unsigned int> > simhit_map;
  typedef simhit_map::iterator simhit_map_iterator;

  SiStripDigitizerAlgorithm * theDigiAlgo;
  SiStripFedZeroSuppression* theSiFEDZeroSuppress;
  std::map<uint32_t, std::vector<int> > theDetIdList;
  SimHitSelectorFromDB SimHitSelectorFromDB_;
  std::vector<edm::DetSet<SiStripDigi> > theDigiVector;
  std::vector<edm::DetSet<SiStripRawDigi> > theRawDigiVector;
  // --- BEGIN HACK --- //
  // add additional vectors for signal and noise
  std::vector<edm::DetSet<SiStripRawDigi> > theRawSignalDigiVector;
  std::vector<edm::DetSet<SiStripRawDigi> > theRawNoiseDigiVector;
  // --- END HACK --- //
  std::vector<edm::DetSet<StripDigiSimLink> > theDigiLinkVector;
  edm::ParameterSet conf_;
  vstring trackerContainers;
  simhit_map SimHitMap;
  int numStrips;    // number of strips in the module
  CLHEP::HepRandomEngine* rndEngine;
  std::string geometryType;
  std::string alias;
  bool zeroSuppression;
  bool useConfFromDB;
};

#endif
