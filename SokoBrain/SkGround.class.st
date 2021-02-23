Class {
	#name : #SkGround,
	#superclass : #SkElement,
	#category : #SokoBrain
}

{ #category : #action }
SkGround >> bringIn: aSkPlayer [ 
	aSkPlayer position: self position.
	^ true
]
