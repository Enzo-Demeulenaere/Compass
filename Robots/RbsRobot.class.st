Class {
	#name : #RbsRobot,
	#superclass : #RbsAbstractRobot,
	#instVars : [
		'startLocation',
		'direction',
		'cmdMap',
		'path',
		'monitoring',
		'previousTile'
	],
	#category : #'Robots-Bots'
}

{ #category : #'default encoding' }
RbsRobot class >> textualMapCharacter [
	^ $X
]

{ #category : #replay }
RbsRobot >> addToPath: aCommand [ 
	path addLast: aCommand
]

{ #category : #commands }
RbsRobot >> commandClassFor: aString [

	^ cmdMap at: aString
]

{ #category : #action }
RbsRobot >> computeNewPosition: anInteger [ 
	"Returns a point representing the location of the next move."
	^ direction = #east
		ifTrue: [ self x + anInteger @ self y ]
		ifFalse: [ direction = #west
			ifTrue: [ self x - anInteger @self y ]
			ifFalse: [ direction = #north
					ifTrue: [ self x @ (self y + anInteger)]
					ifFalse: [ self x @ (self y - anInteger) ].
				]
			]
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

	(self identifyOrdersOf: aString)
		do: [ :each | 
		each first = #mov
			ifTrue: [ self move: (Object readFrom: each second) ]
			ifFalse: [ 
				each first = #dir ifTrue: [ 
					self direction: (Object readFrom: each second) ] ] ]
]

{ #category : #commands }
RbsRobot >> executeCommandBased: aString [

	(self identifyOrdersOf: aString) do: [ :each |
			| cmd |
			cmd := ((self commandClassFor: each first) new
				handleArguments: each allButFirst; yourself).
			monitoring ifTrue: [ cmd addToPathOf: self ].
			cmd executeOn: self ]
]

{ #category : #commands }
RbsRobot >> executeCommandBasedV1: aString [

	(self identifyOrdersOf: aString) do: [ :each |
		((self commandClassFor: each first) new
			handleArguments: each allButFirst; yourself) executeOn: self ]
]

{ #category : #commands }
RbsRobot >> executeCommandBasedV2: aString [

	(self identifyOrdersOf: aString) do: [ :each |
			| cmd |
			cmd := ((self commandClassFor: each first) new
				handleArguments: each allButFirst; yourself).
			path addLast: cmd.
			cmd executeOn: self ]
]

{ #category : #action }
RbsRobot >> identifyOrdersOf: aString [

	| orders |
	orders := aString splitOn: Character cr.
	orders := orders collect: [ :each | each splitOn: Character space ].
	^ orders
]

{ #category : #initialization }
RbsRobot >> initialize [ 
		
	super initialize.
	"like that it will quite ugly to move :) and we will introduce a nicer way."
	direction := #east.
	monitoring := true.
	self initializePath.
	self initializeCommandMapping.
]

{ #category : #initialization }
RbsRobot >> initializeCommandMapping [

	cmdMap := Dictionary new.
	RbsCommand allSubclassesDo: [ :each |
		cmdMap at: each commandName put: each 	
		]
]

{ #category : #initialization }
RbsRobot >> initializePath [

	path := OrderedCollection new.
]

{ #category : #action }
RbsRobot >> move: anInteger [ 
	
	| newPosition |
	newPosition := self computeNewPosition: anInteger.
	self previousTile position: self previousTile position.
	"It looks strange but position will set the board."
	 
	previousTile := self board atPosition: newPosition.
	self position: newPosition.
]

{ #category : #optimize }
RbsRobot >> optimize: aList [
	"Returns an optimized list"
	
	| first second mergedList |
	aList size > 1 ifFalse: [ ^ aList ].
	"we have at least two elements."
	first := aList first.
	second := aList second.
	mergedList := first mergeWith: second.
	^ mergedList size = 1
		ifTrue: [ 
			aList size > 2
			"here we got a merge so we optimise the merged and the rest because we can have three or more in a row"
				ifTrue: [ self optimize: (mergedList addLast: aList firstLink nextLink nextLink; yourself) ]
				ifFalse: [ mergedList ]]
		ifFalse: [
			"here we got no merges so we keep the first and optimize the rest."
			 (CTLinkedList new add: first; yourself) append: 
							(self optimize: (CTLinkedList new add: aList firstLink nextLink; yourself)) ]
]

{ #category : #optimize }
RbsRobot >> optimizePath: aString [

	self parseOrders: aString.
	path := self optimize: path.
]

{ #category : #optimize }
RbsRobot >> parseOrders: aString [

	path := CTLinkedList new.
	(self identifyOrdersOf: aString) do: [ :each | 
		path addLast: ((self commandClassFor: each first) new
				 handleArguments: each allButFirst;
				 yourself) ]
]

{ #category : #optimize }
RbsRobot >> path [
	^ path
]

{ #category : #accessing }
RbsRobot >> previousTile [
	^ previousTile
]

{ #category : #action }
RbsRobot >> replay [

	path do: [ :each | each executeOn: self ]
]

{ #category : #accessing }
RbsRobot >> startLocation [

	^ startLocation
]

{ #category : #accessing }
RbsRobot >> startLocation: aPoint [
	
	previousTile := self board atX: aPoint x atY: aPoint y.
	startLocation := aPoint.
	self x: aPoint x y: aPoint y.

	
]

{ #category : #accessing }
RbsRobot >> startMonitoring [ 
	
	monitoring := true 
]

{ #category : #accessing }
RbsRobot >> stopMonitoring [ 
	
	monitoring := false 
]
