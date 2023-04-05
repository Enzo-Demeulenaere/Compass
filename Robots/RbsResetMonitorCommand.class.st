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

{ #category : #adding }
RbsResetMonitorCommand >> addToPathOf: aRobot [

	"does nothing"
]

{ #category : #execution }
RbsResetMonitorCommand >> executeOn: aRobot [

	aRobot initializePath.
]

{ #category : #merging }
RbsResetMonitorCommand >> mergeWith: aCommand [

	^ OrderedCollection new addLast: aCommand ; addLast: self;  yourself 
]
