Class {
	#name : #AlainExample,
	#superclass : #Object,
	#category : #'Robots-Bloc'
}

{ #category : #examples }
AlainExample class >> example [


| container e leftSC rightSC |
container := BlElement new size: 200@200.
container layout: BlBasicLayout new.
container background: Color yellow.
e := BlElement new size: 20@20.
e background: Color blue.
e position: 10@30.
e when: BlMouseDownEvent do: [ :event | event target inspect ].
container addChild: e.
container openInNewSpace.
leftSC := BlShortcutWithAction new
			 	combination: BlKeyCombination arrowLeft;
			  	action: [ :aShortcutEvent :aShortcut |
					aShortcutEvent traceCr.
					e relocate: (e position x - 20 @ e position y) ].
rightSC := BlShortcutWithAction new
			 	combination: BlKeyCombination arrowRight;
			  	action: [ :aShortcutEvent :aShortcut |
					aShortcutEvent traceCr.
					e relocate: (e position x + 20 @ e position y) ].
container addShortcut: leftSC.
container addShortcut: rightSC.
container requestFocus.
]
