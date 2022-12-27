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

{ #category : #'merging 2' }
RbsDirectionCommand >> mergeWith2: anotherCommand [

	^ anotherCommand mergeWithDirection2: self
]

{ #category : #merging }
RbsDirectionCommand >> mergeWith: anotherCommand [

	^ anotherCommand mergeWithDirection: self
]

{ #category : #'merging 2' }
RbsDirectionCommand >> mergeWithDirection2: aDirectionCommand [

	^ OrderedCollection new addLast: self; yourself
]

{ #category : #merging }
RbsDirectionCommand >> mergeWithDirection: aDirectionCommand [

	^ CTLinkedList new add: self; yourself
]

{ #category : #'merging 2' }
RbsDirectionCommand >> mergeWithMove2: aMoveCommand [

	^ OrderedCollection new addLast: aMoveCommand ; addLast: self;  yourself 
]

{ #category : #merging }
RbsDirectionCommand >> mergeWithMove: aMoveCommand [

	^ CTLinkedList new add: aMoveCommand ;add: self;  yourself 
]

{ #category : #printing }
RbsDirectionCommand >> printArguments: aStream [

	aStream print: direction

	
]
