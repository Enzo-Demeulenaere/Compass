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
	board := aSkBoard 
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
		constraintsDo: [
			:aLayoutConstraints |
			aLayoutConstraints horizontal matchParent.
			aLayoutConstraints vertical matchParent ]
]

{ #category : #accessing }
SkBoxElement >> updateBackgroundColor [

	| dictionary |
	dictionary := {
		              ('SkGround' -> Color transparent).
		              ('SkTarget' -> Color lightBlue).
		              ('SkPlayer' -> Color yellow).
		              ('SkBox' -> Color red).
		              ('SkWall' -> Color brown) } asDictionary.
	self box className traceCr.
	self background: (dictionary at: self box className)
]
