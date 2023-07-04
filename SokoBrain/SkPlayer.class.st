Class {
	#name : #SkPlayer,
	#superclass : #SkMovable,
	#instVars : [
		'facing'
	],
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : #accessing }
SkPlayer >> backgroundRepresentation [

	| dict |
	dict := {
		        (CpNorthDirection -> MyIcons playerUpIcon).
		        (CpWestDirection -> MyIcons playerLeftIcon).
		        (CpSouthDirection -> MyIcons playerDownIcon).
		        (CpEastDirection -> MyIcons playerRightIcon) } asDictionary.
	^ dict at: self facing
]

{ #category : #accessing }
SkPlayer >> facing [ 

	^ facing
]

{ #category : #accessing }
SkPlayer >> facing: aCpDirection [
	
	facing := aCpDirection 
]

{ #category : #initialization }
SkPlayer >> initialize [ 

	super initialize.
	facing := CpSouthDirection
]

{ #category : #move }
SkPlayer >> isPlayer [ 
	^ true
]

{ #category : #move }
SkPlayer >> move: aCpDirection [

	self facing: aCpDirection class.
	super move: aCpDirection
]

{ #category : #move }
SkPlayer >> postCreationAction [ 

	board setPlayer: self.
	self background: (SkGround new basicPosition: self position; yourself).
]
