Class {
	#name : #SkPlayer,
	#superclass : #SkMovable,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : #accessing }
SkPlayer >> backgroundRepresentation [

	^ self background className = 'SkTarget'
		  ifTrue: [ Color lightYellow ]
		  ifFalse: [ Color yellow ]
]

{ #category : #move }
SkPlayer >> isPlayer [ 
	^ true
]

{ #category : #move }
SkPlayer >> postCreationAction [ 

	board setPlayer: self.
	self background: (SkGround new basicPosition: self position; yourself).
]
