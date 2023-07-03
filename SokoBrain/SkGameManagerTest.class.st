Class {
	#name : #SkGameManagerTest,
	#superclass : #TestCase,
	#category : #'SokoBrain-Tests'
}

{ #category : #tests }
SkGameManagerTest >> testIsBoardReset [

	| string manager boardElement |
	string := '#@$ .#'.
	manager := SkGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: '#@$ .#'.
	boardElement board player moveEast.
	self assert: boardElement board printString equals: '# @$.#'.
	boardElement eventDispatcher handlers first handleEvent:
		(KeyboardEvent new key: KeyboardKey space).
	boardElement := manager currentBoardElement.
	self assert: boardElement board printString equals: '#@$ .#'
]

{ #category : #tests }
SkGameManagerTest >> testMoveCount [

	| string manager boardElement |
	string := '#@$ .#'.
	manager := SkGameManager new.
	manager launchFromString: string.
	boardElement := manager currentBoardElement.

	self assert: boardElement board printString equals: '#@$ .#'.
	self assert: manager currentMoveCount equals: 0.
	boardElement board player moveWest.
	self assert: boardElement board printString equals: '#@$ .#'.
	self assert: manager currentMoveCount equals: 0.
	boardElement board player moveEast.
	self assert: boardElement board printString equals: '# @$.#'.
	self assert: manager currentMoveCount equals: 1
]
