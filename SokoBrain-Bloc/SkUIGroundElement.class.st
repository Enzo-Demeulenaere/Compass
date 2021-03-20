Class {
	#name : #SkUIGroundElement,
	#superclass : #SkUIElement,
	#category : #'SokoBrain-Bloc'
}

{ #category : #'instance creation' }
SkUIGroundElement class >> inASpace [
	"waiting for Pharo 90 to extend the inspector"
	<sampleInstance>
	
	| space el |
	space := BlSpace new.
	el := SkUIGroundElement new. 
	space addChild: el. 
	space show. 
	{ space . el } inspect
]

{ #category : #drawing }
SkUIGroundElement >> drawOnSpartaCanvas: aCanvas [
	
	aCanvas fill
		paint: self backgroundPaint darker;	
		path: self boundsInLocal;
		draw.
	aCanvas fill
		paint: self backgroundPaint;	
		path: (self boundsInLocal expandBy: -5);
		draw.
]
