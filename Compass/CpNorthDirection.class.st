Class {
	#name : #CpNorthDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpNorthDirection >> * aPositionable [

	^  aPositionable x @ (aPositionable y + 1) 
]

{ #category : #arithmetic }
CpNorthDirection >> in: distance from: aPositionable [
	"Returns the positionable at a given distance from aPositionable"
	
	^  aPositionable x @ (aPositionable y + distance) 
]
