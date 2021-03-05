Class {
	#name : #SkElement,
	#superclass : #Object,
	#instVars : [
		'position',
		'board'
	],
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkElement class >> textualMapCharacter [
	^ $Z
]

{ #category : #action }
SkElement >> bringIn: aSkMovable going: aDirection [
	"By default when a movable wants to move in, we move it in. By default do not use the direction, it is only usd for case where we need to check the next element in that direction, e.g., Player push a Box and the box should check if there is a ground or a wall before moving in that direction."
	
	| previousPosition | 
	previousPosition := aSkMovable position.
	aSkMovable position: self position.
	board updatePositionOf: aSkMovable from: previousPosition.
	^ true
]

{ #category : #move }
SkElement >> isBox [
	^ false
]

{ #category : #move }
SkElement >> isPlayer [
	^ false
]

{ #category : #move }
SkElement >> isTarget [
	^ false
]

{ #category : #move }
SkElement >> moveIn: aNeighbor going: aDirection [
	"To move in a position, we ask the entity where we want to get in to decide.
	This is not a double dispatch per se because we do not have to discrimnate on the receiver."
	
	^ aNeighbor bringIn: self going: aDirection
]

{ #category : #accessing }
SkElement >> position [
	^ position
]

{ #category : #accessing }
SkElement >> position: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]

{ #category : #printing }
SkElement >> printOn: aStream [ 

	super printOn: aStream.
	aStream nextPut: $-.
	position printOn: aStream
]

{ #category : #accessing }
SkElement >> setBoard: aBoard [ 
	board := aBoard
]
