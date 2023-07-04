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

{ #category : #tests }
SkGameManagerTest >> testRegisterLevel [

	| manager board string |
	manager := SkGameManager new.
	string := SkGameManager mazesTest at: 1.
	manager launchFromString: string inDictionary: 'mazesTest' at: 1.
	board := manager currentBoardElement board.

	self
		should: [
		(manager packDictionary at: 'mazesTest') levelDictionary at: 1 ]
		raise: KeyNotFound.
	board player moveEast.
	board player moveEast.

	self assert:
		((manager packDictionary at: 'mazesTest') levelDictionary at: 1)
			isNotNil.
	self assert: ((manager packDictionary at: 'mazesTest') levelDictionary at: 1) bestCount equals: 2 
]

{ #category : #tests }
SkGameManagerTest >> testRegisterLevelWithBetterMoveCount [

	| manager board string registered |
	manager := SkGameManager new.
	string := SkGameManager mazesTest at: 1.
	manager launchFromString: string inDictionary: 'mazesTest' at: 1.
	board := manager currentBoardElement board.

	self
		should: [
		(manager packDictionary at: 'mazesTest') levelDictionary at: 1 ]
		raise: KeyNotFound.
	board player moveEast.
	board player moveWest.
	board player moveEast.
	board player moveEast.

	registered := (manager packDictionary at: 'mazesTest')
		              levelDictionary at: 1.

	self assert: registered isNotNil.
	self assert: registered bestCount equals: 4.
	
	manager launchAgain.

	board := manager currentBoardElement board.
	board player moveEast.
	board player moveEast.

	self
		assert:
			((manager packDictionary at: 'mazesTest') levelDictionary at: 1)
				bestCount
		equals: 2
]

{ #category : #tests }
SkGameManagerTest >> testRegisterLevelWithWorseMoveCount [

	| manager board string registered |
	manager := SkGameManager new.
	string := SkGameManager mazesTest at: 1.
	manager launchFromString: string inDictionary: 'mazesTest' at: 1.
	board := manager currentBoardElement board.

	self
		should: [
		(manager packDictionary at: 'mazesTest') levelDictionary at: 1 ]
		raise: KeyNotFound.
		
		board player moveEast.
	board player moveEast.
	
	registered := (manager packDictionary at: 'mazesTest')
		              levelDictionary at: 1.


	self assert: registered isNotNil.
	self assert: registered bestCount equals: 2.

	manager launchAgain.
	board := manager currentBoardElement board.
	
	board player moveEast.
	board player moveWest.
	board player moveEast.
	board player moveEast.

		
self
		assert:
			((manager packDictionary at: 'mazesTest') levelDictionary at: 1)
				bestCount
		equals: 2.

]
