Class {
	#name : #SkGameLogic,
	#superclass : #TestCase,
	#category : #'SokoBrain-Tests'
}

{ #category : #tests }
SkGameLogic >> testIsFinished [

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@$ .#'.
	game identifyPlayer.
	game finalize.
	self deny: game isFinished. 
	game player moveEast.
	game player moveEast.
	self assert: game isFinished
]

{ #category : #tests }
SkGameLogic >> testIsFinishedThenUnfinish [

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@$ . #'.
	game identifyPlayer.
	game finalize.
	self deny: game isFinished. 
	game player moveEast.
	game player moveEast.
	self assert: game isFinished.
	game player moveEast.
	self deny: game isFinished
]
