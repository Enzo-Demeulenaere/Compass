Class {
	#name : #SkBoxElement,
	#superclass : #BlElement,
	#instVars : [
		'box',
		'board'
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

	self constraintsDo: [ :c |
		self board width > self board height
			ifTrue: [ c horizontal matchParent ]
			ifFalse: [ c vertical matchParent ] ]
]

{ #category : #accessing }
SkBoxElement >> box [ 
	^ box 
]

{ #category : #accessing }
SkBoxElement >> box: aSkElement [

	box := aSkElement.
]

{ #category : #initialization }
SkBoxElement >> initialize [

	super initialize.

	self
		background: self backgroundPaint;
		geometry: BlSquareGeometry new;
		layout: BlSquaredLayout new
		
]

{ #category : #accessing }
SkBoxElement >> updateBackgroundColor [

	| dictionary |
	dictionary := {
		              ('SkGround' -> Color transparent).
		              ('SkTarget' -> Color lightBlue).
		              ('SkPlayer' -> Color yellow).
		              ('SkBox' -> Color red).
		              ('SkWall' -> Color brown).
							('SkBoxOnTarget' -> Color lightGreen).
							('SkPlayerOnTarget' -> Color lightYellow)  } asDictionary.
	self background: (dictionary at: self box className)
]
