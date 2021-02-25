Class {
	#name : #CpPositionable,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
	],
	#category : #Compass
}

{ #category : #'instance creation' }
CpPositionable class >> x: anInteger y: anInteger2 [ 
	^ self new x: anInteger y: anInteger2 
]

{ #category : #accessing }
CpPositionable >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	x printOn: aStream.
	aStream nextPutAll: ', '.
	y printOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
CpPositionable >> x [
	^ x
]

{ #category : #accessing }
CpPositionable >> x: anInteger y: anInteger2 [ 
	x := anInteger.
	y := anInteger2 
]

{ #category : #accessing }
CpPositionable >> y [
	^ y
]
