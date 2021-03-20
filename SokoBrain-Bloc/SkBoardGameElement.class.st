Class {
	#name : #SkBoardGameElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'SokoBrain-Bloc'
}

{ #category : #example }
SkBoardGameElement class >> example [
	<sampleInstance>
	
	^ self new memoryGame: MGGame withNumbers; yourself

]

{ #category : #example }
SkBoardGameElement class >> exampleInASpace [
	<sampleInstance>
	
	self openOnModel: MGGame withNumbers inSpace: (BlSpace new extent: 420@420; yourself)

]

{ #category : #example }
SkBoardGameElement class >> exampleInASpaceInAnOSWindow [
	<sampleInstance>
	
	self nativelyOpenOnModel: MGGame withNumbers inSpace: BlSpace new.
]

{ #category : #opening }
SkBoardGameElement class >> nativelyOpenOnModel: aModel inSpace: aSpace [

	aSpace host: BlOSWindowSDL2Host new.
	^ self openOnModel: aModel inSpace: aSpace.
]

{ #category : #'instance creation' }
SkBoardGameElement class >> onModel: aModel [

	^ self new memoryGame: aModel; yourself
]

{ #category : #'instance creation' }
SkBoardGameElement class >> onModel: aModel inSpace: aSpace [

	| game |
	game := self onModel: aModel.
	aSpace addChild: game. 
	^ game
]

{ #category : #opening }
SkBoardGameElement class >> openOnModel: aModel inSpace: aSpace [

	| game |
	game := self onModel: aModel inSpace: aSpace.
	aSpace pulse.
	aSpace show.
	^ game
]

{ #category : #initialization }
SkBoardGameElement >> initialize [

	super initialize.

	self background: (BlBackground paint: Color gray darker).
	self layout: (BlGridLayout horizontal cellSpacing: 20).

	self constraintsDo: [ :aLayoutConstraints | 
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]

{ #category : #accessing }
SkBoardGameElement >> memoryGame [
	^ game
]

{ #category : #accessing }
SkBoardGameElement >> memoryGame: aGame [

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
SkBoardGameElement >> newCardElement [
	^ MGCardElement new
]

{ #category : #'instance creation' }
SkBoardGameElement >> newCardEventListener [

	^ MGCardEventListener new
]
