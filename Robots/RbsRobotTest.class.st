Class {
	#name : #RbsRobotTest,
	#superclass : #TestCase,
	#category : #'Robots-Test'
}

{ #category : #'tests - replay' }
RbsRobotTest >> testAddToPathCommands [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
mov 3'.
	self assert: rb path size equals: 3
	
]

{ #category : #'tests - replay' }
RbsRobotTest >> testAddToPathCommandsDoesNotContainReplay [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
mov 3
replay'.
	self assert: rb path size equals: 3
	
]

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

{ #category : #'tests - merge' }
RbsRobotTest >> testMergeDirectionCommandsReturnTheLastOne [

	| cmdList |
	cmdList := (RbsDirectionCommand new direction: #east; yourself)
		mergeWith: (RbsDirectionCommand new direction: #north ; yourself).
	self assert: cmdList size equals: 1.
	self assert: cmdList first direction equals: #north.
]

{ #category : #'tests - merge' }
RbsRobotTest >> testMergeMoveCommandsProducesTheSum [

	| cmdList |
	cmdList := (RbsMoveCommand new distance: 10; yourself)
		mergeWith: (RbsMoveCommand new distance: 10; yourself).
	self assert: cmdList size equals: 1.
	self assert: cmdList first distance equals: 20.
]

{ #category : #'tests - merge' }
RbsRobotTest >> testMergeUNmergeableCommandsBecauseDifferent2 [

	| cmdList |
	cmdList := (RbsDirectionCommand new direction: #east; yourself)
		mergeWith: (RbsMoveCommand new distance: 10; yourself).
	self assert: cmdList size equals: 2.
	self assert: cmdList first direction equals: #east
]

{ #category : #'tests - merge' }
RbsRobotTest >> testMergeUnmergeableCommandsBecauseDifferent [

	| cmdList |
	cmdList := (RbsMoveCommand new distance: 10; yourself)
		mergeWith: (RbsDirectionCommand new direction: #east; yourself).
	self assert: cmdList size equals: 2.
	self assert: cmdList first distance equals: 10.
	
	
	
]

{ #category : #'tests - replay' }
RbsRobotTest >> testMonitoringIsOnPerDefault [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
stopM
mov 3'.
	self assert: rb path size equals: 2
	
]

{ #category : #'tests - optimize' }
RbsRobotTest >> testOptimizeMergeThreeMoves [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	rb optimizePath: 
'mov 2
mov 3
mov 4'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 9')
]

{ #category : #'tests - optimize' }
RbsRobotTest >> testOptimizeMergeThreeMovesAndOthers [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	rb optimizePath: 
'mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 9' 'dir #east')
]

{ #category : #'tests - optimize' }
RbsRobotTest >> testOptimizeMergeTwoMoves [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	rb optimizePath: 
'mov 2
mov 3'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 5')
]

{ #category : #'tests - optimize' }
RbsRobotTest >> testOptimizeMergeTwoMovesAndOthers [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	rb optimizePath: 
'mov 2
mov 3
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 5' 'dir #east')
]

{ #category : #'tests - optimize' }
RbsRobotTest >> testOptimizeNoMergeThenMergeThreeMovesAndOthers [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	rb optimizePath: 
'dir #north
mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'dir #north' 'mov 9' 'dir #east')
]

{ #category : #'tests - optimize' }
RbsRobotTest >> testOptimizeTwoDirections [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	rb optimizePath: 
'dir #north
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'dir #east')
]

{ #category : #'tests - commands' }
RbsRobotTest >> testPrintString [

	self 
		assert: (RbsMoveCommand new distance: 5; printString)
		equals: 'mov 5'
		
]

{ #category : #'tests - replay' }
RbsRobotTest >> testReplay [

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
	self assert: rb position equals: 9@4.
	rb startLocation: 5@1.
	rb replay.
	self assert: rb position equals: 10@4
	
]

{ #category : #'tests - replay' }
RbsRobotTest >> testReplayAsCommand [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb executeCommandBased: 
'base 4 1'.
	rb executeCommandBased: 
'resM
dir #east
mov 2
mov 3
dir #north
mov 3'.
	self assert: rb position equals: 9@4.
rb executeCommandBased: 'stopM
base 5 1
replay'.
	self assert: rb position equals: 10@4
	
]

{ #category : #'tests - replay' }
RbsRobotTest >> testReset [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
resM
mov 3'.
	self assert: rb path size equals: 1.
	self assert: rb path first printString equals: 'mov 3'
	
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

{ #category : #'tests - printing' }
RbsRobotTest >> testRobotPrinting [
	| rb b |
	rb := RbsGround new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 5 y: 3.
	self assert: rb printString equals: 'a RbsGround _ 5 3'
]

{ #category : #'tests - new commands' }
RbsRobotTest >> testStartPositionAsCommand [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb executeCommandBased: 
'base 4 1
dir #east
mov 2
mov 3
dir #north
mov 3'.
	self assert: rb position equals: 9@4
]

{ #category : #'tests - replay' }
RbsRobotTest >> testStartStop [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
stopM
mov 3'.
	self assert: rb path size equals: 2
	
]

{ #category : #'tests - replay' }
RbsRobotTest >> testStopAndReset [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
stopM
resM
mov 3'.
	self assert: rb path size equals: 0
	
]

{ #category : #'tests - optimize' }
RbsRobotTest >> testToOptimizeAPathWeNeedAtLeastTwoElements [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb startLocation: 4@1.
	rb optimizePath: 
'dir #east'.
	self 
		assert: rb path first printString 
		equals: 'dir #east'
]
