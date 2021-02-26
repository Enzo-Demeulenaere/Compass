Class {
	#name : #SkMoveInSituationTest,
	#superclass : #TestCase,
	#category : #'SokoBrain-Tests'
}

{ #category : #'tests - building' }
SkMoveInSituationTest >> testBoxMovingOnTarget [

	| importer game position |
	self skip.
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@.$#'."The situation should be changed"
	game identifyPlayer.
	position := game player position. 
	self assert: (game player move: CpDirection east).
	self assert: game player position x equals: (CpDirection east * position) x.
	self assert: game player position y equals: (CpDirection east * position) y.
]

{ #category : #'tests - building' }
SkMoveInSituationTest >> testPlayerBumpingInWall [

	| importer game position  |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@#'.
	game identifyPlayer.
	position := game player position.
	self deny: (game player move: CpDirection east).
	self assert: game player position equals: position
]

{ #category : #'tests - building' }
SkMoveInSituationTest >> testPlayerMovingOnGround [

	| importer game position |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@ #'.
	game identifyPlayer.
	position := game player position. 
	self assert: (game player move: CpDirection east).
	self assert: game player position x equals: (CpDirection east * position) x.
	self assert: game player position y equals: (CpDirection east * position) y.
]

{ #category : #'tests - building' }
SkMoveInSituationTest >> testPlayerMovingOnTarget [

	| importer game position |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@.$#'.
	game identifyPlayer.
	position := game player position. 
	self assert: (game player move: CpDirection east).
	self assert: game player position x equals: (CpDirection east * position) x.
	self assert: game player position y equals: (CpDirection east * position) y.
]

{ #category : #'tests - building' }
SkMoveInSituationTest >> testPushingABoxOnGround [

	| importer game position |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@$  .#'.
	game identifyPlayer.
	position := game player position.
	self assert: (game player move: CpDirection east).
	self assert: game player position x equals: (CpDirection east * position) x.
	self assert: game player position x equals: 3.
	
	"The player has moves, now cheking that the box has moved too"
	"Now the board contents is not correctly updated."
	self assert: (game atPosition: (3@1)) position x equals: 4.
	"what!"
	self assert: ((game atPosition: CpDirection east * game player position) isKindOf: SkBox)
	
]
