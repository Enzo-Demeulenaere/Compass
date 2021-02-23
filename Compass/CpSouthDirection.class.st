Class {
	#name : #CpSouthDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpSouthDirection >> * aPositionable [

	^ self newPositionX: aPositionable x y: aPositionable y + 1
]
