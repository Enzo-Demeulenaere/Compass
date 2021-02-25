Class {
	#name : #SkBasicNoDirectionMoveTest,
	#superclass : #TestCase,
	#category : #'SokoBrain-Tests'
}

{ #category : #'tests - no chain - one to one' }
SkBasicNoDirectionMoveTest >> testBoxWantToMoveInAGround [

	| box ground |
	box := SkBox new.
	ground := SkGround new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (box moveIn: ground going: nil)  
	
]

{ #category : #'tests - no chain - one to one' }
SkBasicNoDirectionMoveTest >> testBoxWantToMoveInATarget [

	| box target |
	box := SkBox new.
	target := SkTarget new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (box moveIn: target going: nil).
	"we will have to test that a target is filled up."  
	
]

{ #category : #'tests - no chain - one to one' }
SkBasicNoDirectionMoveTest >> testBoxWantToMoveInAWall [

	| box wall |
	box := SkBox new.
	wall := SkWall new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self deny: (box moveIn: wall going: nil)  
	
]

{ #category : #'tests - no chain - one to one' }
SkBasicNoDirectionMoveTest >> testPlayerWantToMoveInAGround [

	| player ground |
	player := SkPlayer new.
	ground := SkGround new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (player moveIn: ground going: nil)  
	
]

{ #category : #'tests - no chain - one to one' }
SkBasicNoDirectionMoveTest >> testPlayerWantToMoveInATarget [

	| player target |
	player := SkPlayer new.
	target := SkTarget new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self assert: (player moveIn: target going: nil)  
	
]

{ #category : #'tests - no chain - one to one' }
SkBasicNoDirectionMoveTest >> testPlayerWantToMoveInAWall [

	| player wall |
	player := SkPlayer new.
	wall := SkWall new.
	"move in returns a boolean representing whether the receiver
	changed position."
	self deny: (player moveIn: wall going: nil)  
	
]
