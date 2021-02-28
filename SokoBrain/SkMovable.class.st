Class {
	#name : #SkMovable,
	#superclass : #SkElement,
	#instVars : [
		'previousBackground'
	],
	#category : #'SokoBrain-Model'
}

{ #category : #accessing }
SkMovable >> previousBackground [

	^ previousBackground
]

{ #category : #accessing }
SkMovable >> previousBackground: anObject [

	previousBackground := anObject
]
