Class {
	#name : #SkLevelPack,
	#superclass : #Object,
	#instVars : [
		'levelDictionary'
	],
	#category : #'SokoBrain-Model'
}

{ #category : #accessing }
SkLevelPack >> at: anIndex isBetterThan: aSkLevelInformation [

	| registeredCount newCount|
	registeredCount := (self levelDictionary at: anIndex) bestCount.
	newCount := aSkLevelInformation bestCount.
	^ registeredCount < newCount 
]

{ #category : #accessing }
SkLevelPack >> at: anIndex put: aSkLevelInformation [

	self levelDictionary at: anIndex ifPresent: [
		(self at: anIndex isBetterThan: aSkLevelInformation) ifTrue: [
			^ self ] ].
	self levelDictionary at: anIndex put: aSkLevelInformation
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
