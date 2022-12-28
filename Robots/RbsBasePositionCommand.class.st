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

	aRobot x: argX y: argY
]

{ #category : #execution }
RbsBasePositionCommand >> handleArguments: aCol [
	
	argX := Object readFrom: aCol first.
	argY := Object readFrom: aCol second
]

{ #category : #merging }
RbsBasePositionCommand >> mergeWith: aCommand [

	^ CTLinkedList new add: aCommand ;add: self;  yourself 
]

{ #category : #printing }
RbsBasePositionCommand >> printArguments: aStream [

	aStream print: argX.
	aStream space.
	aStream print: argY.

	
]
