Class {
	#name : #SkStructuralBoardTest,
	#superclass : #TestCase,
	#category : #'SokoBrain-Tests'
}

{ #category : #data }
SkStructuralBoardTest >> map1 [ 
	"Pay attention that there is no return on the last line."
^ '    #####
    #   #
    #$  #
  ###  $##
  #  $ $ #
### # ## #   ######
#   # ## #####  ..#
# $  $          ..#
##### ### #@##  ..#
    #     #########
    #######'
]

{ #category : #'tests - building' }
SkStructuralBoardTest >> testAtPositionLowLevel [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: self map1
			          fromPackage: SkBoard package).
	self assert:
		((board atPosition: CpDirection north * board player position)
			 isKindOf: SkGround).
	self assert:
		((board atPosition: CpDirection south * board player position)
			 isKindOf: SkWall).
	self assert:
		((board atPosition: CpDirection east * board player position)
			 isKindOf: SkWall).
	self assert:
		((board atPosition: CpDirection west * board player position)
			 isKindOf: SkWall)
]

{ #category : #'tests - building' }
SkStructuralBoardTest >> testIsBoxOnTargetPlaygroundCorrectlySet [

	| board box1 box2 |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@ $.*#'
			          fromPackage: SkBoard package).
	box1 := board atRow: 1 atColumn: 4.
	box2 := board atRow: 1 atColumn: 6.
	self assert: box1 background class equals: SkGround.
	self assert: box2 background class equals: SkTarget
]

{ #category : #'tests - building' }
SkStructuralBoardTest >> testIsBoxPlaygroundCorrectlySet [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: self map1
			          fromPackage: SkBoard package).
	board do: [ :anEl |
		(anEl isKindOf: SkBox) ifTrue: [
			self assert: anEl position x equals: anEl background position x.
			self assert: anEl position y equals: anEl background position y ] ]
]

{ #category : #'tests - building' }
SkStructuralBoardTest >> testIsPalyerOnTargetPlaygroundCorrectlySet [

	| board box |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#+ $#'
			          fromPackage: SkBoard package).
	box := board atRow: 1 atColumn: 2.
	self assert: box background class equals: SkTarget
]

{ #category : #'tests - building' }
SkStructuralBoardTest >> testIsPlayerPlaygroundCorrectlySet [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: self map1
			          fromPackage: SkBoard package).
	self assert: board player position x equals: 12.
	self assert: board player position y equals: 9.

	self assert: board player background position x equals: 12.
	self assert: board player background position y equals: 9
]

{ #category : #'tests - building' }
SkStructuralBoardTest >> testPlayerIsAvailable [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: self map1
			          fromPackage: SkBoard package).
	self assert: board player position x equals: 12.
	self assert: board player position y equals: 9
]

{ #category : #tests }
SkStructuralBoardTest >> testPrintOn [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: self map1
			          fromPackage: SkBoard package).
	self assert: board asciiString equals: '    #####          
    #   #          
    #$  #          
  ###  $##         
  #  $ $ #         
### # ## #   ######
#   # ## #####  ..#
# $  $          ..#
##### ### #@##  ..#
    #     #########
    #######        '
]

{ #category : #tests }
SkStructuralBoardTest >> testPrintOnOneLine [

	| board |
	board := SkBoard board:
		         (LevelImporter
			          fromString: '#@  #'
			          fromPackage: SkBoard package).
	self assert: board height equals: 1.
	self assert: board width equals: '#@  #' size.
	self assert: board asciiString equals: '#@  #'
]
