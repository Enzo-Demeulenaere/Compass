Class {
	#name : #RbsTileElement,
	#superclass : #BlElement,
	#category : #'Robots-Bloc'
}

{ #category : #'instance creation' }
RbsTileElement class >> open [
	<script>
	| space element |
	space	 := BlSpace new.
	space show.
	element := self new.
	space addChild: element.

]

{ #category : #initialization }
RbsTileElement >> initialize [

	super initialize.
	self background: Color purple
]
