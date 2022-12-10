Class {
	#name : #RbsMoveCommand,
	#superclass : #RbsCommand,
	#instVars : [
		'distance'
	],
	#category : #'Robots-Commands'
}

{ #category : #accessing }
RbsMoveCommand class >> commandName [ 
	^ 'mov'
]

{ #category : #execution }
RbsMoveCommand >> executeOn: aRobot [
	
	aRobot move: distance
]

{ #category : #execution }
RbsMoveCommand >> handleArguments: aCol [
	
	distance := Object readFrom: aCol first
]
