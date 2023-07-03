Class {
	#name : #SkElement,
	#superclass : #Object,
	#instVars : [
		'position',
		'board'
	],
	#category : #'SokoBrain-Model'
}

{ #category : #initialization }
SkElement class >> configured [ 

	^ self new configured
]

{ #category : #'default encoding' }
SkElement class >> textualMapCharacter [
	^ $Z
]

{ #category : #accessing }
SkElement >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]

{ #category : #accessing }
SkElement >> board [ 

	^ board
]

{ #category : #accessing }
SkElement >> board: aBoard [

	board := aBoard.
	(self class inheritsFrom: SkMovable) ifTrue: [ self background board: aBoard ]
]

{ #category : #action }
SkElement >> bringIn: aSkMovable going: aDirection [
	"By default when a movable wants to move in, we move it in. By default do not use the direction, it is only usd for case where we need to check the next element in that direction, e.g., Player push a Box and the box should check if there is a ground or a wall before moving in that direction."

	| previousPosition |
	previousPosition := aSkMovable position.
	aSkMovable basicPosition: self position.
	self board gameManager ifNotNil: [
		self board gameManager currentMoveCount: self board gameManager currentMoveCount + 1].
	board updatePositionOf: aSkMovable from: previousPosition.
	^ true
]

{ #category : #initialization }
SkElement >> configured [ 

	^self
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
SkElement >> position: aPoint [

	position := aPoint
]

{ #category : #action }
SkElement >> postCreationAction [

	self
]

{ #category : #printing }
SkElement >> printOn: aStream [ 

	super printOn: aStream.
	aStream nextPut: $-.
	position printOn: aStream
]
