"
For now let us imagine that we can have only one robot per board...
"
Class {
	#name : #RbsBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'game',
		'mapping',
		'robot'
	],
	#category : #'Robots-Bloc'
}

{ #category : #example }
RbsBoardElement class >> boardAndRobotModel [
	
	| b rb |
	b := RbsBoard extent: 6@4.
	rb := RbsRobot new.
	rb setBoard: b.
	rb x: 4 y: 1.
	^ { b . rb }
]

{ #category : #example }
RbsBoardElement class >> open [
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
RbsBoardElement >> boardGame: aGame [

	game := aGame.
	"self layout columnCount: game width."
	game bottomUpDo: [ :aTile | 
		| brickElement |
		brickElement := self newBrickElementFor: aTile.
		self addChild: brickElement ]
]

{ #category : #initialization }
RbsBoardElement >> handleKeyEvent: anEvent [

	anEvent key isArrowRight
		ifTrue: [ robot move: 1. 
					self halt.
					] 
]

{ #category : #initialization }
RbsBoardElement >> initialize [

	super initialize.

	self background: (BlBackground paint: Color gray darker).
	self layout: BlBasicLayout new.

	self constraintsDo: [ :aLayoutConstraints | 
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ].
	self initializeMapping.
	self initializeHandlers.
]

{ #category : #initialization }
RbsBoardElement >> initializeHandlers [

	self requestFocus.
	self addEventHandler: (BlEventHandler on: BlKeyDownEvent
			do: [ :anEvent | self handleKeyEvent: anEvent])
		
]

{ #category : #initialization }
RbsBoardElement >> initializeMapping [

	mapping := Dictionary new.
	mapping at: $_ put: RbsGroundElement.
	mapping at: $X put: RbsRobotElement
]

{ #category : #accessing }
RbsBoardElement >> memoryGame: aGame [

	| aCardEventListener |
	game := aGame.
	aCardEventListener := self newCardEventListener memoryGame: aGame.
	self layout columnCount: game gridSize.
	game availableCards do: [ :aCard | 
		| cardElement |
		cardElement := self newCardElement card: aCard.
		cardElement addEventHandler: aCardEventListener.
		self addChild: cardElement ]
]

{ #category : #accessing }
RbsBoardElement >> newBrickElementFor: aTile [

	^ (mapping at: aTile class textualMapCharacter) new 
	
]

{ #category : #'accessing model' }
RbsBoardElement >> robot: aRobot [ 
	
	robot := aRobot
]
