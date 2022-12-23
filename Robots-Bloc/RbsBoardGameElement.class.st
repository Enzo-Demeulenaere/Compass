Class {
	#name : #RbsBoardGameElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'Robots-Bloc'
}

{ #category : #example }
RbsBoardGameElement class >> example [
	<sampleInstance>
	
	^ self new memoryGame: MGGame withNumbers; yourself

]

{ #category : #example }
RbsBoardGameElement class >> exampleInASpace [
	<sampleInstance>
	
	self openOnModel: MGGame withNumbers inSpace: (BlSpace new extent: 420@420; yourself)

]

{ #category : #example }
RbsBoardGameElement class >> exampleInASpaceInAnOSWindow [
	<sampleInstance>
	
	self nativelyOpenOnModel: MGGame withNumbers inSpace: BlSpace new.
]

{ #category : #opening }
RbsBoardGameElement class >> nativelyOpenOnModel: aModel inSpace: aSpace [

	aSpace host: BlOSWindowSDL2Host new.
	^ self openOnModel: aModel inSpace: aSpace.
]

{ #category : #'instance creation' }
RbsBoardGameElement class >> onModel: aModel [

	^ self new memoryGame: aModel; yourself
]

{ #category : #'instance creation' }
RbsBoardGameElement class >> onModel: aModel inSpace: aSpace [

	| game |
	game := self onModel: aModel.
	aSpace addChild: game. 
	^ game
]

{ #category : #opening }
RbsBoardGameElement class >> openOnModel: aModel inSpace: aSpace [

	| game |
	game := self onModel: aModel inSpace: aSpace.
	aSpace pulse.
	aSpace show.
	^ game
]

{ #category : #example }
RbsBoardGameElement class >> openWithNumber [

	<script>
	| aGameElement space |
	aGameElement := MGGameElement new
		                memoryGame: MGGame withNumbers;
		                yourself.
	space := BlSpace new.
	space host: BlOSWindowSDL2Host new.
	space root addChild: aGameElement.
	"space root layout: BlFrameLayout new.
	space root constraintsDo: [ :c | 
		c horizontal fitContent.
		c vertical fitContent ]."
	space root whenLayoutedDoOnce: [ space extent: 420 @ 420 ].
	space show
]

{ #category : #example }
RbsBoardGameElement class >> openWithNumberNoHost [

	<script>
	| aGameElement space |
	aGameElement := MGGameElement new
		                memoryGame: MGGame withNumbers;
		                yourself.
	space := BlSpace new.
	space root addChild: aGameElement.
	"space root layout: BlFrameLayout new.
	space root constraintsDo: [ :c | 
		c horizontal fitContent.
		c vertical fitContent ]."
	space root whenLayoutedDoOnce: [ space extent: 420 @ 420 ].
	space show
]

{ #category : #accessing }
RbsBoardGameElement >> boardGame: aGame [

	game := aGame.
	self layout columnCount: game gridSize.
	game availableCards do: [ :aTile | 
		| cardElement |
		cardElement := self newTileElement tile: aTile.
		self addChild: cardElement ]
]

{ #category : #initialization }
RbsBoardGameElement >> initialize [

	super initialize.

	self background: (BlBackground paint: Color gray darker).
	self layout: (BlGridLayout horizontal cellSpacing: 2).

	self constraintsDo: [ :aLayoutConstraints | 
		aLayoutConstraints horizontal matchParent.
		aLayoutConstraints vertical matchParent ]
]

{ #category : #'instance creation' }
RbsBoardGameElement >> newCardEventListener [

	^ MGCardEventListener new
]

{ #category : #accessing }
RbsBoardGameElement >> newTileElement [

	^ RbsTileElement new
]
