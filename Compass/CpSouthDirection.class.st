Class {
	#name : #CpSouthDirection,
	#superclass : #CpDirection,
	#category : #Compass
}

{ #category : #arithmetic }
CpSouthDirection >> * aPositionable [

	^ aPositionable x @ (aPositionable y + 1)
]
