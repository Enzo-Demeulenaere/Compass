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

	aRobot replay
]

{ #category : #merging }
RbsReplayMonitorCommand >> mergeWith: aCommand [

	^ OrderedCollection new addLast: aCommand; addLast: self;  yourself 
]
