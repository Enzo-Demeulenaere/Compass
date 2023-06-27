Class {
	#name : #SkGround,
	#superclass : #SkElement,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkGround class >> textualMapCharacter [
	^ Character space
]

{ #category : #accessing }
SkGround >> backgroundRepresentation [

	^ Color transparent
]
