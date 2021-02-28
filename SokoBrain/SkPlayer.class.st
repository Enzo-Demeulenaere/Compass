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
