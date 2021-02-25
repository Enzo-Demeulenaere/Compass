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
SkPlayer >> move: aCpEastDirection [ 

	^ self moveIn: (board atPosition: (aCpEastDirection * self position))
]
