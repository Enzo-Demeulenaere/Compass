Class {
	#name : #SkWall,
	#superclass : #SkElement,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkWall class >> textualMapCharacter [ 

	^ $#
]

{ #category : #accessing }
SkWall >> backgroundRepresentation [

	^ Color brown
]

{ #category : #move }
SkWall >> bringIn: anActor going: aDirection [
	"anActor does not move in a wall. Nothing enter a wall."
	
	^ false
]
