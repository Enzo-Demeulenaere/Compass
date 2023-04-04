Class {
	#name : #CpWestDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpWestDirection >> * aPositionable [

	^  aPositionable x - 1 @ aPositionable y
]

{ #category : #arithmetic }
CpWestDirection >> in: distance from: aPositionable [
	"Returns the positionable at a given distance from aPositionable"
	
	^  aPositionable x - distance @ aPositionable y
]
