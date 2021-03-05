Class {
	#name : #SkPlayer,
	#superclass : #SkMovable,
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
SkPlayer >> postCreationAction [ 

	board setPlayer: self.
	self previousBackground: (SkGround new position: self position; yourself).
]
