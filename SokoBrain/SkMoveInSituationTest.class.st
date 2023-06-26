Class {
	#name : #SkMoveInSituationTest,
	#superclass : #TestCase,
	#category : #'SokoBrain-Tests'
}

{ #category : #'tests - basic' }
SkMoveInSituationTest >> testBasicMoveInformation [

	| board position |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@  $.#'
			          fromPackage: SkBoard package).
		
	position := board player position.
	self assert: (board player move: CpDirection east).
	"The player has moved!"
	"No check that the player position is correct."
	self
		assert: board player position x
		equals: (CpDirection east * position) x.
	self assert: board player position x equals: 3.
	self assert: board asciiString equals: '# @ $.#'
]

{ #category : #tests }
SkMoveInSituationTest >> testBoxBumpingInBox [

	| board box |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@$$ ..#'
			          fromPackage: SkBoard package).
	box := board atRow: 1 atColumn: 3.
	self assert: (box isKindOf: SkBox).
	self deny: box moveEast.

	self assert: board asciiString equals: '#@$$ ..#'
]

{ #category : #'tests - simple move' }
SkMoveInSituationTest >> testBoxBumpingInWall [

	| board box |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@ .$#'
			          fromPackage: SkBoard package).
	box := board atRow: 1 atColumn: 5.
	self assert: (box isKindOf: SkBox).
	self deny: box moveEast.

	self assert: board asciiString equals: '#@ .$#'
]

{ #category : #'tests - simple move' }
SkMoveInSituationTest >> testBoxMovingOnGround [

	| board box |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@ .$ #'
			          fromPackage: SkBoard package).
	box := board atRow: 1 atColumn: 5.
	self assert: (box isKindOf: SkBox).
	self assert: box moveEast.

	self assert: board asciiString equals: '#@ . $#'
]

{ #category : #'tests - simple move' }
SkMoveInSituationTest >> testBoxMovingOnTarget [

	| board box |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@ $. #'
			          fromPackage: SkBoard package).
	box := board atRow: 1 atColumn: 4.
	self assert: (box isKindOf: SkBox).
	self assert: box moveEast.
	self assert: box position x equals: 5.
	self assert: board asciiString equals: '#@  * #'
]

{ #category : #'tests - simple move' }
SkMoveInSituationTest >> testBoxMovingOnTargetAndRestore [

	| board box |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@ $. #'
			          fromPackage: SkBoard package).
	box := board atRow: 1 atColumn: 4.
	self assert: (box isKindOf: SkBox).
	self assert: box moveEast.

	self assert: board asciiString equals: '#@  * #'.
	self assert: box moveEast.
	self assert: box position x equals: 6.
	self assert: board asciiString equals: '#@  .$#'
]

{ #category : #'tests - simple move' }
SkMoveInSituationTest >> testPlayerBumpingInWall [

	| board position player |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '# @#'
			          fromPackage: SkBoard package).
	player := board atRow: 1 atColumn: 3.
	position := board player position.
	self deny: (board player move: CpDirection east).
	self assert: board player position equals: position.
	self assert: player position x equals: 3.
	self assert: board asciiString equals: '# @#'
]

{ #category : #'tests - simple move' }
SkMoveInSituationTest >> testPlayerMovingOnGround [

	| board position player |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@ #'
			          fromPackage: SkBoard package).
	position := board player position.
	player := board atRow: 1 atColumn: 2.
	self assert: (board player move: CpDirection east).
	self
		assert: board player position x
		equals: (CpDirection east * position) x.
	self
		assert: board player position y
		equals: (CpDirection east * position) y.
	self assert: player position x equals: 3.
	self assert: board asciiString equals: '# @#'
]

{ #category : #'tests - simple move' }
SkMoveInSituationTest >> testPlayerMovingOnGroundRestoreCorrectlyGround [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@   #'
			          fromPackage: SkBoard package).
	self assert: board player moveEast.
	self assert: board printString equals: '# @  #'.
	self assert: board player moveEast.
	self assert: board printString equals: '#  @ #'
]

{ #category : #'tests - simple move' }
SkMoveInSituationTest >> testPlayerMovingOnTarget [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@.   $#'
			          fromPackage: SkBoard package).
	self assert: board asciiString equals: '#@.   $#'.
	self assert: board player moveEast.
	self assert: board printString equals: '# +   $#'.
	board player moveEast.
	self assert: board printString equals: '# .@  $#'
]

{ #category : #'tests - simple move' }
SkMoveInSituationTest >> testPlayerMovingTwoTimesOnGroundRestoreCorrectlyGround [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@  #'
			          fromPackage: SkBoard package).
	self assert: board height equals: 1.
	self assert: board width equals: '#@  #' size.
	self assert: board printString equals: '#@  #'.
	self assert: board printString equals: '#@  #'.
	self assert: board player moveEast.
	self assert: board printString equals: '# @ #'.
	board player moveEast.
	self assert: board printString equals: '#  @#'
]

{ #category : #'tests - pushing box' }
SkMoveInSituationTest >> testPushingABoxAlreadyOnTarget [

	| board position |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@* #'
			          fromPackage: SkBoard package).
	position := board player position.
	self assert: board asciiString equals: '#@* #'.
	self assert: board player moveEast.
	"The player has moved!"

	"Now check that the player position is correct."
	self assert: board player position x equals: 3.
	self assert: (board atPosition: 3 @ 1) isPlayer.

	self assert: board asciiString equals: '# +$#'.

	self deny: (board atPosition: 2 @ 1) isPlayer
	"Check that the board is updated, i.e., the player in the board should be at the player's position."
]

{ #category : #'tests - pushing box' }
SkMoveInSituationTest >> testPushingABoxOnGround [

	| board position |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@$ .#'
			          fromPackage: SkBoard package).
	position := board player position.
	self assert: board asciiString equals: '#@$ .#'.
	self assert: board player moveEast.
	"The player has moved!"

	"Now check that the player position is correct."
	self assert: board player position x equals: 3.
	self assert: (board atPosition: 3 @ 1) isPlayer.

	self assert: board asciiString equals: '# @$.#'.

	self deny: (board atPosition: 2 @ 1) isPlayer
	"Check that the board is updated, i.e., the player in the board should be at the player's position."
]

{ #category : #'tests - pushing box' }
SkMoveInSituationTest >> testPushingABoxOnTarget [

	| board position |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@$.#'
			          fromPackage: SkBoard package).
	position := board player position.
	self assert: board asciiString equals: '#@$.#'.
	self assert: board player moveEast.
	"The player has moved!"

	"Now check that the player position is correct."
	self assert: board player position x equals: 3.
	self assert: (board atPosition: 3 @ 1) isPlayer.

	self assert: board asciiString equals: '# @*#'.

	self deny: (board atPosition: 2 @ 1) isPlayer
	"Check that the board is updated, i.e., the player in the board should be at the player's position."
]

{ #category : #'tests - pushing box' }
SkMoveInSituationTest >> testPushingABoxOnWall [

	| board position player box |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#.@$#'
			          fromPackage: SkBoard package).
	player := board atRow: 1 atColumn: 3.
	position := board player position.
	self assert: board player position x equals: 3.
	self assert: player position x equals: 3.
	self assert: board asciiString equals: '#.@$#'.
	box := board atRow: 1 atColumn: 4.
	self assert: box position x equals: 4.
	self deny: board player moveEast.
	"The player has moved!"

	self assert: board player position x equals: 3.
	self assert: player position x equals: 3.
	box := board atRow: 1 atColumn: 4.
	self assert: (box isKindOf: SkBox).
	self assert: box position x equals: 4
]
