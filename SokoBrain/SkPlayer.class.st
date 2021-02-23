Class {
	#name : #SkPlayer,
	#superclass : #SkElement,
	#category : #SokoBrain
}

{ #category : #move }
SkPlayer >> moveIn: aLocation [ 
	^ aLocation bringIn: self
]
