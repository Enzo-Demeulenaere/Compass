Class {
	#name : #RbsCommand,
	#superclass : #Object,
	#category : #'Robots-Commands'
}

{ #category : #adding }
RbsCommand >> addToPathOf: aRobot [

	aRobot addToPath: self.
]

{ #category : #wayback }
RbsCommand >> asWayBack [

	^ self
]

{ #category : #execution }
RbsCommand >> handleArguments: aCollection [
	
]

{ #category : #merging }
RbsCommand >> mergeWith: anotherCommand [

	^ self subclassResponsibility 
]

{ #category : #'merging 2' }
RbsCommand >> mergeWithDirection2: aDirectionCommand [
	"any command is never merged with a direction command"
	
	^ OrderedCollection new addLast: aDirectionCommand; addLast: self ; yourself
]

{ #category : #'merging 2' }
RbsCommand >> mergeWithDirection: aDirectionCommand [
	"any command is never merged with a direction command"
	
	^ OrderedCollection new addLast: aDirectionCommand; addLast: self ; yourself
]

{ #category : #'merging 2' }
RbsCommand >> mergeWithMove2: aMoveCommand [
	"any command is never merged with a move command"
	
	^ OrderedCollection new addLast: self ; addLast: aMoveCommand ; yourself
]

{ #category : #'merging 2' }
RbsCommand >> mergeWithMove: aMoveCommand [
	"any command is never merged with a move command"
	
	^ OrderedCollection new addLast: self ; addLast: aMoveCommand ; yourself
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
