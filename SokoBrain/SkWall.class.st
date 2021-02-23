Class {
	#name : #SkWall,
	#superclass : #SkElement,
	#category : #SokoBrain
}

{ #category : #move }
SkWall >> bringIn: anActor [
	"anActor does not move in a wall. Nothing enter a wall."
	
	^ false
]
