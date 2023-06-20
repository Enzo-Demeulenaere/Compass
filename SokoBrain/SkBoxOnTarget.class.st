Class {
	#name : #SkBoxOnTarget,
	#superclass : #SkBox,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkBoxOnTarget class >> textualMapCharacter [
	^ $*
]

{ #category : #initialization }
SkBoxOnTarget >> initialize [ 
	super initialize.
	self background: SkTarget new 
]
