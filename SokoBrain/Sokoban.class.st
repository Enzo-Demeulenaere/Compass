Class {
	#name : #Sokoban,
	#superclass : #Object,
	#category : #'SokoBrain-UI'
}

{ #category : #'as yet unclassified' }
Sokoban class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar
		background: Color lightRed;
		border: (BlBorder paint: Color red).
	^ bar
]

{ #category : #'as yet unclassified' }
Sokoban class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu
		label: (ToLabel text: 'Help').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #glamorousHelp)).
	menu whenClickedDo: [
		| container lab space |
		lab := ToLabel text: 'How to play:
		 
Sokoban is a puzzle video game in which the player pushes boxes around in a warehouse, trying to get them to storage locations. 
The game was designed in 1981 by Hiroyuki Imabayashi, and first published in December 1982.

The game is played on a board of squares, where each square is a floor or a wall. 
Some floor squares contain boxes, and some floor squares are marked as storage locations.

The player is confined to the board and may move horizontally or vertically onto empty squares (never through walls or boxes). 
The player can move a box by walking up to it and push it to the square beyond. 
Boxes cannot be pulled, and they cannot be pushed to squares with walls or other boxes. 
The number of boxes equals the number of storage locations. 
The puzzle is solved when all boxes are placed at storage locations
	
-----

You can start playing with the ''Levels'' menu and choose a level you would like to play
			
Have fun !' asRopedText.
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: Color lightRed;
			             padding: (BlInsets all: 15);
			             layout: BlLinearLayout vertical;
			             constraintsDo: [ :c |
				             c horizontal fitContent.
				             c vertical fitContent ].
		container addChild: lab.
		space := OBlSpace new.
		space root
			layout: BlFrameLayout new;
			addChild: container;
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent ].
		space pulse.
		space extent: container extent.
		space show ].
	^ menu
]

{ #category : #'as yet unclassified' }
Sokoban class >> menuLevel [

	| menu manager subMenuMicroban |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Levels').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #solidMenu)).

	manager := SkGameManager menu: menu.

	subMenuMicroban := ToMenu new label:
		                   (ToLabel new text: 'mazesMicroban').
	1 to: SkGameManager mazesMicroban size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenuMicroban addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesMicroban at: i.
				 manager launchFromString: string inDictionary: 'mazesMicroban' at: i  ]) ].
	menu addItem: subMenuMicroban.



	^ menu
]

{ #category : #'as yet unclassified' }
Sokoban class >> openWithMenuBar [

	| space levelMenu helpMenu bar title |
	levelMenu := self menuLevel.
	helpMenu := self menuHelp.
	bar := self menuBar.
	title := self title.

	bar addMenu: levelMenu.
	bar addMenu: helpMenu.
	space := OBlSpace new.


	space root addChild: title.
	space root addChild: bar.
	space extent: 1000 @ 1000.
	space show
]

{ #category : #accessing }
Sokoban class >> title [

	| title |
	title := BlElement new background: Color lightRed.
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ('Sokoban' asRopedText
				   fontName: 'Phosphate';
				   fontSize: 100)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]
