Extension { #name : #RbsRobotTest }

{ #category : #'*Robots-BasicOrders' }
RbsRobotTest >> testComputeNewPosition [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	self assert: (rb computeNewPosition: 10) equals: 14@1.


]

{ #category : #'*Robots-BasicOrders' }
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

{ #category : #'*Robots-BasicOrders' }
RbsRobotTest >> testRobotAtLocation [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	self assert: (rb board atX: 4 atY: 1) equals: rb
]

{ #category : #'*Robots-BasicOrders' }
RbsRobotTest >> testRobotDefaultDirection [

	| rb |
	rb := RbsRobot new.
	self assert: rb direction equals: #east
]

{ #category : #'*Robots-BasicOrders' }
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

{ #category : #'*Robots-BasicOrders' }
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

{ #category : #'*Robots-BasicOrders' }
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

{ #category : #'*Robots-BasicOrders' }
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

{ #category : #'*Robots-BasicOrders' }
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

{ #category : #'*Robots-BasicOrders' }
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
