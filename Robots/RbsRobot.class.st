Class {
	#name : #RbsRobot,
	#superclass : #RbsTile,
	#instVars : [
		'startLocation',
		'direction'
	],
	#category : #'Robots-Bots'
}

{ #category : #accessing }
RbsRobot >> direction [

	^ direction
]

{ #category : #accessing }
RbsRobot >> direction: anObject [

	direction := anObject
]

{ #category : #accessing }
RbsRobot >> startLocation [

	^ startLocation
]

{ #category : #accessing }
RbsRobot >> startLocation: anObject [

	startLocation := anObject
]
