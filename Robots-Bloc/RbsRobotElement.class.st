"
```
RbsRobotElement open
```
"
Class {
	#name : #RbsRobotElement,
	#superclass : #RbsTileElement,
	#category : #'Robots-Bloc'
}

{ #category : #initialization }
RbsRobotElement >> initialize [

	super initialize.
	self background: Color red. 
]

{ #category : #initialization }
RbsRobotElement >> initializeHandlers [ 
	
	| leftSC rightSC |
	leftSC := BlShortcutWithAction new
			 	combination: BlKeyCombination arrowLeft;
			  	action: [ :aShortcutEvent :aShortcut |
					self position:  (self position x - self gameElementWidth  @ self position y) ].
	rightSC := BlShortcutWithAction new
			 	combination: BlKeyCombination arrowRight;
			  	action: [ :aShortcutEvent :aShortcut |
					self position: ( self position x + self gameElementWidth @ self position y) ].
	self addShortcut: leftSC.
	self addShortcut: rightSC.
]

{ #category : #initialization }
RbsRobotElement >> manageYourselfFor: aGameModel In: aBoard [
	super manageYourselfFor: aGameModel In: aBoard.
	aBoard robotElement: self.
	
	
	
]
