Class {
	#name : #CpEastDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpEastDirection >> * aPositionable [

	^ self newPositionX: aPositionable x + 1 y: aPositionable y
]
