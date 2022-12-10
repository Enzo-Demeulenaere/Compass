Class {
	#name : #RbsRobotTest,
	#superclass : #TestCase,
	#category : #'Robots-Bots'
}

{ #category : #tests }
RbsRobotTest >> testExecute [


	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	rb execute: 
'dir #east
mov 2
mov 3
dir #north
mov 3'.
	self assert: rb position equals: 9@4
]

{ #category : #'tests - commands' }
RbsRobotTest >> testExecuteCommandBased [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	rb executeCommandBased: 
'dir #east
mov 2
mov 3
dir #north
mov 3'.
	self assert: rb position equals: 9@4
]

{ #category : #'tests - commands' }
RbsRobotTest >> testExecuteDirection [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	rb executeCommandBased: 
'dir #east'.
	self assert: rb direction equals: #east
]

{ #category : #'tests - commands' }
RbsRobotTest >> testMappingIsInitialized [

	| r |
	r := RbsRobot new.
	self assert: (r commandClassFor: RbsDirectionCommand commandName) equals: RbsDirectionCommand
]

{ #category : #'tests - optimize' }
RbsRobotTest >> testMergeCommands [

	| cmd |
	cmd := (RbsMoveCommand new distance: 10; yourself)
		mergeWith: (RbsMoveCommand new distance: 10; yourself).
	self assert: cmd distance equals: 20
]

{ #category : #'tests - optimize' }
RbsRobotTest >> testMergeUNmergeableCommands [

	| cmd |
	cmd := (RbsDirectionCommand new direction: #east; yourself)
		mergeWith: (RbsDirectionCommand new direction: #north; yourself).
	self assert: cmd direction equals: #north
]

{ #category : #'tests - optimize' }
RbsRobotTest >> testMergeUNmergeableCommandsBecauseDifferent [

	| cmd |
	cmd := (RbsMoveCommand new distance: 10; yourself)
		mergeWith: (RbsDirectionCommand new direction: #east; yourself).
	self assert: cmd direction equals: #east.
	
	
	cmd := (RbsDirectionCommand new direction: #east; yourself)
		mergeWith: (RbsMoveCommand new distance: 10; yourself).
	self assert: cmd distance equals: 10
]

{ #category : #'tests - commands' }
RbsRobotTest >> testPrintString [

	self 
		assert: (RbsMoveCommand new distance: 5; printString)
		equals: 'mov 5'
		
]

{ #category : #tests }
RbsRobotTest >> testRobotAtLocation [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	self assert: (rb board atX: 4 atY: 1) equals: rb
]

{ #category : #tests }
RbsRobotTest >> testRobotDefaultDirection [

	| rb |
	rb := RbsRobot new.
	self assert: rb direction equals: #east
]

{ #category : #tests }
RbsRobotTest >> testRobotMove [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	"should make sure that previous tile is put back"
	self assert: (rb board atX: 4 atY: 1) equals: rb.
	rb move: 10.
	self assert: (rb board atX: 14 atY: 1) equals: rb.
	self assert: (rb board atX: 14 atY: 1) equals: rb
]

{ #category : #tests }
RbsRobotTest >> testRobotMoveEast [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	"should make sure that previous tile is put back"
	self assert: (rb board atX: 4 atY: 1) equals: rb.
	rb move: 10.
	self assert: (rb board atX: 14 atY: 1) equals: rb.

]

{ #category : #tests }
RbsRobotTest >> testRobotMoveNorth [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 14@1.
	rb direction: #north.
	self assert: (rb board atX: 14 atY: 1) equals: rb.
	rb move: 10.
	self assert: (rb board atX: 14 atY: 11) equals: rb.
	
]

{ #category : #tests }
RbsRobotTest >> testRobotMoveSouth [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 14@11.
	rb direction: #south.
	self assert: (rb board atX: 14 atY: 11) equals: rb.
	rb move: 10.
	self assert: (rb board atX: 14 atY: 1) equals: rb.
	
]

{ #category : #tests }
RbsRobotTest >> testRobotMoveWest [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 14@1.
	rb direction: #west.
	self assert: (rb board atX: 14 atY: 1) equals: rb.
	rb move: 10.
	self assert: (rb board atX: 4 atY: 1) equals: rb.
	
]
