Class {
	#name : #SkGame,
	#superclass : #Object,
	#instVars : [
		'map'
	],
	#category : #SokoBrain
}

{ #category : #building }
SkGame >> at: anInteger at: anInteger2 put: anElement [
	map at: anInteger at: anInteger2 put: anElement 
]

{ #category : #building }
SkGame >> buildMapOfExtent: aPoint [ 
	map := Array2D rows: aPoint y columns: aPoint x 
]

{ #category : #accessing }
SkGame >> columnNumber [
	^ map numberOfColumns
]

{ #category : #accessing }
SkGame >> lineNumber [
	^ map numberOfRows
]

{ #category : #printing }
SkGame >> printOn: aStream [
	
	1 to: map numberOfRows do: [ :row |
		1 to: map numberOfColumns do: [ :column |
			(map at: row at: column) ifNotNil: [ :el |
					aStream nextPut: 
						el class textualMapCharacter].
			aStream cr ]]
]
