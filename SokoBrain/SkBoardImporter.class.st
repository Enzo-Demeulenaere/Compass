"
For now '   #   #' is a valid line we do not distinguish ground around the walls from ground inside. 
This is left as an exercise. 
For example we could introduce a new kind of bricks call SkNull to represent any ground before the first # and after the last #.

To deal with such limitation it means that the board space should be fully initialized with a ground, else when the last # is not the last element of the list we will get nil or the default value of the underlying container. 

"
Class {
	#name : #SkBoardImporter,
	#superclass : #SkBoardTool,
	#category : #'SokoBrain-Model'
}

{ #category : #building }
SkBoardImporter >> buildEmptyFor: aString [

	lines := self splitLines: aString.
	self checkMapValidity: aString.
	game := SkBoard new. 
	game buildMapOfExtent: self maxLineLength @ lines size.
	
]

{ #category : #building }
SkBoardImporter >> buildMapFor: aString [

	self buildEmptyFor: aString.
	lines doWithIndex: [ :aLine :lineNumber | 
		aLine doWithIndex: [ :aChar :columNumber |
			"could be moved to board"
			| new | 
			new := (self classFor: aChar) new.
			new position: columNumber @ lineNumber.
			new setBoard: game.
			game at: lineNumber at: columNumber put: (OrderedCollection with: new) ]
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

{ #category : #printing }
SkBoardImporter >> printOn: aStream [
	
	1 to: game numberOfRows do: [ :row |
		1 to: game numberOfColumns do: [ :column |
			(game at: row at: column) ifNotNil: [ :el |
					aStream nextPutAll: 
						el class textualMapCharacter].
			aStream cr ]]
]
