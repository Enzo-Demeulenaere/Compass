"
I'm a tile inside a 2D space.
My subclasses should provide a character based representation so that the board that contains me can be displayed
"
Class {
	#name : #RbsTile,
	#superclass : #Object,
	#instVars : [
		'position',
		'board'
	],
	#category : #'Robots-BoardCore'
}

{ #category : #'default encoding' }
RbsTile class >> textualMapCharacter [

	^ self subclassResponsibility
]

{ #category : #protected }
RbsTile >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]

{ #category : #accessing }
RbsTile >> board [
	^ board 
]

{ #category : #move }
RbsTile >> postCreationAction [
	"nothing by default"
	
	^ self
]

{ #category : #protected }
RbsTile >> setBoard: aBoard [
	board := aBoard
]
