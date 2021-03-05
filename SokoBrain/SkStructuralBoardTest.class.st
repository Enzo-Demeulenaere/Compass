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

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: self map1.
	game identifyPlayer.
	self assert: ((game atPosition: (CpDirection north * game player position) ) isKindOf: SkGround).
	self assert: ((game atPosition: (CpDirection south * game player position) ) isKindOf: SkWall).
	self assert: ((game atPosition: (CpDirection east * game player position) ) isKindOf: SkWall).
	self assert: ((game atPosition: (CpDirection west * game player position) ) isKindOf: SkWall).
]

{ #category : #'tests - building' }
SkStructuralBoardTest >> testIsBoxPlaygroundCorrectlySet [

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: self map1.
	game identifyPlayer.
	game finalize.
	game do: [ :anEl | (anEl isKindOf: SkBox) 
					ifTrue: [ 
							self assert: anEl	position x equals: anEl previousBackground position x.
							self assert: anEl	position y equals: anEl previousBackground position y]]
							
	
]

{ #category : #'tests - building' }
SkStructuralBoardTest >> testIsPlayerPlaygroundCorrectlySet [

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: self map1.
	game identifyPlayer.
	game finalize.
	self assert: game player position x equals: 12.
	self assert: game player position y equals: 9.
	
	self assert: game player previousBackground position x equals: 12.
	self assert: game player previousBackground position y equals: 9.
]

{ #category : #'tests - building' }
SkStructuralBoardTest >> testPlayerIsAvailable [

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: self map1.
	game identifyPlayer.
	self assert: game player position x equals: 12.
	self assert: game player position y equals: 9.
]

{ #category : #tests }
SkStructuralBoardTest >> testPrintOn [
	| importer map |
	importer := SkBoardImporter new. 
	map := importer buildMapFor: self map1.
	self assert: map asciiString equals: '    #####          
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

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: '#@  #'.
	self assert: game height equals: 1.
	self assert: game width equals: '#@  #' size.
	self assert: game asciiString equals: '#@  #'.
	
]
