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
SkElement >> bringIn: aSkPlayer [ 
	aSkPlayer position: self position.
	^ true
]

{ #category : #move }
SkElement >> isPlayer [
	^ false
]

{ #category : #move }
SkElement >> moveIn: aLocation [ 
	^ aLocation bringIn: self
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
