Class {
	#name : #SkUITargetElement,
	#superclass : #SkUIElement,
	#category : #'SokoBrain-Bloc'
}

{ #category : #'instance creation' }
SkUITargetElement class >> inASpace [
	"waiting for Pharo 90 to extend the inspector"
	<sampleInstance>
	
	| space el |
	space := BlSpace new.
	el := SkUITargetElement new. 
	space addChild: el. 
	space show. 
	{ space . el } inspect
]

{ #category : #drawing }
SkUITargetElement >> drawOnSpartaCanvas: aCanvas [
	aCanvas stroke
		paint: Color paleBlue;
		path: (aCanvas shape line: 15@15 to: self extent - (15@15));
		strokeOptions: (aCanvas strokeOptions width: 8);
		draw.
	aCanvas stroke
		paint: Color paleBlue;
		path: (aCanvas shape line: self width @ 0 to: 0@self height);
		strokeOptions: (aCanvas strokeOptions width: 8);
		draw
]
