Class {
	#name : #SkGame,
	#superclass : #Object,
	#instVars : [
		'map'
	],
	#category : #SokoBrain
}

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
