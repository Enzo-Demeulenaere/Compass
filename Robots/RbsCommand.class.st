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

	^ anotherCommand mergeWithMove: self 
]

{ #category : #merging }
RbsCommand >> mergeWithDirection: aDirectionCommand [

	^ self
]

{ #category : #merging }
RbsCommand >> mergeWithMove: aMoveCommand [

	^ self
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
