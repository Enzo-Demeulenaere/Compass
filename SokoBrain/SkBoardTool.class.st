Class {
	#name : #SkBoardTool,
	#superclass : #Object,
	#instVars : [
		'lines',
		'game',
		'characterClassBinding'
	],
	#category : #'SokoBrain-Model'
}

{ #category : #extract }
SkBoardTool >> classFor: aCharacter [ 
	^ characterClassBinding at: aCharacter ifAbsent: [ SkElement ]
]

{ #category : #extract }
SkBoardTool >> fillBindingDictionary [

	characterClassBinding := Dictionary new. 
	SkElement allSubclassesDo: [ :each | 
		characterClassBinding at: (each textualMapCharacter) put: each ] 
]

{ #category : #extract }
SkBoardTool >> initialize [

	super initialize.
	self fillBindingDictionary
]

{ #category : #building }
SkBoardTool >> maxLineLength [
	
	^ lines max: [ :each | each size ]
]

{ #category : #extract }
SkBoardTool >> splitLines: aString [

	^ aString splitOn: Character cr
]
