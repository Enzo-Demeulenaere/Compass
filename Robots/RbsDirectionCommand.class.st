Class {
	#name : #RbsDirectionCommand,
	#superclass : #RbsCommand,
	#instVars : [
		'direction'
	],
	#category : #'Robots-Commands'
}

{ #category : #accessing }
RbsDirectionCommand class >> commandName [
 
	^ 'dir'
]

{ #category : #'as yet unclassified' }
RbsDirectionCommand >> executeOn: aRobot [

	aRobot direction: direction
]

{ #category : #'as yet unclassified' }
RbsDirectionCommand >> handleArguments: aCollection [

	direction := aCollection first asSymbol. 
]
