Extension { #name : #MacOSXPlatform }

{ #category : #'*FFICHeaderExtractor' }
MacOSXPlatform >> cHeaderExtractorFor: aSharedPool [
	"Read comment of superclass first.
	So far there is none 64 bits VMs"
	^ aSharedPool macOSX32Extractor
]
