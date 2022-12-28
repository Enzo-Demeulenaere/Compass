Extension { #name : #RbsRobotTest }

{ #category : #'*Robots-BasicCommands' }
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

{ #category : #'*Robots-BasicCommands' }
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

{ #category : #'*Robots-BasicCommands' }
RbsRobotTest >> testMappingIsInitialized [

	| r |
	r := RbsRobot new.
	self assert: (r commandClassFor: RbsDirectionCommand commandName) equals: RbsDirectionCommand
]

{ #category : #'*Robots-BasicCommands' }
RbsRobotTest >> testPrintString [

	self 
		assert: (RbsMoveCommand new distance: 5; printString)
		equals: 'mov 5'
		
]

{ #category : #'*Robots-BasicCommands' }
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
