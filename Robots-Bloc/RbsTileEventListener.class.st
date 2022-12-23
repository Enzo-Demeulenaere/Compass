Class {
	#name : #RbsTileEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'memoryGame',
		'game'
	],
	#category : #'Robots-Bloc'
}

{ #category : #'mouse handlers' }
RbsTileEventListener >> clickEvent: anEvent [
	
	| tileElement |
	self halt.
	tileElement := anEvent currentTarget.
	
]

{ #category : #accessing }
RbsTileEventListener >> game: aGame [

	game := aGame
]

{ #category : #'mouse handlers' }
RbsTileEventListener >> keyDownEvent: anEvent [
	self halt.
	memoryGame chooseCard: anEvent currentTarget card
]
