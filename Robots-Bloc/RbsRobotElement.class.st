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
RbsRobotElement >> manageYourselfFor: aGameModel In: aBoard [
	super manageYourselfFor: aGameModel In: aBoard.
	aBoard robot: self
	
]
