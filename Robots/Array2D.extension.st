Extension { #name : #Array2D }

{ #category : #'*Robots' }
Array2D >> rowsColumnsDo: aTwoArgumentBlock [
	"Perform aTwoArgumentBlock with row and column as inputs"

	| i |
	i := 0.
	1 to: numberOfRows do: [:row |
		1 to: numberOfColumns do: [:column |
			aTwoArgumentBlock value: row value: column]].
]

{ #category : #'*Robots' }
Array2D >> rowsColumnsPut: aTwoArgumentBlock [
	"Set the value at row,colum as the value of aTwoArgumentBlock with row and column as inputs."

	| i |
	i := 0.
	1 to: numberOfRows do: [:row |
		1 to: numberOfColumns do: [:column |
			contents at: (i := i + 1) put: (aTwoArgumentBlock value: row value: column)]].
]
