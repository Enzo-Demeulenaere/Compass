Class {
	#name : #SkMoveTest,
	#superclass : #TestCase,
	#category : #SokoBrain
}

{ #category : #tests }
SkMoveTest >> testPlayerWantToMoveInAGround [

	| player ground |
	player := SkPlayer new.
	ground := SkGround new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (player moveIn: ground)  
	
]

{ #category : #tests }
SkMoveTest >> testPlayerWantToMoveInAWall [

	| player wall |
	player := SkPlayer new.
	wall := SkWall new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self deny: (player moveIn: wall)  
	
]
