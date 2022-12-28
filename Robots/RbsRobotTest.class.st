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
RbsRobotTest >> testComputeNewPosition [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	self assert: (rb computeNewPosition: 10) equals: 14@1.


]

{ #category : #'tests - wayback' }
RbsRobotTest >> testComputeOppositeDirection [


	| cmd |
	cmd := RbsDirectionCommand new.
	self assert: (cmd computeOppositeDirection: #east) equals: #west.
	self assert: (cmd computeOppositeDirection: #west) equals: #east.
	self assert: (cmd computeOppositeDirection: #north) equals: #south.
	self assert: (cmd computeOppositeDirection: #south) equals: #north.
]

{ #category : #'tests - wayback' }
RbsRobotTest >> testCut [

	| res |
	res := OrderedCollection new. 
	
	#(2 2 #east 1 1 1 #north 5 #east) 
		ifCutOn: [ :s | s isSymbol ] 
		doWithCutAndUncuts: [ :cut :before | res addLast: cut; addAll: before ]
		finally: [:u | res addLast: u].
	self assert: res equals: #(#east 2 2 #north 1 1 1 #east 5) asOrderedCollection
]

{ #category : #'tests - wayback' }
RbsRobotTest >> testDirectionAsWayBack [


	| opposite |
	opposite := (RbsDirectionCommand new direction: #east) asWayBack.
	self assert: opposite direction equals: #west.	
	opposite := (RbsDirectionCommand new direction: #west) asWayBack.
	self assert: opposite direction equals: #east.
	
]

{ #category : #tests }
RbsRobotTest >> testExecute [


	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
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
	rb x: 4 y: 1.
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
	rb x: 4 y: 1.
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

{ #category : #'tests - wayback' }
RbsRobotTest >> testMoveAsWayBack [


	| opposite |
	opposite := (RbsMoveCommand new distance: 5) asWayBack.
	self assert: opposite distance equals: 5.
	
	opposite := (RbsMoveCommand new distance: 5) asWayBack.
	self assert: opposite distance equals: 5.
	
	opposite := (RbsMoveCommand new distance: 0) asWayBack.
	self assert: opposite distance equals: 0
]

{ #category : #'tests - optimize linked' }
RbsRobotTest >> testOptimizeMergeThreeMoves [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3
mov 4'.
	self 
		assert: (rb path collect: [ :each | each printString ]) asOrderedCollection
		equals: #( 'mov 9') asOrderedCollection
]

{ #category : #'tests - optimize ordered' }
RbsRobotTest >> testOptimizeMergeThreeMoves2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'mov 2
mov 3
mov 4'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 9') asOrderedCollection
]

{ #category : #'tests - optimize linked' }
RbsRobotTest >> testOptimizeMergeThreeMovesAndOthers [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 9' 'dir #east')
]

{ #category : #'tests - optimize ordered' }
RbsRobotTest >> testOptimizeMergeThreeMovesAndOthers2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 9' 'dir #east') asOrderedCollection
]

{ #category : #'tests - optimize linked' }
RbsRobotTest >> testOptimizeMergeTwoMoves [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3'.
	self 
		assert: (rb path collect: [ :each | each printString ]) asOrderedCollection
		equals: #( 'mov 5') asOrderedCollection
]

{ #category : #'tests - optimize ordered' }
RbsRobotTest >> testOptimizeMergeTwoMoves2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'mov 2
mov 3'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 5') asOrderedCollection
]

{ #category : #'tests - optimize linked' }
RbsRobotTest >> testOptimizeMergeTwoMovesAndOthers [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 5' 'dir #east')
]

{ #category : #'tests - optimize ordered' }
RbsRobotTest >> testOptimizeMergeTwoMovesAndOthers2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'mov 2
mov 3
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 5' 'dir #east') asOrderedCollection
]

{ #category : #'tests - optimize linked' }
RbsRobotTest >> testOptimizeNoMergeThenMergeThreeMovesAndOthers [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'dir #north
mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) asOrderedCollection
		equals: #( 'dir #north' 'mov 9' 'dir #east') asOrderedCollection 
]

{ #category : #'tests - optimize ordered' }
RbsRobotTest >> testOptimizeNoMergeThenMergeThreeMovesAndOthers2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'dir #north
mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'dir #north' 'mov 9' 'dir #east') asOrderedCollection 
]

{ #category : #'tests - optimize linked' }
RbsRobotTest >> testOptimizeTwoDirections [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'dir #north
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'dir #east')
]

{ #category : #'tests - optimize ordered' }
RbsRobotTest >> testOptimizeTwoDirections2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'dir #north
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'dir #east') asOrderedCollection
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
	rb x: 4 y: 1.
	
	rb executeCommandBased: 
'dir #east
mov 2
mov 3
dir #north
mov 3'.
	self assert: rb position equals: 9@4.
	rb x: 5 y: 1.
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
	rb x: 4 y: 1.
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
	rb x: 4 y: 1.
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
	rb x: 4 y: 1.
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
	rb x: 14 y:1.
	rb direction: #north.
	self assert: (rb board atX: 14 atY: 1) equals: rb.
	rb move: 10.
	self assert: (rb board atX: 14 atY: 11) equals: rb.
	
]

{ #category : #tests }
RbsRobotTest >> testRobotMovePreservesGround [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y:1.
	self assert: rb previousTile class equals: RbsGround.
	self assert: rb previousTile x equals: 4.
	rb move: 10.
	self assert: (rb board atX: 4 atY: 1) class equals: RbsGround.
	self assert: (rb board atX: 14 atY: 1) equals: rb.
	self assert: rb previousTile position equals: 14@1
	
]

{ #category : #tests }
RbsRobotTest >> testRobotMoveSouth [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 14y: 11.
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
	rb x: 14 y: 1.
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

{ #category : #'tests - optimize linked' }
RbsRobotTest >> testToOptimizeAPathWeNeedAtLeastTwoElements [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'dir #east'.
	self 
		assert: rb path first printString 
		equals: 'dir #east'
]

{ #category : #'tests - optimize ordered' }
RbsRobotTest >> testToOptimizeAPathWeNeedAtLeastTwoElements2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'dir #east'.
	self 
		assert: rb path first printString 
		equals: 'dir #east'
]

{ #category : #'tests - wayback' }
RbsRobotTest >> testWayBack [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb executeCommandBased: 
'dir #east
mov 2
mov 3
dir #north
mov 3
wback'.
	self assert: rb position equals: 4@1.

]

{ #category : #'tests - wayback' }
RbsRobotTest >> testWayBack2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb executeCommandBased: 
'dir #east
mov 5
dir #north
mov 3
dir #east
mov 4
wback'.
	self assert: rb position equals: 4@1.

]
