"
For more details see https://github.com/marianopeck/FFICHeaderExtractor

In short, FFICHeaderExtractor is a program to extract information (e.g. constants) from C headers and integrate that into Smalltalk SharedPools.

When we use FFI to call a certain library, it's quite common that we need to pass specific constants (for example, SIGKILL to kill()). These constants are defined in C header files and can even change their values in different paltforms. Sometimes, these constants also are defined by the C preprocessor and so there is not way to get those values from FFI. If you don't have the value of those constants, you cannot make the FFI call. In other words, if I cannot know that the value of SIGKILL is 9, how do I call kill() from FFI?

This tool allows the developers of a FFI tool (any project which uses FFI to call a certain library), to automatically create a C program that writes all the user-defined constants values, compile it, run it, and create a Smalltalk init method which initializes the shared pool constants based on C program output. This autogenerated init method can then be distributed with the rest of the FFI tool. FFICHeaderExtractor will also automatically initialize (searching and executing the previously autogenerated init method for the current platform) a SharedPool upon system startup.
"
Class {
	#name : #ConfigurationOfFFICHeaderExtractor,
	#superclass : #ConfigurationOf,
	#category : 'ConfigurationOfFFICHeaderExtractor'
}

{ #category : #catalog }
ConfigurationOfFFICHeaderExtractor class >> catalogChangeLog [
	^ 'See https://github.com/marianopeck/FFICHeaderExtractor/blob/master/CHANGELOG.md'
	
]

{ #category : #catalog }
ConfigurationOfFFICHeaderExtractor class >> catalogContactInfo [
	^ 'https://marianopeck.wordpress.com'
]

{ #category : #catalog }
ConfigurationOfFFICHeaderExtractor class >> catalogDescription [
	^ 'In short, FFICHeaderExtractor is a program to extract information (e.g. constants) from C headers and integrate that into Smalltalk SharedPools.

When we use FFI to call a certain library, it''s quite common that we need to pass specific constants (for example, SIGKILL to kill()). These constants are defined in C header files and can even change their values in different paltforms. Sometimes, these constants also are defined by the C preprocessor and so there is not way to get those values from FFI. If you don''t have the value of those constants, you cannot make the FFI call. In other words, if I cannot know that the value of SIGKILL is 9, how do I call kill() from FFI?

This tool allows the developers of a FFI tool (any project which uses FFI to call a certain library), to automatically create a C program that writes all the user-defined constants values, compile it, run it, and create a Smalltalk init method which initializes the shared pool constants based on C program output. This autogenerated init method can then be distributed with the rest of the FFI tool. FFICHeaderExtractor will also automatically initialize (searching and executing the previously autogenerated init method for the current platform) a SharedPool upon system startup.	
	
For more details see: https://github.com/marianopeck/OSSubprocess'
]

{ #category : #catalog }
ConfigurationOfFFICHeaderExtractor class >> catalogKeyClassesAndExample [
	^ 'See https://github.com/marianopeck/FFICHeaderExtractor'
]

{ #category : #catalog }
ConfigurationOfFFICHeaderExtractor class >> catalogKeywords [
	^ #(FFI C Platform Constants)
]

{ #category : #'symbolic versions' }
ConfigurationOfFFICHeaderExtractor >> stable: spec [
	<symbolicVersion: #stable>
	
	spec for: #'pharo5.x' version: 'v0.1.0'
]

{ #category : #versions }
ConfigurationOfFFICHeaderExtractor >> v0_1_0: spec [
	<version: 'v0.1.0'>
	
	spec
		for: #'common'
		do: [ 
			spec
				baseline: 'FFICHeaderExtractor'
					with: [ spec repository: 'github://marianopeck/FFICHeaderExtractor:v0.1.0/repository' ];
				import: 'FFICHeaderExtractor' ].
]