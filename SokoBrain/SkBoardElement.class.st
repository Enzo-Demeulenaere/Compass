Class {
	#name : #SkBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'backgroundLayer',
		'foregroundLayer'
	],
	#category : #'SokoBrain-UI'
}

{ #category : #'as yet unclassified' }
SkBoardElement class >> openBoardTest [

	^ self openWithModel: SkBoard boardTest
]

{ #category : #'as yet unclassified' }
SkBoardElement class >> openWithModel: aSkBoard [

	| aSkBoardElement space |
	space := BlSpace new.
	aSkBoardElement := self new
		                   board: aSkBoard;
		                   yourself.

	space root addChild: aSkBoardElement.
	space root background: Color red muchLighter.
	space root layout: BlFrameLayout new.
	space pulse
		extent: 1000 @ 1000;
		resizable: false;
		show
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
		initializeForegroundLayer;
		addChildren: {
				backgroundLayer.
				foregroundLayer }
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
			         self board width > self board height
				         ifTrue: [
					         c horizontal matchParent.
					         c vertical fitContent ]
				         ifFalse: [
					         c horizontal fitContent.
					         c vertical matchParent ] ].

	self board do: [ :aBox |
		| boxElement tmpBox |
		tmpBox := aBox.
		(aBox class inheritsFrom: SkMovable) ifTrue: [
			tmpBox := aBox background ].
		boxElement := (SkBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board;
			              updateBackgroundColor.
		layer addChild: boxElement ].

	self backgroundLayer: layer
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
			         self board width > self board height
				         ifTrue: [
					         c horizontal matchParent.
					         c vertical fitContent ]
				         ifFalse: [
					         c horizontal fitContent.
					         c vertical matchParent ] ].
	self board do: [ :aBox |
		| boxElement tmpBox |
		tmpBox := aBox.
		(aBox class inheritsFrom: SkMovable) ifFalse: [
			tmpBox := SkGround new ].
		boxElement := (SkBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board;
			              updateBackgroundColor.

		layer addChild: boxElement as: aBox position asString ].

	self foregroundLayer: layer
]

{ #category : #initialization }
SkBoardElement >> manageEvent: anEvent [

	| dict player position |
	player := self board player.
	position := player position.
	dict := {
		        (#DOWN -> CpDirection south).
		        (#UP -> CpDirection north).
		        (#LEFT -> CpDirection west).
		        (#RIGHT -> CpDirection east) } asDictionary.
	player move: (dict at: anEvent key name ifAbsent: [ 1 @ 1 ]).
	(self foregroundLayer childNamed: position asString) boxForForeground
		updateBackgroundColor.
	(self foregroundLayer childNamed: player position asString)
		boxForForeground updateBackgroundColor.
	(self foregroundLayer childNamed:
		 ((dict at: anEvent key name) * player position) asString) boxForForeground 
		updateBackgroundColor
]
