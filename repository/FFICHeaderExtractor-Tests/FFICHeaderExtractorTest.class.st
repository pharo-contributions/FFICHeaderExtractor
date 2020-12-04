Class {
	#name : #FFICHeaderExtractorTest,
	#superclass : #TestCase,
	#category : 'FFICHeaderExtractor-Tests'
}

{ #category : #tests }
FFICHeaderExtractorTest >> testBuildMethodSource [
	| extractor methodSource | 
	extractor := self testingSharedPool cHeaderExtractor.
	extractor 
		generateCProgram;
		compileCProgram;
		runCProgram.
	methodSource := extractor buildMethodSource.
	self assert: (methodSource beginsWith: 'initVariables').
	self assert: (methodSource includesSubstring: '<platformName:').
	self assert: (methodSource includesSubstring: 'wordSize:').
	self assert: (methodSource includesSubstring: '"WHATEVER is UNDEFINED for this platform"').
	self assert: (methodSource includesSubstring: 'SIGKILL := 9.').
	self assert: (methodSource includesSubstring: 'EINVAL := 22.').
	self assert: methodSource lines size equals: 8. 
]

{ #category : #tests }
FFICHeaderExtractorTest >> testCProgramOutput [
	| extractor output | 
	extractor := self testingSharedPool cHeaderExtractor.
	extractor outputFilename asFileReference ensureDelete.
	extractor 
		generateCProgram;
		compileCProgram;
		runCProgram.
	output := extractor outputFilename asFileReference readStream contents.
	self assert: (output includesSubstring: '#(UNDEFINEDWHATEVER 0 0)').
	self assert: (output includesSubstring: '#(SIGKILL 9').
	self assert: (output includesSubstring: '#(EINVAL 22').
	self assert: output lines size equals: 5. 
]

{ #category : #tests }
FFICHeaderExtractorTest >> testCompileCProgram [
	| extractor | 
	extractor := self testingSharedPool cHeaderExtractor.
	extractor binaryFilename asFileReference ensureDelete.
	extractor 
		generateCProgram;
		compileCProgram.
	self assert: extractor binaryFilename asFileReference exists.
	self assert: extractor binaryFilename asFileReference size > 100.
]

{ #category : #tests }
FFICHeaderExtractorTest >> testGenerateCProgram [
	| extractor cProgram | 
	extractor := self testingSharedPool cHeaderExtractor.
	extractor generateCProgram.
	cProgram := extractor cProgramFilename asFileReference readStream contents.
	self assert: (cProgram includesSubstring: '#include <signal.h>').
	self assert: (cProgram includesSubstring: '#include <errno.h>').
	self assert: (cProgram includesSubstring: '#ifdef SIGKILL
		printDefinedConstant(file, SIGKILL);
	#else
		printUndefinedConstant(file, SIGKILL);
	#endif

	#ifdef SIGTERM
		printDefinedConstant(file, SIGTERM);
	#else
		printUndefinedConstant(file, SIGTERM);
	#endif

	#ifdef WHATEVER
		printDefinedConstant(file, WHATEVER);
	#else
		printUndefinedConstant(file, WHATEVER);
	#endif')
	

]

{ #category : #tests }
FFICHeaderExtractorTest >> testRunCProgram [
	| extractor | 
	extractor := self testingSharedPool cHeaderExtractor.
	extractor outputFilename asFileReference ensureDelete.
	extractor 
		generateCProgram;
		compileCProgram;
		runCProgram.
	self assert: extractor outputFilename asFileReference exists.
	self assert: extractor outputFilename asFileReference size > 10.
]

{ #category : #tests }
FFICHeaderExtractorTest >> testStoreMethod [
	| extractor | 
	extractor := self testingSharedPool cHeaderExtractor.
	extractor 
		generateCProgram;
		compileCProgram;
		runCProgram;
		extractAndStoreHeadersInformation.
	
	self assert: (self testingSharedPool class includesSelector: extractor autogeneratedMethodName asSymbol).
]

{ #category : #accessing }
FFICHeaderExtractorTest >> testingSharedPool [
	^ FFITestingSharedPool
]