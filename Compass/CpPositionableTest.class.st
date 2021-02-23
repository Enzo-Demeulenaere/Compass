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

{ #category : #tests }
CpPositionableTest >> testNorthReturnOneRowUpPosition [

	"  1 2  3  4  5  6
	-----------------
1	| 01 02 03 04 05 06
2	| 07 08 09 10 11 12
3	| 13 14 15 16 17 18

	position 3@2 * Direction north 
	>>	3@1
	"
	| newPos |
	newPos := CpDirection north * (CpPositionable x: 3 y: 2).
	self assert:  newPos x equals: 3. 
	self assert:  newPos y equals: 1. 

]

{ #category : #tests }
CpPositionableTest >> testSouthReturnOneRowDownPosition [

	"  1 2  3  4  5  6
	-----------------
1	| 01 02 03 04 05 06
2	| 07 08 09 10 11 12
3	| 13 14 15 16 17 18

	position 3@2 * Direction south 
	>>	3@3
	"
	| newPos |
	newPos := CpDirection south * (CpPositionable x: 3 y: 2).
	self assert:  newPos x equals: 3. 
	self assert:  newPos y equals: 3. 

]

{ #category : #tests }
CpPositionableTest >> testWestReturnLeftPosition [

	"  1 2  3  4  5  6
	-----------------
1	| 01 02 03 04 05 06
2	| 07 08 09 10 11 12
3	| 13 14 15 16 17 18

	position 3@2 * Direction east 
	>>	3@3
	"
	| newPos |
	newPos := CpDirection west * (CpPositionable x: 3 y: 2).
	self assert:  newPos x equals: 2. 
	self assert:  newPos y equals: 2. 

]
