Class {
	#name : #CpEastDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpEastDirection >> * aPositionable [

	^ aPositionable x + 1 @ aPositionable y
]

{ #category : #arithmetic }
CpEastDirection >> in: distance from: aPositionable [
	"Returns the positionable at a given distance from aPositionable"
	
	^ aPositionable x + distance @ aPositionable y
]
