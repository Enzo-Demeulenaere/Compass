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

{ #category : #accessing }
RbsMoveCommand >> distance [
	^ distance
]

{ #category : #accessing }
RbsMoveCommand >> distance: anInteger [ 
	distance := anInteger
]

{ #category : #execution }
RbsMoveCommand >> executeOn: aRobot [
	
	aRobot move: distance
]

{ #category : #execution }
RbsMoveCommand >> handleArguments: aCol [
	
	distance := Object readFrom: aCol first
]

{ #category : #merging }
RbsMoveCommand >> mergeWith: aCommand [

	^ aCommand mergeWithMove: self
]

{ #category : #merging }
RbsMoveCommand >> mergeWithMove: aMoveCommand [
	"We have two moves for now just add them not handling zero yet"

	| merged |
	merged := self class new 
		distance: aMoveCommand distance + distance;
		yourself.
	^ CTLinkedList new add: merged ; yourself
	
]

{ #category : #printing }
RbsMoveCommand >> printArguments: aStream [

	aStream print: distance

	
]
