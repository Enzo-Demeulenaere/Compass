Class {
	#name : #BaselineOfRobots,
	#superclass : #BaselineOf,
	#category : #BaselineOfRobots
}

{ #category : #baselines }
BaselineOfRobots >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
    		baseline: 'ContainersArray2D' 
    		with: [ spec repository: 'github://pharo-containers/Containers-Array2D/src' ].
		
		spec 
			package: #'Robots-Board'
				 with: [
				spec requires:  #( #'ContainersArray2D') ];
			package: #'Robots' with: [
				spec requires:  #( #'Robots-Board') ];
			package: #'Robots-Tests' with: [
				spec requires:  #( #'Robots') ];
			
			package: #'Robots-Optimize-Tests' with: [
				spec requires:  #( #'Robots')];
			package: #'Robots-BasicCommands-Tests' with: [
				spec requires:  #( #'Robots')];
			package: #'Robots-Replay-Tests' with: [
				spec requires:  #( #'Robots')];
			package: #'Robots-WayBack-Tests' with: [
				spec requires:  #( #'Robots')] 
			]
		

]
