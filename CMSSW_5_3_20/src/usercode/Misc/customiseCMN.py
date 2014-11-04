import FWCore.ParameterSet.Config as cms

##############################################################################
def customiseMedian(process):

    process.siStripZeroSuppression.Algorithms.CommonModeNoiseSubtractionMode=cms.string("Median")
    process.siStripZeroSuppression.storeCM = cms.bool(True)

    return process


##############################################################################
def customiseAPVRestore(process):

    process.siStripZeroSuppression.doAPVRestore = cms.bool(True)
    process.siStripZeroSuppression.Algorithms.restoreThreshold = cms.double(0.5)

    return process

##############################################################################
def customiseIteratedMedian(process):

    process.siStripZeroSuppression.Algorithms.CommonModeNoiseSubtractionMode=cms.string("IteratedMedian")
    process.siStripZeroSuppression.Algorithms.CutToAvoidSignal = cms.double(2.0)
    process.siStripZeroSuppression.Algorithms.Iterations = cms.int32(3)
    process.siStripZeroSuppression.storeCM = cms.bool(True)

    return process

##############################################################################
def customisePercentile(process):

    process.siStripZeroSuppression.Algorithms.CommonModeNoiseSubtractionMode=cms.string("Percentile")
    process.siStripZeroSuppression.Algorithms.Percentile=cms.double(25.0)
    process.siStripZeroSuppression.storeCM = cms.bool(True)

    return process
