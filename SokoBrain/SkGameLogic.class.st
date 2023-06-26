Class {
	#name : #SkGameLogic,
	#superclass : #TestCase,
	#category : #'SokoBrain-Tests'
}

{ #category : #tests }
SkGameLogic >> testIsFinished [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@$ .#'
			          fromPackage: SkBoard package).

	self deny: board isFinished.
	board player moveEast.
	board player moveEast.
	self assert: board isFinished
]

{ #category : #tests }
SkGameLogic >> testIsFinishedThenUnfinish [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@$ . #'
			          fromPackage: SkBoard package).
	self deny: board isFinished.
	board player moveEast.
	board player moveEast.
	self assert: board isFinished.
	board player moveEast.
	self deny: board isFinished
]

{ #category : #tests }
SkGameLogic >> testMoveSteps [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@$ . #'
			          fromPackage: SkBoard package).
	self deny: board isFinished.
	board moveSteps: {
			CpDirection east.
			CpDirection east }.
	self assert: board isFinished
]
