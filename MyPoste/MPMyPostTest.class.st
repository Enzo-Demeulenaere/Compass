Class {
	#name : #MPMyPostTest,
	#superclass : #TestCase,
	#instVars : [
		'mailBox'
	],
	#category : #MyPoste
}

{ #category : #tests }
MPMyPostTest >> testCreateLetter [

	| letter |
	letter := MpLetter new contents: 'I wish you an happy new year'.
	self assert: letter contents equals: 'I wish you an happy new year'
]

{ #category : #tests }
MPMyPostTest >> testCreateLetterFor [

	| letter |
	letter := MpLetter new contents: 'I wish you an happy new year' ; to: #KinDenmark.
	self assert: letter address equals: #KinDenmark
]

{ #category : #tests }
MPMyPostTest >> testCreateNetwork [

	| houseSinFrance houseKInDenmark centralInFrance centralInDenmark houseSInFrance |
	houseSinFrance := MpMailbox new address: #SinFrance.
	houseKInDenmark := MpMailbox new address: #SinFrance.
	centralInFrance := MpPostStation new address: #centralF.
	centralInDenmark := MpPostStation new address: #centralD.
	houseSInFrance registerTo: centralInFrance.
	centralInFrance connectedTo: centralInDenmark.
	centralInDenmark registerTo: houseKInDenmark.
	





]

{ #category : #tests }
MPMyPostTest >> testPostLetter [

	| letter |
	letter := MpLetter new contents: 'I wish you an happy new year'; to: #KinDenmark.
	mailBox post: letter.
	
]

{ #category : #tests }
MPMyPostTest >> testSendLetter [

	| letter |
	letter := MpLetter new send: 'I wish you an happy new year' to: #KinDenmark.
	self assert: letter contents equals: 'I wish you an happy new year'
]
