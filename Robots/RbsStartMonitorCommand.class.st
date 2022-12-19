Class {
	#name : #RbsStartMonitorCommand,
	#superclass : #RbsCommand,
	#category : #'Robots-Commands'
}

{ #category : #accessing }
RbsStartMonitorCommand class >> commandName [ 

	^ 'startM'
]

{ #category : #execution }
RbsStartMonitorCommand >> executeOn: aRobot [

	aRobot startMonitoring
]
