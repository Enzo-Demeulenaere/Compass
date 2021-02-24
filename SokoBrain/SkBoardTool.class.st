Class {
	#name : #SkBoardTool,
	#superclass : #Object,
	#instVars : [
		'map',
		'lines'
	],
	#category : #SokoBrain
}

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
