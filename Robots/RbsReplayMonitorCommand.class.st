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
RbsReplayMonitorCommand >> addToPathOf: aRobot [

	"does nothing"
]

{ #category : #execution }
RbsReplayMonitorCommand >> executeOn: aRobot [
	self halt.
	aRobot replay
]

{ #category : #merging }
RbsReplayMonitorCommand >> mergeWith: aCommand [

	^ CTLinkedList new add: aCommand ;add: self;  yourself 
]
