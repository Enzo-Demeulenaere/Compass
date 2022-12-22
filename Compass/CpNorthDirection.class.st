Class {
	#name : #CpNorthDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpNorthDirection >> * aPositionable [

	^  aPositionable x @ (aPositionable y - 1) 
]
