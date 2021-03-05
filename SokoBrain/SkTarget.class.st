Class {
	#name : #SkTarget,
	#superclass : #SkElement,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkTarget class >> textualMapCharacter [ 

	^ $.
]

{ #category : #move }
SkTarget >> isTarget [ 
	^ true
]
