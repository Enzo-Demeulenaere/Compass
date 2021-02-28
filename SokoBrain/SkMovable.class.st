Class {
	#name : #SkMovable,
	#superclass : #SkElement,
	#instVars : [
		'previousBackground'
	],
	#category : #'SokoBrain-Model'
}

{ #category : #move }
SkMovable >> move: aCpDirection [

	| newPosition neighbor |
	newPosition := aCpDirection * self position.
	neighbor := board atPosition: newPosition.
	^ self moveIn: neighbor going: aCpDirection.
]

{ #category : #move }
SkMovable >> moveEast [

	self move: CpDirection east
]

{ #category : #move }
SkMovable >> moveNorth [

	self move: CpDirection north
]

{ #category : #move }
SkMovable >> moveSouth [

	self move: CpDirection south
]

{ #category : #move }
SkMovable >> moveWest [

	self move: CpDirection west
]

{ #category : #accessing }
SkMovable >> previousBackground [

	^ previousBackground
]

{ #category : #accessing }
SkMovable >> previousBackground: anObject [

	previousBackground := anObject
]
