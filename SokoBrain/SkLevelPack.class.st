Class {
	#name : #SkLevelPack,
	#superclass : #Object,
	#instVars : [
		'levelDictionary'
	],
	#category : #'SokoBrain-Model'
}

{ #category : #accessing }
SkLevelPack >> at: anIndex put: aSkLevelInformation [

	(self levelDictionary at: anIndex) ifAbsent: [ (self compareAt: anIndex with: aSkLevelInformation) ifTrue: [ ^ self ] ].
	(self levelDictionary at: anIndex) put: aSkLevelInformation
]

{ #category : #accessing }
SkLevelPack >> compareAt: anIndex with: aSkLevelInformation [

	| registeredCount newCount|
	registeredCount := (self levelDictionary at: anIndex) bestCount.
	newCount := aSkLevelInformation bestCount.
	^ registeredCount >= newCount 
]

{ #category : #initialization }
SkLevelPack >> initialize [ 

	super initialize.
	levelDictionary := Dictionary new
]

{ #category : #accessing }
SkLevelPack >> levelDictionary [

	^ levelDictionary
]

{ #category : #accessing }
SkLevelPack >> levelDictionary: aDictionary [

	levelDictionary := aDictionary 
]
