Class {
	#name : #RbsStopMonitorCommand,
	#superclass : #RbsCommand,
	#category : #'Robots-Commands'
}

{ #category : #accessing }
RbsStopMonitorCommand class >> commandName [ 

	^ 'stopM'
]

{ #category : #execution }
RbsStopMonitorCommand >> executeOn: aRobot [

	aRobot stopMonitoring
]
