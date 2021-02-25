Class {
	#name : #SkMoveInSituationTest,
	#superclass : #TestCase,
	#category : #'SokoBrain-Tests'
}

{ #category : #'tests - building' }
SkMoveInSituationTest >> testPushingABoxOnGround [

	| importer map |
	importer := SkBoardImporter new. 
	map := importer buildMapFor: '#@$  .#'.
	self halt.
	
]
