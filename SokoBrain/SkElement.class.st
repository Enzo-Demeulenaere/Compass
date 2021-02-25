Class {
	#name : #SkElement,
	#superclass : #Object,
	#instVars : [
		'position',
		'board'
	],
	#category : #'SokoBrain-Model'
}

{ #category : #action }
SkElement >> bringIn: aSkMovable going: aDirection [
	"By default when a movable wants to move in, we move it in."
	
	aSkMovable position: self position.
	^ true
]

{ #category : #move }
SkElement >> isPlayer [
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

{ #category : #accessing }
SkElement >> setBoard: aBoard [ 
	board := aBoard
]
