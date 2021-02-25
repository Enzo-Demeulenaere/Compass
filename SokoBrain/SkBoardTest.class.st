Class {
	#name : #SkBoardTest,
	#superclass : #TestCase,
	#category : #'SokoBrain-Tests'
}

{ #category : #data }
SkBoardTest >> map1 [ 
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
SkBoardTest >> testAtPosition [

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
SkBoardTest >> testPlayerIsAvailable [

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: self map1.
	game identifyPlayer.
	self assert: game player position x equals: 12.
	self assert: game player position y equals: 9.
]
