Class {
	#name : #SkBoardTool,
	#superclass : #Object,
	#instVars : [
		'map',
		'lines',
		'characterClassBinding'
	],
	#category : #SokoBrain
}

{ #category : #building }
SkBoardTool >> buildEmptyMapFor: aString [ 
	map := SkGame new.
	lines := self splitLines: aString.
	map buildMapOfExtent: lines first size @ lines size.
	^ map 
]

{ #category : #extract }
SkBoardTool >> classFor: aCharacter [ 
	^ characterClassBinding at: aCharacter ifAbsent: [ SkElement ]
]

{ #category : #extract }
SkBoardTool >> fillMap [

	characterClassBinding := Dictionary new. 
	SkElement allSubclassesDo: [ :each | 
		characterClassBinding at: (each textualMapCharacter) put: each ] 
]

{ #category : #extract }
SkBoardTool >> initialize [

	super initialize.
	self fillMap
]

{ #category : #building }
SkBoardTool >> maxLineLength [
	
	^ lines max: [ :each | each size ]
]

{ #category : #extract }
SkBoardTool >> splitLines: aString [

	^ aString splitOn: Character cr
]
