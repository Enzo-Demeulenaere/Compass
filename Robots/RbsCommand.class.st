Class {
	#name : #RbsCommand,
	#superclass : #Object,
	#category : #'Robots-Commands'
}

{ #category : #execution }
RbsCommand >> handleArguments: aCollection [

	self subclassResponsibility 
]

{ #category : #merging }
RbsCommand >> mergeWith: anotherCommand [

	^ self subclassResponsibility 
]

{ #category : #merging }
RbsCommand >> mergeWithDirection: aDirectionCommand [
	"any command is never merged with a direction command"
	
	^ CTLinkedList new  add: aDirectionCommand; add: self ; yourself
]

{ #category : #merging }
RbsCommand >> mergeWithMove: aMoveCommand [
	"any command is never merged with a move command"
	
	^ CTLinkedList new add: self ; add: aMoveCommand ; yourself
]

{ #category : #printing }
RbsCommand >> printArguments: aStream [
]

{ #category : #printing }
RbsCommand >> printOn: aStream [

	aStream nextPutAll: self class commandName.
	aStream space.
	self printArguments: aStream
]
