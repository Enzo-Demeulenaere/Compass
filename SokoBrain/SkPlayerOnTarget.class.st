Class {
	#name : #SkPlayerOnTarget,
	#superclass : #SkPlayer,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkPlayerOnTarget class >> textualMapCharacter [
	^ $+
]

{ #category : #initialization }
SkPlayerOnTarget >> initialize [

	super initialize.
	self background: SkTarget new
]
