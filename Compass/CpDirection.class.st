Class {
	#name : #CpDirection,
	#superclass : #Object,
	#category : #Compass
}

{ #category : #initialization }
CpDirection class >> east [ 
	"we will use SharedPool in the future."
	
	^ CpEastDirection new
]

{ #category : #initialization }
CpDirection class >> north [ 
	"we will use SharedPool in the future."
	
	^ CpNorthDirection new
]

{ #category : #initialization }
CpDirection class >> south [ 
	"we will use SharedPool in the future."
	
	^ CpSouthDirection new
]

{ #category : #initialization }
CpDirection class >> west [ 
	"we will use SharedPool in the future."
	
	^ CpWestDirection new
]

{ #category : #arithmetic }
CpDirection >> newPositionX: anIntegerForX y: anIntegerForY [

	^ anIntegerForX @ anIntegerForY 
]
