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
	map := SkGame new.
	lines := self splitLines: aString.
	map buildMapOfExtent: lines first size @ lines size.
	^ map 
]

{ #category : #building }
SkBoardImporter >> buildMapFor: aString [
	| game |
	lines := self splitLines: aString.
	game := SkGame new. 
	
	game buildMapOfExtent: self maxLineLength @ lines size.
	lines doWithIndex: [ :aLine :lineNumber | 
		aLine doWithIndex: [ :aChar :columNumber |
			| new | 
			new := (self classFor: aChar) new.
			new position: columNumber @ lineNumber.
			new game: game.
			game at: lineNumber at: columNumber put: new ]
		].
	^ game 
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
