Class {
	#name : #SkBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'backgroundLayer',
		'foregroundLayer',
		'directionDict'
	],
	#category : #'SokoBrain-UI'
}

{ #category : #'as yet unclassified' }
SkBoardElement class >> openBoardTest [

	^ self openWithModel: SkBoard boardTest
]

{ #category : #'as yet unclassified' }
SkBoardElement class >> openWithModel: aSkBoard [

	self new openWithModel: aSkBoard.
]

{ #category : #accessing }
SkBoardElement >> backgroundLayer [ 

	^ backgroundLayer
]

{ #category : #accessing }
SkBoardElement >> backgroundLayer: aBlElement [

	backgroundLayer := aBlElement 
]

{ #category : #initialization }
SkBoardElement >> board [ 
	^ board
]

{ #category : #initialization }
SkBoardElement >> board: aSkBoard [

	board := aSkBoard.
	self constraintsDo: [ :c |
		c frame vertical alignCenter.
		c horizontal matchParent.
		c vertical fitContent ].
	self
		initializeBackgroundLayer;
		initializeForegroundLayer
]

{ #category : #accessing }
SkBoardElement >> directionDict [

	^ directionDict
]

{ #category : #'as yet unclassified' }
SkBoardElement >> elementsToUpdateAtPosition: aPoint goingIn: aCpDirection [

	| layer elements playerElement neighborElement nextNeighborElement |
	layer := self foregroundLayer.
	playerElement := layer childNamed: aPoint asString.
	neighborElement := layer childNamed:
		                   (aCpDirection * aPoint) asString.
	elements := {
		            playerElement.
		            neighborElement } asOrderedCollection.
	(neighborElement board map at: neighborElement positionInField) class
	= SkWall ifFalse: [
		nextNeighborElement := layer childNamed:
			                       (aCpDirection * (aCpDirection * aPoint))
				                       asString.
		elements add: nextNeighborElement ].
	^ elements
]

{ #category : #accessing }
SkBoardElement >> foregroundLayer [

	^ foregroundLayer
]

{ #category : #accessing }
SkBoardElement >> foregroundLayer: aBlElement [

	foregroundLayer := aBlElement 
]

{ #category : #initialization }
SkBoardElement >> initialize [

	super initialize.
	self initializeDirectionDict.
	self
		background: (BlBackground paint: Color veryLightGray);
		layout: BlFrameLayout new;
		addEventHandlerOn: BlKeyDownEvent
		do: [ :anEvent | self manageEvent: anEvent ];
		requestFocus
]

{ #category : #accessing }
SkBoardElement >> initializeBackgroundLayer [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width;
				          cellSpacing: 2);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox |
		tmpBox := aBox.
		(aBox class inheritsFrom: SkMovable) ifTrue: [
			tmpBox := aBox background ].
		boxElement := (SkBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
		layer addChild: boxElement.
		boxElement updateBackgroundColor ].

	self backgroundLayer: layer
]

{ #category : #initialization }
SkBoardElement >> initializeDirectionDict [

	directionDict := {
		        (#DOWN -> CpDirection south).
		        (#UP -> CpDirection north).
		        (#LEFT -> CpDirection west).
		        (#RIGHT -> CpDirection east) } asDictionary.
]

{ #category : #accessing }
SkBoardElement >> initializeForegroundLayer [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width;
				          cellSpacing: 2);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox |
		tmpBox := aBox.
		(aBox class inheritsFrom: SkMovable) ifFalse: [
			tmpBox := SkGround new ].
		boxElement := (SkBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
			             

		layer addChild: boxElement as: aBox position asString.
		boxElement  updateBackgroundColor ].

	self foregroundLayer: layer
]

{ #category : #initialization }
SkBoardElement >> manageEvent: anEvent [

	| player moved direction neighborElement elements |
	anEvent key name = #SPACE ifTrue: [
		self resetBoard.
		^ self ].
	board isFinished ifTrue: [
		^ self ].
	player := self board player.
	direction := self directionDict
		             at: anEvent key name
		             ifAbsent: [ 1 @ 1 ].

	elements := self
		            elementsToUpdateAtPosition: player position
		            goingIn: direction.
	moved := player move: direction.

	neighborElement := elements second.

	(moved and: [ neighborElement box class = SkBox ])
		ifTrue: [
			| animation |
			animation := neighborElement boxAnimationMovingInDirection:
				             direction.
			neighborElement addAnimation: (animation onFinishedDo: [
					 neighborElement resetAnimation.
					 self updateElements: elements ]) ]
		ifFalse: [ self updateElements: elements ]
]

{ #category : #'as yet unclassified' }
SkBoardElement >> openWithModel: aSkBoard [

	| space |
	space := OBlSpace new.

	self board: aSkBoard.

	space root addChild: self.
	space root background: Color red muchLighter.
	space root layout: BlFrameLayout new.
	space pulse
		extent: 1000 @ 1000;
		resizable: false;
		show
]

{ #category : #initialization }
SkBoardElement >> resetBoard [

	self space close.
	self board reset
]

{ #category : #'as yet unclassified' }
SkBoardElement >> updateElements: anOrderedCollection [

	anOrderedCollection do: [ :each | each boxForForeground updateBackgroundColor ]
]
