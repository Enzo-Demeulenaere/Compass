Class {
	#name : #RbsRobot,
	#superclass : #RbsTile,
	#instVars : [
		'startLocation',
		'direction',
		'orders',
		'cmdMap',
		'path'
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
RbsRobot >> optimizePath2: aString [
	
	"to be factored out"
	| optimizedPath |
	orders := aString splitOn: Character cr.
	orders := orders collect: [ :each | each splitOn: Character space ].
	
	"to be factored out too."
	path := orders collect: [ :each |
			(self commandClassFor: each first) new
				handleArguments: each allButFirst; 
				yourself ].
	path size > 1 ifFalse: [ ^  path ].
	
	optimizedPath := OrderedCollection new. 
	path overlappingPairsCollect: [:first :second | optimizedPath add: (first mergeWith: second) ].
	path := optimizedPath.
]

{ #category : #optimize }
RbsRobot >> optimizePath: aString [

	self parseOrders: aString.
	path := self optimize: path.
]

{ #category : #optimize }
RbsRobot >> parseOrders: aString [

	orders := aString splitOn: Character cr.
	orders := orders collect: [ :each | each splitOn: Character space ].

	"to be factored out too."
	path := CTLinkedList new.
	orders do: [ :each | 
		path addLast: ((self commandClassFor: each first) new
				 handleArguments: each allButFirst;
				 yourself) ]
]

{ #category : #optimize }
RbsRobot >> path [
	^ path
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
