Class {
	#name : #FFITestingSharedPool,
	#superclass : #FFISharedPool,
	#classVars : [
		'EACCES',
		'EINVAL',
		'SIGKILL',
		'SIGTERM',
		'WHATEVER'
	],
	#category : 'FFICHeaderExtractor-Tests'
}

{ #category : #accessing }
FFITestingSharedPool class >> headersContainingVariables [
	^ #( 'signal.h' 'errno.h' )
]

{ #category : #'autogenerated by FFICHeaderExtractor' }
FFITestingSharedPool class >> initVariablesMacOS32 [
"Method automatically generated by FFICHeaderExtractor. Read more at https://github.com/marianopeck/FFICHeaderExtractor"
	<platformName: 'Mac OS' wordSize: 4>
	EACCES := 13.
	EINVAL := 22.
	SIGKILL := 9.
	SIGTERM := 15.
	WHATEVER := nil."WHATEVER is UNDEFINED for this platform"

]

{ #category : #'autogenerated by FFICHeaderExtractor' }
FFITestingSharedPool class >> initVariablesunix32 [
"Method automatically generated by FFICHeaderExtractor. Read more at https://github.com/marianopeck/FFICHeaderExtractor"
	<platformName: 'unix' wordSize: 4>
	EACCES := 13.
	EINVAL := 22.
	SIGKILL := 9.
	SIGTERM := 15.
	WHATEVER := nil."WHATEVER is UNDEFINED for this platform"

]
