"
I'm a empty subclass so that all the objects can be packaged in the same package and that the tests work. Robot developers should subclass me to define their own robot.

"
Class {
	#name : #RbsAbstractRobot,
	#superclass : #RbsTile,
	#category : #'Robots-Board'
}

{ #category : #'default encoding' }
RbsAbstractRobot class >> textualMapCharacter [
	^ $X
]
