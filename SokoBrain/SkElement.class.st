Class {
	#name : #SkElement,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #SokoBrain
}

{ #category : #action }
SkElement >> bringIn: aSkPlayer [ 
	aSkPlayer position: self position.
	^ true
]

{ #category : #accessing }
SkElement >> game: aGame [ 
	game := aGame
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
