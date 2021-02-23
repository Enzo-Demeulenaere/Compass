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
