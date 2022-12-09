Class {
	#name : #RbsRobot,
	#superclass : #RbsTile,
	#instVars : [
		'startLocation',
		'direction',
		'orders',
		'cmdMap'
	],
	#category : #'Robots-Bots'
}

{ #category : #'default encoding' }
RbsRobot class >> textualMapCharacter [
	^ $X
]

{ #category : #commands }
RbsRobot >> commandClassFor: aString [

	^ cmdMap at: aString
]

{ #category : #accessing }
RbsRobot >> direction [

	^ direction
]

{ #category : #accessing }
RbsRobot >> direction: anObject [

	direction := anObject
]

{ #category : #action }
RbsRobot >> execute: aString [

	orders := aString splitOn: Character cr.
	orders := orders collect: [ :each | each splitOn: Character space ].
	orders do: [ :each |
			each first = #mov
				ifTrue: [ self move: (Object readFrom: each second) ]
				ifFalse: [ each first = #dir
								ifTrue: [ self direction: (Object readFrom: each second) ] ]
		 ]
]

{ #category : #commands }
RbsRobot >> executeCommandBased: aString [

	orders := aString splitOn: Character cr.
	orders := orders collect: [ :each | each splitOn: Character space ].
	orders do: [ :each |
			(self commandClassFor: each first) new
				handleArguments: each allButFirst;
				executeOn: self ]
]

{ #category : #accessing }
RbsRobot >> initialize [ 
		
	super initialize.
	"like that it will quite ugly to move :) and we will introduce a nicer way."
	direction := #east.
	self initializeCommandMapping 
]

{ #category : #accessing }
RbsRobot >> initializeCommandMapping [

	cmdMap := Dictionary new.
	RbsCommand allSubclassesDo: [ :each |
		cmdMap at: each commandName put: each 	
		]
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

	
]
