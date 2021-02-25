Class {
	#name : #SkBoardImporter,
	#superclass : #SkBoardTool,
	#instVars : [
		'characterClassBinding'
	],
	#category : #SokoBrain
}

{ #category : #building }
SkBoardImporter >> buildEmptyMapFor: aString [ 
	map := SkBoard new.
	lines := self splitLines: aString.
	map buildMapOfExtent: lines first size @ lines size.
	^ map 
]

{ #category : #building }
SkBoardImporter >> buildMapFor: aString [
	| game |
	lines := self splitLines: aString.
	game := SkBoard new. 
	self checkMapValidity: aString.
	game buildMapOfExtent: self maxLineLength @ lines size.
	lines doWithIndex: [ :aLine :lineNumber | 
		aLine doWithIndex: [ :aChar :columNumber |
			| new | 
			new := (self classFor: aChar) new.
			new position: columNumber @ lineNumber.
			new setBoard: game.
			game at: lineNumber at: columNumber put: new ]
		].
	^ game 
]

{ #category : #building }
SkBoardImporter >> checkMapValidity: aString [
	"A map should 
		have one and only one player
		at least a target
		the same amount of targets and boxes"
	| playNumber boxNumber |	
	playNumber := (aString occurrencesOf: SkPlayer textualMapCharacter).
	playNumber = 1 ifFalse: [ self error: 'A game should have one and only one player'].
	boxNumber := (aString occurrencesOf: SkBox textualMapCharacter).
	boxNumber >= 0 
		ifFalse: [ self error: 'A game should have a positive number of boxes' ].
	(boxNumber =  (aString occurrencesOf: SkTarget textualMapCharacter))
		ifFalse: [ self error: 'A game should have the same amount of boxes and targets' ]	
]

{ #category : #extract }
SkBoardImporter >> classFor: aCharacter [ 
	^ characterClassBinding at: aCharacter ifAbsent: [ SkElement ]
]

{ #category : #extract }
SkBoardImporter >> fillBindingDictionary [

	characterClassBinding := Dictionary new. 
	SkElement allSubclassesDo: [ :each | 
		characterClassBinding at: (each textualMapCharacter) put: each ] 
]

{ #category : #extract }
SkBoardImporter >> initialize [

	super initialize.
	self fillBindingDictionary
]

{ #category : #printing }
SkBoardImporter >> printOn: aStream [
	
	1 to: map numberOfRows do: [ :row |
		1 to: map numberOfColumns do: [ :column |
			(map at: row at: column) ifNotNil: [ :el |
					aStream nextPutAll: 
						el class textualMapCharacter].
			aStream cr ]]
]
