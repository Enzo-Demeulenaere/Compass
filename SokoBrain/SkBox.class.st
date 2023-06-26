Class {
	#name : #SkBox,
	#superclass : #SkMovable,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkBox class >> textualMapCharacter [ 
	
	^ $$
]

{ #category : #move }
SkBox >> bringIn: aPlayer going: aDirection [

	| boxPreviousPosition neighbor didMove  |
	aPlayer class = self class ifTrue: [ ^ false ].
	boxPreviousPosition := self position.
	"we store the current position because if I can move, I will have to move the player to my old position."
	neighbor := board atPosition: aDirection * self position.
	"First I tried to move in by asking my neighbor"
	didMove := self moveIn: neighbor going: aDirection.
	"If I moved them moved the player to move into my previous position"
	didMove ifTrue: [ 
		| playerPreviousPosition |
		playerPreviousPosition := aPlayer position.
		aPlayer basicPosition: boxPreviousPosition.
		board updatePositionOf: aPlayer from: playerPreviousPosition ].
	^ didMove
]

{ #category : #move }
SkBox >> isBox [ 

	^ true
]

{ #category : #move }
SkBox >> postCreationAction [

	board addBox: self.
	self background: self defaultBackground
]
