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
