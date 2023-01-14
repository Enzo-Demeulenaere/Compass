Class {
	#name : #MpLetter,
	#superclass : #Object,
	#instVars : [
		'contents',
		'address'
	],
	#category : #MyPoste
}

{ #category : #accessing }
MpLetter >> address [
	^ address
]

{ #category : #accessing }
MpLetter >> contents [
	^ contents
]

{ #category : #accessing }
MpLetter >> contents: aString [ 
	contents := aString
]

{ #category : #accessing }
MpLetter >> to: aString [ 
	address := aString
]
