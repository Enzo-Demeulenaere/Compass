Class {
	#name : #SkWall,
	#superclass : #SkElement,
	#category : #SokoBrain
}

{ #category : #'as yet unclassified' }
SkWall class >> textualMapCharacter [ 

	^ $#
]

{ #category : #move }
SkWall >> bringIn: anActor [
	"anActor does not move in a wall. Nothing enter a wall."
	
	^ false
]
