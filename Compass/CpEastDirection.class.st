Class {
	#name : #CpEastDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpEastDirection >> * aPositionable [

	^ aPositionable x + 1 @ aPositionable y
]
