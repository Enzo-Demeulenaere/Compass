Class {
	#name : #SkPlayerOnTarget,
	#superclass : #SkPlayer,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkPlayerOnTarget class >> textualMapCharacter [
	^ $+
]

{ #category : #initialization }
SkPlayerOnTarget >> configured [

	^ SkPlayer new background: self defaultBackground
]

{ #category : #initialization }
SkPlayerOnTarget >> defaultBackground [

	^ SkTarget new
		  basicPosition: self position;
		  board: board;
		  yourself
]
