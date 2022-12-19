Class {
	#name : #RbsReplayMonitorCommand,
	#superclass : #RbsCommand,
	#instVars : [
		'distance',
		'argX',
		'argY'
	],
	#category : #'Robots-Commands'
}

{ #category : #accessing }
RbsReplayMonitorCommand class >> commandName [ 
	^ 'replay'
]

{ #category : #execution }
RbsReplayMonitorCommand >> executeOn: aRobot [

	aRobot replay
]

{ #category : #merging }
RbsReplayMonitorCommand >> mergeWith: aCommand [

	^ aCommand mergeWithMove: self
]

{ #category : #merging }
RbsReplayMonitorCommand >> mergeWithMove: aMoveCommand [
	"We have two moves for now just add them not handling zero yet"

	| merged |
	merged := self class new 
		distance: aMoveCommand distance + distance;
		yourself.
	^ CTLinkedList new add: merged ; yourself
	
]
