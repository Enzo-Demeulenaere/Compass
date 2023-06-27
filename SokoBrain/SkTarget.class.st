Class {
	#name : #SkTarget,
	#superclass : #SkElement,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkTarget class >> textualMapCharacter [ 

	^ $.
]

{ #category : #accessing }
SkTarget >> backgroundRepresentation [

	^ Color lightBlue
]

{ #category : #move }
SkTarget >> isTarget [ 
	^ true
]
