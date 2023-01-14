Class {
	#name : #RbsBWaybackCommand,
	#superclass : #RbsCommand,
	#instVars : [
		'distance',
		'argX',
		'argY'
	],
	#category : #'Robots-Commands'
}

{ #category : #accessing }
RbsBWaybackCommand class >> commandName [ 
	^ 'wback'
]

{ #category : #execution }
RbsBWaybackCommand >> executeOn: aRobot [

	| path newPath |
	path := aRobot path reverse allButFirst.
	newPath := OrderedCollection new. 
	path 
		ifCutOn: [ :e | e class = RbsDirectionCommand ] 
		doWithCutAndUncuts: [ :cut :before | newPath addLast: cut asWayBack; addAll: before ]
		finally: [:u | newPath addLast: u].
	
	newPath do: [:each | each executeOn: aRobot].
]
