Class {
	#name : #CpNorthDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpNorthDirection >> * aPositionable [

	^ self newPositionX: aPositionable x y: aPositionable y - 1 
]
