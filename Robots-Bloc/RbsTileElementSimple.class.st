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

{ #category : #'visual properties' }
RbsTileElementSimple >> backgroundPaint [
	"Return a BlPaint that should be used as a background (fill)
	of both back and face sides of the card. Color is polymorphic
	with BlPaint and therefore can be used too."
	
	^ Color pink
]

{ #category : #drawing }
RbsTileElementSimple >> cornerRadius [
  ^ 12
]

{ #category : #drawing }
RbsTileElementSimple >> drawBacksideOn: aCanvas [
	aCanvas stroke
		paint: Color paleBlue;
		path: (aCanvas shape line: 0@0 to: self extent);
		draw.
	aCanvas stroke
		paint: Color paleBlue;
		path: (aCanvas shape line: self width @ 0 to: 0@self height);
		draw
]

{ #category : #drawing }
RbsTileElementSimple >> drawCommonOn: aCanvas [
	aCanvas fill
		paint: self backgroundPaint;
		path: self boundsInLocal;
		draw
]

{ #category : #drawing }
RbsTileElementSimple >> drawOnSpartaCanvas: aCanvas [
	| roundedRectangle |
	roundedRectangle := aCanvas shape
  		roundedRectangle: self boundsInLocal
		radii: (BlCornerRadii radius: self cornerRadius) asArray.
	aCanvas clip
		by: roundedRectangle
		during: [
			self drawCommonOn: aCanvas.
			]
]

{ #category : #initialization }
RbsTileElementSimple >> initialize [

	super initialize.
	self size: 80 @ 80.
	self addEventHandler: (BlEventHandler on: BlKeyDownEvent
			do: [ :anEvent | self halt.self inform: 'Key up: ', anEvent key asString ]);
		addEventHandler: (BlEventHandler on: BlTextInputEvent
			do: [ :anEvent | self inform: 'Text input: ', anEvent text ]);
		addEventHandler: (BlEventHandler on: BlKeyDownEvent
			do: [ :anEvent | self inform: 'Key down: ', anEvent key asString ])
]
