Class {
	#name : #RbsStopMonitorCommand,
	#superclass : #RbsCommand,
	#category : #'Robots-Commands'
}

{ #category : #accessing }
RbsStopMonitorCommand class >> commandName [ 

	^ 'stopM'
]

{ #category : #adding }
RbsStopMonitorCommand >> addToPathOf: aRobot [

	"does nothing"
]

{ #category : #execution }
RbsStopMonitorCommand >> executeOn: aRobot [

	aRobot stopMonitoring
]
