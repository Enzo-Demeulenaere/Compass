Class {
	#name : #CpWestDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpWestDirection >> * aPositionable [

	^  aPositionable x - 1 @ aPositionable y
]
