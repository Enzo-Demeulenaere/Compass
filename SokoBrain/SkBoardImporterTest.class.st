Class {
	#name : #SkBoardImporterTest,
	#superclass : #TestCase,
	#category : #SokoBrain
}

{ #category : #data }
SkBoardImporterTest >> firstLine [
	^ '    #####'
 
]

{ #category : #data }
SkBoardImporterTest >> map1 [ 
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

{ #category : #'tests - basic' }
SkBoardImporterTest >> testAllSubclassesDefinesATextualMapCharacter [

	| importer |
	importer := SkBoardImporter new.
	SkElement allSubclassesDo: [ :k | 
		self assert: (importer classFor: k textualMapCharacter) equals: k ]
]

{ #category : #'tests - printing' }
SkBoardImporterTest >> testAsciiMap [

	| importer map |
	importer := SkBoardImporter new. 
	map := importer buildMapFor: self map1.
	self assert: map printString equals: 
'    #####
    #   #
    #$  #
  ###  $##
  #  $ $ #
### # ## #   ######
#   # ## #####  ..#
# $  $          ..#
##### ### #@##  ..#
    #     #########
    #######
'.
	" we do not consider the last cr"
	self assert: map printString allButLast equals: self map1
]

{ #category : #'tests - basic' }
SkBoardImporterTest >> testBuilder [

	| importer k |
	importer := SkBoardImporter new. 
	k := (importer classFor: self firstLine first).
	self assert: k equals: SkGround.
		k := (importer classFor: self firstLine last).
	self assert: k equals: SkWall
]

{ #category : #'tests - basic' }
SkBoardImporterTest >> testBuilderHasCorrectBinding [

	| importer k |
	importer := SkBoardImporter new. 
	k := (importer classFor: self firstLine first).
	self assert: k equals: SkGround.
		k := (importer classFor: self firstLine last).
	self assert: k equals: SkWall
]

{ #category : #'tests - building' }
SkBoardImporterTest >> testBuildingEmptyMap [

	| importer map |
	importer := SkBoardImporter new. 
	map := importer buildMapFor: self map1.
	self assert: map lineNumber equals: 11.
	self assert: map columnNumber equals: 19.
]

{ #category : #'tests - building' }
SkBoardImporterTest >> testBuildingMap [

	| importer map |
	importer := SkBoardImporter new. 
	map := importer buildMapFor: self map1.
	self assert: map lineNumber equals: 11.
	self assert: map columnNumber equals: 19.
]

{ #category : #'tests - validaty' }
SkBoardImporterTest >> testCheckMapValidity [
	| importer |
	importer := SkBoardImporter new. 
	self shouldnt: [ importer checkMapValidity: self map1 ] raise: Error.

	
]

{ #category : #'tests - validaty' }
SkBoardImporterTest >> testCheckMapValidityAMapShouldHaveAPlayer [
	| importer |
	importer := SkBoardImporter new. 
	self should: [ importer checkMapValidity: (self map1 copyReplaceAll: SkPlayer textualMapCharacter  with: $Z )] raise: Error.

	
]

{ #category : #'tests - validaty' }
SkBoardImporterTest >> testCheckMapValidityAMapShouldHaveTheSameNumberOfBoxesAndTargets [
	| importer |
	importer := SkBoardImporter new. 
	self should: [ importer checkMapValidity: (self map1, SkBox textualMapCharacter asString  )] raise: Error.

	
]

{ #category : #'tests - basic' }
SkBoardImporterTest >> testLines [

	| importer lines |
	importer := SkBoardImporter new. 
	lines := importer splitLines: self map1.
	self assert: lines size equals: 11.
	self assert: lines first equals: '    #####'
]
