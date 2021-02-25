Class {
	#name : #SkMoveTest,
	#superclass : #TestCase,
	#category : #SokoBrain
}

{ #category : #'tests - no chain - one to one' }
SkMoveTest >> testBoxWantToMoveInAGround [

	| box ground |
	box := SkBox new.
	ground := SkGround new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (box moveIn: ground)  
	
]

{ #category : #'tests - no chain - one to one' }
SkMoveTest >> testBoxWantToMoveInATarget [

	| box target |
	box := SkBox new.
	target := SkTarget new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (box moveIn: target).
	"we will have to test that a target is filled up."  
	
]

{ #category : #'tests - no chain - one to one' }
SkMoveTest >> testBoxWantToMoveInAWall [

	| box wall |
	box := SkBox new.
	wall := SkWall new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self deny: (box moveIn: wall)  
	
]

{ #category : #'tests - no chain - one to one' }
SkMoveTest >> testPlayerWantToMoveInAGround [

	| player ground |
	player := SkPlayer new.
	ground := SkGround new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (player moveIn: ground)  
	
]

{ #category : #'tests - no chain - one to one' }
SkMoveTest >> testPlayerWantToMoveInATarget [

	| player target |
	player := SkPlayer new.
	target := SkTarget new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (player moveIn: target)  
	
]

{ #category : #'tests - no chain - one to one' }
SkMoveTest >> testPlayerWantToMoveInAWall [

	| player wall |
	player := SkPlayer new.
	wall := SkWall new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self deny: (player moveIn: wall)  
	
]
