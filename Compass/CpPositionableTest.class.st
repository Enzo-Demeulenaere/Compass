Class {
	#name : #CpPositionableTest,
	#superclass : #TestCase,
	#category : #Compass
}

{ #category : #tests }
CpPositionableTest >> testEastReturnRightPosition [

	"  1 2  3  4  5  6
	-----------------
1	| 01 02 03 04 05 06
2	| 07 08 09 10 11 12
3	| 13 14 15 16 17 18

	position 3@2 * Direction east 
	>>	3@3
	"
	| newPos |
	newPos := CpDirection east * (CpPositionable x: 3 y: 2).
	self assert:  newPos x equals: 4. 
	self assert:  newPos y equals: 2. 

]
