Class {
	#name : #BaselineOfSokoBrain,
	#superclass : #BaselineOf,
	#category : #BaselineOfSokoBrain
}

{ #category : #baselines }
BaselineOfSokoBrain >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
    		baseline: 'ContainersArray2D' 
    		with: [ spec repository: 'github://pharo-containers/Containers-Array2D/src' ].

		spec 
			package: #'Compass';
			package: #'SokoBrain'  with: [
				spec requires:  #( #'Compass' 'Array2D') ]
			]

]
