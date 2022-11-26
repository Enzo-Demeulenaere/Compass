Class {
	#name : #RbsBoard,
	#superclass : #Object,
	#instVars : [
		'map'
	],
	#category : #'Robots-Model'
}

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
		text: self printString;
		yourself
]

{ #category : #building }
RbsBoard >> buildMapWidth: x height: y [

	map := Array2D 
				rows: y 
				columns: x 
				tabulate: [ :row :column | self groundClass new basicPosition: column @ row ]
]

{ #category : #accessing }
RbsBoard >> columnNumber [
	^ map numberOfColumns
]

{ #category : #building }
RbsBoard >> do: aBlock [

	map do: aBlock
]

{ #category : #building }
RbsBoard >> groundClass [

	^ RbsGround
]

{ #category : #accessing }
RbsBoard >> height [
	^ map numberOfRows
]

{ #category : #initialization }
RbsBoard >> initialize [

	super initialize.
	self buildMapWidth: 10 height: 12
]

{ #category : #initialization }
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
RbsBoard >> printOn: aStream [
	
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
