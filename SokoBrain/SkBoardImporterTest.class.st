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

{ #category : #'tests - basic' }
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

{ #category : #'tests - basic' }
SkBoardImporterTest >> testBuildingEmptyMap [

	| importer map |
	importer := SkBoardImporter new. 
	map := importer buildMapFor: self map1.
	self assert: map lineNumber equals: 11.
	self assert: map columnNumber equals: 19.
]

{ #category : #'tests - basic' }
SkBoardImporterTest >> testBuildingMap [

	| importer map |
	importer := SkBoardImporter new. 
	map := importer buildMapFor: self map1.
	self assert: map lineNumber equals: 11.
	self assert: map columnNumber equals: 19.
]

{ #category : #'tests - basic' }
SkBoardImporterTest >> testLines [

	| importer lines |
	importer := SkBoardImporter new. 
	lines := importer splitLines: self map1.
	self assert: lines size equals: 11.
	self assert: lines first equals: '    #####'
]
