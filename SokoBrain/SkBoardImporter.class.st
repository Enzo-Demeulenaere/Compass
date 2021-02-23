Class {
	#name : #SkBoardImporter,
	#superclass : #Object,
	#instVars : [
		'characterClassBinding',
		'map',
		'lines'
	],
	#category : #SokoBrain
}

{ #category : #building }
SkBoardImporter >> buildEmptyMapFor: aString [ 
	map := SkGame new.
	lines := self splitLines: aString.
	map buildMapOfExtent: lines first size @ lines size.
	^ map 
]

{ #category : #extract }
SkBoardImporter >> classFor: aCharacter [
	^ characterClassBinding at: aCharacter ifAbsent: [ SkElement ]
]

{ #category : #extract }
SkBoardImporter >> fillMap [
	characterClassBinding := Dictionary new. 
	SkElement allSubclassesDo: [ :each | 
		characterClassBinding at: (each textualMapCharacter) put: each ] 
]

{ #category : #extract }
SkBoardImporter >> initialize [ 
	super initialize.
	self fillMap
]

{ #category : #extract }
SkBoardImporter >> splitLines: aString [ 
	^ aString splitOn: Character cr
]
