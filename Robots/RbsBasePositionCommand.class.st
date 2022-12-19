Class {
	#name : #RbsBasePositionCommand,
	#superclass : #RbsCommand,
	#instVars : [
		'distance',
		'argX',
		'argY'
	],
	#category : #'Robots-Commands'
}

{ #category : #accessing }
RbsBasePositionCommand class >> commandName [ 
	^ 'base'
]

{ #category : #execution }
RbsBasePositionCommand >> executeOn: aRobot [

	aRobot startLocation: argX @ argY
]

{ #category : #execution }
RbsBasePositionCommand >> handleArguments: aCol [
	
	argX := Object readFrom: aCol first.
	argY := Object readFrom: aCol second
]

{ #category : #merging }
RbsBasePositionCommand >> mergeWith: aCommand [

	^ aCommand mergeWithMove: self
]

{ #category : #merging }
RbsBasePositionCommand >> mergeWithMove: aMoveCommand [
	"We have two moves for now just add them not handling zero yet"

	| merged |
	merged := self class new 
		distance: aMoveCommand distance + distance;
		yourself.
	^ CTLinkedList new add: merged ; yourself
	
]

{ #category : #printing }
RbsBasePositionCommand >> printArguments: aStream [

	aStream print: argX.
	aStream space.
	aStream print: argY.

	
]
