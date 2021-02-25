Class {
	#name : #SkPlayer,
	#superclass : #SkElement,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : #move }
SkPlayer >> isPlayer [ 
	^ true
]

{ #category : #move }
SkPlayer >> move: aCpDirection [

	| newPosition canNeighborMove neighbor |
	newPosition := aCpDirection * self position.
	neighbor := board atPosition: newPosition.
	canNeighborMove := neighbor moveIn: (board atPosition: (aCpDirection * newPosition)) going: aCpDirection.
	^ canNeighborMove 
		ifTrue: [ self moveIn: neighbor going: aCpDirection. true ]
		ifFalse: [  false ]
]
