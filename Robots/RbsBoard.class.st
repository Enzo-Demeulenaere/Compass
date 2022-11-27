"
I'm a board a kind of 2D space holding tile objects.
A tile object should accept a position and a character based representation.
"
Class {
	#name : #RbsBoard,
	#superclass : #Object,
	#instVars : [
		'map'
	],
	#category : #'Robots-BoardCore'
}

{ #category : #geometry }
RbsBoard class >> extent: aPoint [

	^ self basicNew extent: aPoint; yourself
]

{ #category : #geometry }
RbsBoard class >> new [

	^ self extent: 10@12
]

{ #category : #printing }
RbsBoard >> asciiString [ 

	^ String streamContents: [ :st | self printOn: st ]	

]

{ #category : #'low level access' }
RbsBoard >> at: anInteger at: anInteger2 [
	^ map at: anInteger at: anInteger2
]

{ #category : #'low level access' }
RbsBoard >> at: anInteger at: anInteger2 put: anElement [
	map at: anInteger at: anInteger2 put: anElement 
]

{ #category : #accessing }
RbsBoard >> atPosition: aCpPositionable [ 
	^ (map at: aCpPositionable y at: aCpPositionable x)
]

{ #category : #'low level access' }
RbsBoard >> atRow: anInteger atColumn: anInteger2 [
	^ map at: anInteger at: anInteger2
]

{ #category : #'low level access' }
RbsBoard >> atRow: anInteger atColumn: anInteger2 put: anElement [
	map at: anInteger at: anInteger2 put: anElement 
]

{ #category : #inspector }
RbsBoard >> basicPrintOnInspector [
	<inspectorPresentationOrder: 35 title: 'Game'>

	^ SpTextPresenter new 
		text: self asciiString;
		yourself
]

{ #category : #building }
RbsBoard >> buildMapWidth: x height: y [

	map := Array2D 
				rows: y 
				columns: x.
	map rowsColumnsDo: [ :row :column |
			self initializeElement: self groundClass new atLine: row column: column ]
]

{ #category : #accessing }
RbsBoard >> columnNumber [
	^ map numberOfColumns
]

{ #category : #building }
RbsBoard >> do: aBlock [
	"Execute the block on each element of the board"
	
	map do: aBlock
]

{ #category : #accessing }
RbsBoard >> extent: aPoint [

	self buildMapWidth: aPoint x height: aPoint y 
]

{ #category : #building }
RbsBoard >> groundClass [

	^ RbsGround
]

{ #category : #accessing }
RbsBoard >> height [
	^ map numberOfRows
]

{ #category : #building }
RbsBoard >> initializeElement: anElement atLine: lineNumber column: columnNumber [

	anElement setBoard: self.
	anElement basicPosition: columnNumber @ lineNumber.
	self atRow: lineNumber atColumn: columnNumber put: anElement.
	anElement postCreationAction.
]

{ #category : #accessing }
RbsBoard >> lineNumber [
	^ map numberOfRows
]

{ #category : #printing }
RbsBoard >> printNicelyOn: aStream [
	
	(1 to: map numberOfRows)
		do: [ :rowNumber |
			1 to: map numberOfColumns do: [ :columnNumber |
				| el |
				el := (self atRow: rowNumber atColumn: columnNumber).
				aStream nextPut: el class textualMapCharacter]]
		separatedBy: [ aStream cr ]
]

{ #category : #accessing }
RbsBoard >> width [
	^ map numberOfColumns
]
