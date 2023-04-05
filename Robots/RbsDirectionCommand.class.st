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

{ #category : #wayback }
RbsDirectionCommand >> asWayBack [
	^ self class new direction: (self computeOppositeDirection: direction)
]

{ #category : #action }
RbsDirectionCommand >> computeOppositeDirection: aDirection [ 
	"Returns the opposite direction. 
	Note that this implementation should be rewritten taking into account Compass' way to represent direction and their computation'"

	^ aDirection = #east
		ifTrue: [ #west ]
		ifFalse: [ aDirection = #west
			ifTrue: [ #east ]
			ifFalse: [ aDirection = #north
					ifTrue: [ #south]
					ifFalse: [ #north].
				]
			]
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
RbsDirectionCommand >> mergeWith: anotherCommand [

	^ anotherCommand mergeWithDirection: self
]

{ #category : #'merging 2' }
RbsDirectionCommand >> mergeWithDirection: aDirectionCommand [

	^ OrderedCollection new addLast: self; yourself
]

{ #category : #'merging 2' }
RbsDirectionCommand >> mergeWithMove: aMoveCommand [

	^ OrderedCollection new addLast: aMoveCommand ; addLast: self;  yourself 
]

{ #category : #printing }
RbsDirectionCommand >> printArguments: aStream [

	aStream print: direction

	
]

{ #category : #action }
RbsDirectionCommand >> pushToStack: aStack [

	aStack push: self
]
