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
	space addChild: aSkBoardElement.
	space pulse
		extent: aSkBoardElement extent;
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

	board do: [ :aBox |
		| boxElement |
		boxElement := (SkBoxElement box: aBox) board: aSkBoard.
		self addChild: boxElement ].

	self
		initializeBackgroundLayer;
		initializeForegroundLayer;addChildren: { backgroundLayer.foregroundLayer  }
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
		"layout: BlSquaredLayout new;"
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ]
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
			         c vertical matchParent ].

	board do: [ :aBox |
		| boxElement tmpBox |
		tmpBox := aBox.
		(aBox class inheritsFrom: SkMovable) ifTrue: [
			tmpBox := SkGround new ].
		boxElement := (SkBoxElement box: tmpBox)
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
			         c horizontal matchParent.
			         c vertical matchParent ].

	board do: [ :aBox |
		| boxElement tmpBox |
		tmpBox := aBox.
		(aBox class inheritsFrom: SkMovable) ifFalse: [
			tmpBox := SkGround new ].
		boxElement := (SkBoxElement box: tmpBox)
			              board: board;
			              updateBackgroundColor.
		layer addChild: boxElement ].

	self foregroundLayer: layer
]
