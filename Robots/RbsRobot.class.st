Class {
	#name : #RbsRobot,
	#superclass : #RbsTile,
	#instVars : [
		'startLocation',
		'direction'
	],
	#category : #'Robots-Bots'
}

{ #category : #'default encoding' }
RbsRobot class >> textualMapCharacter [
	^ $X
]

{ #category : #accessing }
RbsRobot >> direction [

	^ direction
]

{ #category : #accessing }
RbsRobot >> direction: anObject [

	direction := anObject
]

{ #category : #accessing }
RbsRobot >> initialize [ 
		
	super initialize.
	"like that it will quite ugly to move :) and we will introduce a nicer way."
	direction := #east
]

{ #category : #action }
RbsRobot >> move: anInteger [ 
	
	direction = #east
		ifTrue: [ self x: self x + anInteger ]
		ifFalse: [ direction = #west
			ifTrue: [ self x: self x - anInteger ]
			ifFalse: [ direction = #north
					ifTrue: [ self y: self y + anInteger ]
					ifFalse: [ self y: self y - anInteger ]
				]
			]
]

{ #category : #accessing }
RbsRobot >> startLocation [

	^ startLocation
]

{ #category : #accessing }
RbsRobot >> startLocation: aPoint [

	startLocation := aPoint.
	self x: aPoint x y: aPoint y.
	self board atX: aPoint x atY: aPoint y put: self
	
]
