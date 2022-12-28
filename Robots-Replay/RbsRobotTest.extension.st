Extension { #name : #RbsRobotTest }

{ #category : #'*Robots-Replay' }
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

{ #category : #'*Robots-Replay' }
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

{ #category : #'*Robots-Replay' }
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

{ #category : #'*Robots-Replay' }
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

{ #category : #'*Robots-Replay' }
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

{ #category : #'*Robots-Replay' }
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

{ #category : #'*Robots-Replay' }
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

{ #category : #'*Robots-Replay' }
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
