"
The root of the Bloc Elements representing the sokoban UI parts.
"
Class {
	#name : #SkUIElement,
	#superclass : #BlElement,
	#instVars : [
		'card',
		'model'
	],
	#category : #'SokoBrain-Bloc'
}

{ #category : #'instance creation' }
SkUIElement class >> inASpace [
	"waiting for Pharo 90 to extend the inspector"
	<sampleInstance>
	
	| space el |
	space := BlSpace new.
	el := SkUIElement new. 
	space addChild: el. 
	space show. 
	{ space . el } inspect
]

{ #category : #'visual properties' }
SkUIElement >> backgroundPaint [
	"Return a BlPaint that should be used as a background (fill)
	of both back and face sides of the card. Color is polymorphic
	with BlPaint and therefore can be used too."
	
	^ Color pink
]

{ #category : #drawing }
SkUIElement >> cornerRadius [
  ^ 12
]

{ #category : #drawing }
SkUIElement >> drawOnSpartaCanvas1: aCanvas [
	
	aCanvas fill
		paint: self backgroundPaint;
		path: self boundsInLocal;
		draw
]

{ #category : #drawing }
SkUIElement >> drawOnSpartaCanvas2: aCanvas [
  aCanvas fill
    paint: self backgroundPaint;
    path: (aCanvas shape ellipse: self boundsInLocal);
    draw

]

{ #category : #drawing }
SkUIElement >> drawOnSpartaCanvas3: aCanvas [
	| roundedRectangle |
	roundedRectangle := aCanvas shape
  		roundedRectangle: self boundsInLocal
		radii: (BlCornerRadii radius: self cornerRadius) asArray.
	aCanvas clip
		by: roundedRectangle
		during: [
			aCanvas fill
				paint: self backgroundPaint;
				path: self boundsInLocal;
				draw ]
]

{ #category : #drawing }
SkUIElement >> drawOnSpartaCanvas4: aCanvas [
	| roundedRectangle |
	roundedRectangle := aCanvas shape
  		roundedRectangle: self boundsInLocal
		radii: (BlCornerRadii radius: self cornerRadius) asArray.
	aCanvas clip
		by: roundedRectangle
		during: [
			self drawCommonOn: aCanvas.
			self card isFlipped
				ifTrue: [ self drawFlippedSideOn: aCanvas ]
				ifFalse: [ self drawBacksideOn: aCanvas ]  ]
]

{ #category : #drawing }
SkUIElement >> drawOnSpartaCanvas: aCanvas [
	
	aCanvas fill
		paint: self backgroundPaint darker;	
		path: self boundsInLocal;
		draw.
	aCanvas fill
		paint: self backgroundPaint;	
		path: (self boundsInLocal expandBy: -5);
		draw.
]

{ #category : #initialization }
SkUIElement >> initialize [

	super initialize.
	self size: 80@80.
	self skElement: (SkGround new basicPosition: 1@1)
]

{ #category : #accessing }
SkUIElement >> skElement: aSkModel [
	
	model := aSkModel
]
