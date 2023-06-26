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
SkBoxOnTarget >> configured [
	^ SkBox new background: self defaultBackground
]

{ #category : #initialization }
SkBoxOnTarget >> defaultBackground [

	^ SkTarget new basicPosition: self position; yourself
]
