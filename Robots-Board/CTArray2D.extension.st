Extension { #name : #CTArray2D }

{ #category : #'*Robots-Board' }
CTArray2D >> leftToRightFromBottomToTopDo: aBlock [
	"Apply a block to each element following that order left to right but from bottom to top"
	"123
	456
	=> 
	456123
	"
	
	 self height to: 1 by: -1 do: [:row |
		1 to: self width do: [:col |
			aBlock  value: (self atColumn: col atRow: row)]]
]
