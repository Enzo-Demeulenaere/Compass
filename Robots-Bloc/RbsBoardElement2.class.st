Class {
	#name : #RbsBoardElement2,
	#superclass : #BlElement,
	#instVars : [
		'game',
		'mapping',
		'robot'
	],
	#category : #'Robots-Bloc'
}

{ #category : #example }
RbsBoardElement2 class >> boardAndRobotModel [
	
	| b rb |
	b := RbsBoard extent: 6@4.
	rb := RbsRobot new.
	rb setBoard: b.
	rb x: 4 y: 1.
	^ { b . rb }
]

{ #category : #example }
RbsBoardElement2 class >> open [
	<script>
	| space board models |
	space	 := BlSpace new.
	space show.
	board := self new.
	board inspect.
	models := self boardAndRobotModel.
	board boardGame: models first.
	board robot: models second.
	space addChild: board.

]

{ #category : #'accessing model' }
RbsBoardElement2 >> boardGame: aGame [

	game := aGame.
	"self layout columnCount: game width."
	game bottomUpDo: [ :aTile | 
		| brickElement |
		brickElement := self newBrickElementFor: aTile.
		brickElement manageYourselfFor: aTile In: self.
		self addChild: brickElement ].
	
]

{ #category : #initialization }
RbsBoardElement2 >> handleKeyEvent: anEvent [

	anEvent key isArrowRight
		ifTrue: [ robot move: 1. 
					self halt.
					] 
]

{ #category : #initialization }
RbsBoardElement2 >> initialize [

	super initialize.
	self layout: BlBasicLayout new.
	self background: Color yellow.
	"self background: (BlBackground paint: Color gray darker).
	self layout: BlBasicLayout new."

	self constraintsDo: [ :aLayoutConstraints | 
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ].
	self initializeMapping.
	self initializeHandlers.
]

{ #category : #initialization }
RbsBoardElement2 >> initializeHandlers [

	| e leftSC rightSC container |
	self when: BlMouseDownEvent do: [ :event | event target inspect ].
	"self requestFocus.
	self addEventHandler: (BlEventHandler on: BlKeyDownEvent
			do: [ :anEvent | self handleKeyEvent: anEvent])"
	leftSC := BlShortcutWithAction new
			 	combination: BlKeyCombination arrowLeft;
			  	action: [ :aShortcutEvent :aShortcut |
					aShortcutEvent traceCr.
					e relocate: (e position x - 20 @ e position y) ].
rightSC := BlShortcutWithAction new
			 	combination: BlKeyCombination arrowRight;
			  	action: [ :aShortcutEvent :aShortcut |
					aShortcutEvent traceCr.
					e relocate: (e position x + 20 @ e position y) ].
container addShortcut: leftSC.
container addShortcut: rightSC.
container requestFocus.
]

{ #category : #initialization }
RbsBoardElement2 >> initializeMapping [

	mapping := Dictionary new.
	mapping at: $_ put: RbsGroundElement.
	mapping at: $X put: RbsRobotElement
]

{ #category : #accessing }
RbsBoardElement2 >> newBrickElementFor: aTile [

	^ (mapping at: aTile class textualMapCharacter) new 
	
]

{ #category : #'accessing model' }
RbsBoardElement2 >> robot: aRobot [ 
	
	robot := aRobot
]
