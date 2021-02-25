Class {
	#name : #SkBox,
	#superclass : #SkElement,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkBox class >> textualMapCharacter [ 
	
	^ $$
]

{ #category : #move }
SkBox >> moveIn: aLocation [ 
	"To move in a position, we ask the entity where we want to get in to decide.
	This is not a double dispatch per se because we do not have to discrimnate on the receiver."
	
	^ aLocation bringIn: self
]
