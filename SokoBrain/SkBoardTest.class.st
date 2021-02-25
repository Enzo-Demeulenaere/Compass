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
SkBoardTest >> testPlayerIsAvailable [

	| importer game |
	importer := SkBoardImporter new. 
	game := importer buildMapFor: self map1.
	game identifyPlayer.
	self assert: game player position x equals: 12.
	self assert: game player position y equals: 9.
]
