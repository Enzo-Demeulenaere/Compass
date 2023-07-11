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

	self
		constraintsDo: [ :c | c horizontal matchParent ]
		"addEventHandlerOn: BlElementBackgroundChangedEvent do: [ :evt |
			self transformDo: [ :builder |
					builder
						topLeftOrigin;
						scaleBy: evt currentTarget extent / self background image extent.
					self halt ] ]"
]

{ #category : #accessing }
SkBoxElement >> box [ 
	^ box 
]

{ #category : #accessing }
SkBoxElement >> box: aSkElement [

	box := aSkElement.
]

{ #category : #'as yet unclassified' }
SkBoxElement >> boxAnimationMovingInDirection: aCpDirection [

	^ (BlTransformAnimation translate:
		   aCpDirection * (0 @ 0) * self width) duration: 150 milliSeconds
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

{ #category : #initialization }
SkBoxElement >> resetAnimation [ 

	self transformation: BlElementIdentityTransformation uniqueInstance
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
	bg class = Form ifTrue: [
		| size |
		"magic numbers :
		- 1000 is the size of the space
		- 2 is the size of the cellSpacing"
		size := 1000 / self parent parent board width - 2.
		bg := bg scaledIntoFormOfSize: size ].
	self background: bg
]
