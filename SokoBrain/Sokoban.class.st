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

	| menu manager subMenuMicroban subMenuLoma subMenuPack subMenuSasquatch subMenuSasquatchIII subMenuSasquatchIV subMenuSasquatchV subMenuSasquatchVI subMenuUAlberta |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Levels').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #solidMenu)).

	manager := SkGameManager menu: menu.

	subMenuLoma := self subMenuLoma: manager.
	subMenuMicroban := self subMenuMicroban: manager.
	subMenuPack := self subMenuPack: manager.
	subMenuSasquatch := self subMenuSasquatch: manager.
	subMenuSasquatchIII := self subMenuSasquatchIII: manager.
	subMenuSasquatchIV := self subMenuSasquatchIV: manager.
	subMenuSasquatchV := self subMenuSasquatchV: manager.
	subMenuSasquatchVI := self subMenuSasquatchVI: manager.
	subMenuUAlberta := self subMenuUAlberta: manager.

	menu addItem: subMenuLoma.
	menu addItem: subMenuMicroban.
	menu addItem: subMenuPack.
	menu addItem: subMenuSasquatch.
	menu addItem: subMenuSasquatchIII.
	menu addItem: subMenuSasquatchIV.
	menu addItem: subMenuSasquatchV.
	menu addItem: subMenuSasquatchVI.
	menu addItem: subMenuUAlberta.
	menu addItem: (self subMenuTest: manager).




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

{ #category : #'as yet unclassified' }
Sokoban class >> subMenuLoma: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesLoma').
	1 to: SkGameManager mazesLoma size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesLoma at: i.
				 aManager launchFromString: string inDictionary: 'mazesLoma' at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
Sokoban class >> subMenuMicroban: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesMicroban').
	1 to: SkGameManager mazesMicroban size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesMicroban at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesMicroban'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
Sokoban class >> subMenuPack: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesPack').
	1 to: SkGameManager mazesPack size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesPack at: i.
				 aManager launchFromString: string inDictionary: 'mazesPack' at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
Sokoban class >> subMenuSasquatch: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesSasquatch').
	1 to: SkGameManager mazesSasquatch size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesSasquatch at: i.
				 aManager launchFromString: string inDictionary: 'mazesSasquatch' at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
Sokoban class >> subMenuSasquatchIII: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesSasquatchIII').
	1 to: SkGameManager mazesSasquatchIII size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesSasquatchIII at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesSasquatchIII'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
Sokoban class >> subMenuSasquatchIV: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesSasquatchIV').
	1 to: SkGameManager mazesSasquatchIV size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesSasquatchIV at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesSasquatchIV'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
Sokoban class >> subMenuSasquatchV: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesSasquatchV').
	1 to: SkGameManager mazesSasquatchV size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesSasquatchV at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesSasquatchV'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
Sokoban class >> subMenuSasquatchVI: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesSasquatchVI').
	1 to: SkGameManager mazesSasquatchVI size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesSasquatchVI at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesSasquatchVI'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
Sokoban class >> subMenuTest: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesTest').
	1 to: SkGameManager mazesTest size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesTest at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesTest'
					 at: i ]) ].
	^ subMenu
]

{ #category : #'as yet unclassified' }
Sokoban class >> subMenuUAlberta: aManager [

	| subMenu |
	subMenu := ToMenu new label: (ToLabel new text: 'mazesUAlberta').
	1 to: SkGameManager mazesUAlberta size do: [ :i |
		| stream |
		stream := String streamContents: [ :out | out print: i ].

		subMenu addItem:
			((ToButtonMenuItem new labelText: stream) whenClickedDo: [
				 | string |
				 string := SkGameManager mazesUAlberta at: i.
				 aManager
					 launchFromString: string
					 inDictionary: 'mazesUAlberta'
					 at: i ]) ].
	^ subMenu
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
