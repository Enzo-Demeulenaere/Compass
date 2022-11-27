Class {
	#name : #RbsBoardTest,
	#superclass : #TestCase,
	#category : #'Robots-Test'
}

{ #category : #tests }
RbsBoardTest >> testCreatedBoard [

	| b |
	b := RbsBoard new.
	self assert: b columnNumber equals: 10.
	self assert: b lineNumber equals: 12.
]

{ #category : #tests }
RbsBoardTest >> testCreatedBoardWithExtent [

	| b |
	b := RbsBoard extent: 100@200.
	self assert: b columnNumber equals: 100.
	self assert: b lineNumber equals: 200.
]

{ #category : #tests }
RbsBoardTest >> testGroundIsSet [

	| b |
	b := RbsBoard new.
	self assert: (b at: 1 at: 1) class equals: RbsGround
]

{ #category : #tests }
RbsBoardTest >> testTileKnowsItsBoard [

	| b |
	b := RbsBoard new.
	self assert: (b at: 2 at: 2) board equals: b
]
