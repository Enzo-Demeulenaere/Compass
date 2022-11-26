Class {
	#name : #RbsBoardTest,
	#superclass : #TestCase,
	#category : #Robots
}

{ #category : #tests }
RbsBoardTest >> testCreatedBoard [

	| b |
	b := RbsBoard new.
	self assert: b columnNumber equals: 10.
	self assert: b lineNumber equals: 12.
]

{ #category : #tests }
RbsBoardTest >> testGroundIsSet [

	| b |
	b := RbsBoard new.
	self assert: (b at: 1 at: 1) class equals: RbsGround
]
