Class {
	#name : #RbsResetMonitorCommand,
	#superclass : #RbsCommand,
	#instVars : [
		'distance',
		'argX',
		'argY'
	],
	#category : #'Robots-Commands'
}

{ #category : #accessing }
RbsResetMonitorCommand class >> commandName [ 
	^ 'resM'
]

{ #category : #execution }
RbsResetMonitorCommand >> executeOn: aRobot [

	aRobot initializePath.
]

{ #category : #execution }
RbsResetMonitorCommand >> handleArguments: aCol [
	
	argX := Object readFrom: aCol first.
	argY := Object readFrom: aCol second
]

{ #category : #merging }
RbsResetMonitorCommand >> mergeWith: aCommand [

	^ aCommand mergeWithMove: self
]

{ #category : #merging }
RbsResetMonitorCommand >> mergeWithMove: aMoveCommand [
	"We have two moves for now just add them not handling zero yet"

	| merged |
	merged := self class new 
		distance: aMoveCommand distance + distance;
		yourself.
	^ CTLinkedList new add: merged ; yourself
	
]

{ #category : #printing }
RbsResetMonitorCommand >> printArguments: aStream [

	aStream print: argX.
	aStream space.
	aStream print: argY.

	
]
