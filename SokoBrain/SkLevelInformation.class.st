Class {
	#name : #SkLevelInformation,
	#superclass : #Object,
	#instVars : [
		'finished',
		'bestCount'
	],
	#category : #'SokoBrain-Model'
}

{ #category : #accessing }
SkLevelInformation class >> count: aNumber [

	^ (self new bestCount: aNumber) 
]

{ #category : #accessing }
SkLevelInformation >> bestCount [ 

	^ bestCount
]

{ #category : #accessing }
SkLevelInformation >> bestCount: aNumber [

	bestCount := aNumber 
]

{ #category : #initialization }
SkLevelInformation >> initialize [

	super initialize.
	finished := true
]

{ #category : #testing }
SkLevelInformation >> isFinished [ 
	
	^ finished
]
