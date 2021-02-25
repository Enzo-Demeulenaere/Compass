Class {
	#name : #SkMoveInSituationTest,
	#superclass : #TestCase,
	#category : #'SokoBrain-Tests'
}

{ #category : #'tests - building' }
SkMoveInSituationTest >> testPlayerBumpingInWall [

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@#'.
	game identifyPlayer.
	self deny: (game player move: CpDirection east)
	
]

{ #category : #'tests - building' }
SkMoveInSituationTest >> testPushingABoxOnGround [

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@$  .#'.
	self assert: game player 
	
]
