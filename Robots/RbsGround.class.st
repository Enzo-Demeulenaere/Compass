Class {
	#name : #RbsGround,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'Robots-Model'
}

{ #category : #'default encoding' }
RbsGround class >> textualMapCharacter [
	^ Character space
]

{ #category : #accessing }
RbsGround >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]
