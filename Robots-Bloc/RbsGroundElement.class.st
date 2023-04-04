Class {
	#name : #RbsGroundElement,
	#superclass : #RbsTileElement,
	#category : #'Robots-Bloc'
}

{ #category : #initialization }
RbsGroundElement >> initialize [
	super initialize.
	self background: Color gray
]
