Class {
	#name : #SkMoveTest,
	#superclass : #TestCase,
	#category : #SokoBrain
}

{ #category : #tests }
SkMoveTest >> testBoxWantToMoveInAGround [

	| box ground |
	box := SkBox new.
	ground := SkGround new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (box moveIn: ground)  
	
]

{ #category : #tests }
SkMoveTest >> testBoxWantToMoveInATarget [

	| box target |
	box := SkBox new.
	target := SkTarget new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (box moveIn: target).
	"we will have to test that a target is filled up."  
	
]

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
