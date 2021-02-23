Class {
	#name : #CpWestDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpWestDirection >> * aPositionable [

	^ self newPositionX: aPositionable x - 1 y: aPositionable y
]
