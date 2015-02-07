import FWCore.ParameterSet.Config as cms
import FWCore.Utilities.FileUtils as FileUtils

process = cms.Process("Demo")

process.load("RecoHI.HiCentralityAlgos.CentralityBin_cfi")
#This loads the default parameters see here.

#The parameters to be set in the config file

process.centralityBin.Centrality = cms.InputTag("hiCentrality")
process.centralityBin.centralityVariable = cms.string("HFtowers")
process.centralityBin.nonDefaultGlauberModel = cms.string("HydjetDrum5")

#The centrality table for testing can be accessed by
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.GlobalTag.globaltag = 'START71_V1::All'
process.GlobalTag.toGet.extend([
   cms.PSet(record = cms.string("HeavyIonRcd"),
      tag = cms.string("CentralityTable_HFtowers200_HydjetDrum5_v740x01_mc"),
      connect = cms.untracked.string("frontier://FrontierProd/CMS_COND_31X_PHYSICSTOOLS"),
      label = cms.untracked.string("HFtowers_HydjetDrum5")
   ),
])

#In the path you have to produce the bin integer

#centralityBin = cms.EDProducer('CentralityBinProducer',
#Centrality = cms.InputTag("hiCentrality"),
#centralityVariable = cms.string("HFtowers"),
#nonDefaultGlauberModel = cms.string(""),
#pPbRunFlip = cms.uint32(99999999),
#)

process.maxEvents = cms.untracked.PSet(
	input = cms.untracked.int32(-1)
	)

process.source = cms.Source('PoolSource',
                            fileNames = cms.untracked.vstring(
                                'file:/cms/store/user/qixu/centrality/software/hiReco_DIGI_L1_DIGI2RAW_RAW2DIGI_L1Reco_RECO_100_1_gMP.root'
)
                            #duplicateCheckMode = cms.untracked.string("noDuplicateCheck")
                            )

process.analyze = cms.EDAnalyzer("CentralityAnalyzer",
	selectedBins = cms.vint32(0),
	centralityBinLabel = cms.InputTag("centralityBin","HFtowers")
)

process.TFileService = cms.Service('TFileService',
	fileName = cms.string("histograms.root")
	)


process.p = cms.Path(process.centralityBin * process.analyze) 
