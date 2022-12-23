Class {
	#name : #RbsTileElementSimple,
	#superclass : #BlElement,
	#category : #'Robots-Bloc'
}

{ #category : #'instance creation' }
RbsTileElementSimple class >> inASpace [
	"self inASpace"

	| space tile |
	space := BlSpace new.
	tile := self new.
	space addChild: tile.
	space show.
	{ 
		space.
		tile } inspect
]

{ #category : #'instance creation' }
RbsTileElementSimple class >> inASpace2 [
	"self inASpace2"
	<script>
	|  tile |
	tile := self new.
	tile openInNewSpace
	
]

{ #category : #drawing }
RbsTileElementSimple >> aeDrawOn: aCanvas [

	aCanvas clear: Color blue.
	aCanvas drawClosedPathWith: [ :cairoContext |
		cairoContext rectangle: (10 asPoint extent: self size)].
	aCanvas drawFigure
]

{ #category : #initialization }
RbsTileElementSimple >> handleKey: aKey [
	self halt.
	aKey isArrowRight 
		ifTrue: [ self relocate: (self position) + ((self size x) * 2 @0) ]
]

{ #category : #initialization }
RbsTileElementSimple >> initialize [

	super initialize.
	self size: 80 @ 80.
	self addEventHandler: (BlEventHandler on: BlKeyDownEvent
			do: [ :anEvent | self handleKey: anEvent key ]).
	self addEventHandler: (BlEventHandler on: BlClickEvent
			do: [ :anEvent | self inspect ]).
	self requestFocus.
]
