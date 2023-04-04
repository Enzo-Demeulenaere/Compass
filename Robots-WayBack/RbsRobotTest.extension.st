Extension { #name : #RbsRobotTest }

{ #category : #'*Robots-WayBack' }
RbsRobotTest >> testComputeOppositeDirection [


	| cmd |
	cmd := RbsDirectionCommand new.
	self assert: (cmd computeOppositeDirection: #east) equals: #west.
	self assert: (cmd computeOppositeDirection: #west) equals: #east.
	self assert: (cmd computeOppositeDirection: #north) equals: #south.
	self assert: (cmd computeOppositeDirection: #south) equals: #north.
]

{ #category : #'*Robots-WayBack' }
RbsRobotTest >> testCut [

	| res |
	res := OrderedCollection new. 
	
	#(2 2 #east 1 1 1 #north 5 #east) 
		ifCutOn: [ :s | s isSymbol ] 
		doWithCutAndUncuts: [ :cut :before | res addLast: cut; addAll: before ]
		finally: [:u | res addLast: u].
	self assert: res equals: #(#east 2 2 #north 1 1 1 #east 5) asOrderedCollection
]

{ #category : #'*Robots-WayBack' }
RbsRobotTest >> testDirectionAsWayBack [


	| opposite |
	opposite := (RbsDirectionCommand new direction: #east) asWayBack.
	self assert: opposite direction equals: #west.	
	opposite := (RbsDirectionCommand new direction: #west) asWayBack.
	self assert: opposite direction equals: #east.
	
]

{ #category : #'*Robots-WayBack' }
RbsRobotTest >> testMoveAsWayBack [


	| opposite |
	opposite := (RbsMoveCommand new distance: 5) asWayBack.
	self assert: opposite distance equals: 5.
	
	opposite := (RbsMoveCommand new distance: 5) asWayBack.
	self assert: opposite distance equals: 5.
	
	opposite := (RbsMoveCommand new distance: 0) asWayBack.
	self assert: opposite distance equals: 0
]

{ #category : #'*Robots-WayBack' }
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

{ #category : #'*Robots-WayBack' }
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
