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
	self deny: game isFinished. 
	game player moveEast.
	game player moveEast.
	self assert: game isFinished.
	game player moveEast.
	self deny: game isFinished
]

{ #category : #tests }
SkGameLogic >> testMoveSteps [

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@$ . #'.
	self deny: game isFinished. 
	game moveSteps: { CpDirection east . CpDirection east}.
	self assert: game isFinished. 
]
