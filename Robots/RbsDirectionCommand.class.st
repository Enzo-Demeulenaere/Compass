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

{ #category : #accessing }
RbsDirectionCommand >> direction [
	^ direction
]

{ #category : #accessing }
RbsDirectionCommand >> direction: aString [ 
	direction := aString
]

{ #category : #execution }
RbsDirectionCommand >> executeOn: aRobot [

	aRobot direction: direction
]

{ #category : #execution }
RbsDirectionCommand >> handleArguments: aCollection [
	
	direction := Object readFrom: aCollection first 
]

{ #category : #merging }
RbsDirectionCommand >> mergeWith: anotherCommand [

	^ anotherCommand mergeWithDirection: self
]

{ #category : #printing }
RbsDirectionCommand >> printArguments: aStream [

	aStream print: direction

	
]
