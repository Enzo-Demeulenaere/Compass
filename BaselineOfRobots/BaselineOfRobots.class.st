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
    		baseline: 'ContainersLinkedList' 
    		with: [ spec repository: 'github://pharo-containers/Containers-LinkedList/src' ].
		
		spec 
			package: #'Robots-Board';
			package: #'Robots' with: [
				spec requires:  #( #'Robots-Board' 'ContainersLinkedList' 'ContainersArray2D') ];
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
