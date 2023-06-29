Class {
	#name : #SkBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'board',
		'positionInField'
	],
	#category : #'SokoBrain-UI'
}

{ #category : #accessing }
SkBoxElement class >> box: aBox [ 

	^ self new box: aBox
]

{ #category : #'as yet unclassified' }
SkBoxElement >> backgroundPaint [ 
	^ Color transparent
]

{ #category : #accessing }
SkBoxElement >> board [ 
	^ board 
]

{ #category : #accessing }
SkBoxElement >> board: aSkBoard [

	board := aSkBoard.

	self constraintsDo: [ :c | c horizontal matchParent ]
			
]

{ #category : #accessing }
SkBoxElement >> box [ 
	^ box 
]

{ #category : #accessing }
SkBoxElement >> box: aSkElement [

	box := aSkElement.
]

{ #category : #accessing }
SkBoxElement >> boxForForeground [

	self box:
		(((self board atPosition: self positionInField) class inheritsFrom:
			  SkMovable)
			 ifFalse: [ SkGround new ]
			 ifTrue: [ (self board atPosition: self positionInField) ])
]

{ #category : #initialization }
SkBoxElement >> initialize [

	super initialize.

	self
		background: self backgroundPaint;
		geometry: BlSquareGeometry new;
		layout: BlSquaredLayout new
		
]

{ #category : #'geometry position' }
SkBoxElement >> positionInField [

	^ positionInField
]

{ #category : #'geometry position' }
SkBoxElement >> positionInField: aPoint [

	positionInField := aPoint
]

{ #category : #'as yet unclassified' }
SkBoxElement >> textChild [

	| text |
	text := BlTextElement new.
	self childNamed: 'text' ifFound: [ self removeChildNamed: 'text' ].
	self addChild: text as: 'text'.
	text text: self positionInField asString asRopedText.

	text text fontSize: 50.
	text text fontName: 'Source Sans Pro'.
]

{ #category : #accessing }
SkBoxElement >> updateBackgroundColor [

	| bg |
	bg := self box backgroundRepresentation.
	"bg class = Form ifTrue: [ bg := bg scaledIntoFormOfSize: self extent ]."
	"self box class = SkPlayer ifTrue: [ self parent extent inspect ]."
	self background: bg.
	"self textChild"
]
