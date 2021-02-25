Class {
	#name : #SkElement,
	#superclass : #Object,
	#instVars : [
		'position',
		'board'
	],
	#category : #SokoBrain
}

{ #category : #action }
SkElement >> bringIn: aSkPlayer [ 
	aSkPlayer position: self position.
	^ true
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
	position := aPosition
]

{ #category : #accessing }
SkElement >> setBoard: aGame [ 
	game := aGame
]
