'From Cuis 4.1 of 12 December 2012 [latest update: #1600] on 20 February 2013 at 6:13:16 pm'!
'Description Please enter a description for this package '!
!classDefinition: #ToDoList category: #'AidaToDoExample-Model'!
Object subclass: #ToDoList
	instanceVariableNames: 'owner tasks other'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AidaToDoExample-Model'!
!classDefinition: 'ToDoList class' category: #'AidaToDoExample-Model'!
ToDoList class
	instanceVariableNames: ''!

!classDefinition: #ToDoListApp category: #'AidaToDoExample-App'!
WebApplication subclass: #ToDoListApp
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AidaToDoExample-App'!
!classDefinition: 'ToDoListApp class' category: #'AidaToDoExample-App'!
ToDoListApp class
	instanceVariableNames: ''!

!classDefinition: #ToDoLoginWidget category: #'AidaToDoExample-App'!
WebWidget subclass: #ToDoLoginWidget
	instanceVariableNames: 'username password'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AidaToDoExample-App'!
!classDefinition: 'ToDoLoginWidget class' category: #'AidaToDoExample-App'!
ToDoLoginWidget class
	instanceVariableNames: ''!

!classDefinition: #ToDoRedirectApp category: #'AidaToDoExample-App'!
WebApplication subclass: #ToDoRedirectApp
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AidaToDoExample-App'!
!classDefinition: 'ToDoRedirectApp class' category: #'AidaToDoExample-App'!
ToDoRedirectApp class
	instanceVariableNames: ''!

!classDefinition: #ToDoTask category: #'AidaToDoExample-Model'!
Object subclass: #ToDoTask
	instanceVariableNames: 'id name description members deadline status parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AidaToDoExample-Model'!
!classDefinition: 'ToDoTask class' category: #'AidaToDoExample-Model'!
ToDoTask class
	instanceVariableNames: ''!

!classDefinition: #ToDoTaskWidget category: #'AidaToDoExample-App'!
WebWidget subclass: #ToDoTaskWidget
	instanceVariableNames: 'task mode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AidaToDoExample-App'!
!classDefinition: 'ToDoTaskWidget class' category: #'AidaToDoExample-App'!
ToDoTaskWidget class
	instanceVariableNames: ''!


!ToDoList commentStamp: '<historical>' prior: 0!
ToDoList holds tasks to do by this user.  

This is a model part of this example MVC. In Aida every object can have its Url. Urls therefore point to domain model objects and not to the Apps as their web presentations. Urls are generated automatically when some web link pointed to some domain object. That is, you never need to deal with an Url directly, in in pure OO fashion you deal just with object references. But you can express an Url preference by implementing an #preferedUrl method in your domain class. In our ToDoList case it recommends an nice looking Url like '/name surname/todo'

Instance Variables
	owner	<WebUser>	user as an owner of that todo list
	tasks	<Collection> user's tasks to do
	other	<Dictionary>	 other stuff


!

!ToDoListApp commentStamp: '<historical>' prior: 0!
ToDoListApp is a presentation class for todo list of logged-in user. 

In a pure MVC fashion it servers as a web presenentation (view and controler/actions) of a model object, in our case an instance of ToDoList. Such App have  view methods and action methods or blocks. In our case just #viewMain and no action methods, but we have many action blocks, like #onClickDo: .
!

!ToDoLoginWidget commentStamp: '<historical>' prior: 0!
ToDoLoginWidget for a login popup with ajaxified fields to validate username and password entries immediatelly. 

Note that the login button is nonactive/grayed out until a form is complete and valid, that is, until username and password are entered and correct. 
!

!ToDoRedirectApp commentStamp: '<historical>' prior: 0!
ToDoRedirectApp just redirects to the currently logged-in user's todo list. 

This is a so called standalone App and it is registered at Url '/todo' It is registeredy automatically at install by evaluating:

	AIDASite default register: ToDoRedirectApp onUrl: '/todo'

The whole installation procedure resides on the class initializing methods .
!

!ToDoTask commentStamp: '<historical>' prior: 0!
ToDoTask describes a task to be completed.

Instance Variables
	id	<String> task number to uniquely identify a task
	name	<String>	 short name of the task
	description	<String>	description of description
	deadline	<Date>	when this task should be completed
	members	<Set>	additional users assigned to this task
	status	<Symbol>	#pending or #complete
	parent	<ToDoList>	a todo list where this task belongs
!

!ToDoTaskWidget commentStamp: '<historical>' prior: 0!
ToDoTaskWidget for adding new task or editing existing one. It also provides a popup to manage a "membership", that is, additional users assigned to that task.

Widget in Aida is a standalone reusable component, with its own class. It alos have its own form. But every web element (as instance of WebElement) is is standalone and reusable too (also Ajax updatable). Difference between web elements and widgets is only that former are created in methods in Apps and widget, while later has their own classes. and widgets have again methods to create web elements... 

Instance Variables
	mode	<Symbol>     #add or #edit
	task 	<ToDoTask> which task is edited
!

!DefaultWebStyle methodsFor: '*AidaToDoExample'!
buttonDeletePng
	" 'imgs/button-delete.png' asFilename contentsAsMethod"
^#[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 14 0 0 0 14 8 6 0 0 0 31 72 45 209 0 0 0 1 115 82 71 66 0 174 206 28 233 0 0 0 6 98 75 71 68 0 255 0 255 0 255 160 189 167 147 0 0 0 9 112 72 89 115 0 0 11 19 0 0 11 19 1 0 154 156 24 0 0 0 7 116 73 77 69 7 219 6 26 18 48 20 222 247 145 135 0 0 0 187 73 68 65 84 40 207 157 146 225 17 194 32 12 133 95 123 204 193 8 92 71 144 211 5 220 64 54 208 73 24 129 14 210 30 56 129 61 70 96 2 55 168 63 26 60 140 212 107 205 175 240 200 7 73 238 53 195 24 30 0 58 236 139 73 16 116 3 48 109 132 58 0 86 228 23 78 199 67 216 66 13 227 82 214 150 162 151 106 246 82 93 120 177 151 202 122 169 230 82 107 89 77 15 192 149 48 229 87 186 123 135 40 15 58 69 227 165 2 193 89 118 0 122 157 162 89 5 57 156 187 224 80 173 213 28 247 149 124 29 164 153 28 205 244 53 115 21 44 33 157 162 161 22 67 13 230 63 214 22 113 38 115 184 95 160 225 139 208 41 62 1 104 0 31 122 51 140 97 254 215 114 19 0 187 215 228 47 176 180 74 177 94 149 37 35 0 0 0 0 73 69 78 68 174 66 96 130 ]! !

!DefaultWebStyle methodsFor: '*AidaToDoExample' stamp: 'janko 7/24/2011 15:32'!
css59ToDoExample
	^'
/* Based on HTML5 forms tutorial by Michael Barrett */
/* http://net.tutsplus.com/tutorials/html-css-techniques/build-a-neat-html5-powered-contact-form/ */

.todo-list, 
.todo-form,
.dialog {  
	background-color:#F2F7F9;  	
	padding:20px;  
	margin: 5px auto;  
	border: 6px solid #8FB5C1;  
	-moz-border-radius:15px;  
	-webkit-border-radius:15px;  
	border-radius:15px;  
}
.dialog {
	width: 200;
	margin: 5px auto;  
}
.todo-list {
	width:600px;
	margin-top:40px;
	position:center;
}
.todo-form {
	width:400px;
}
.todo-form input,  
.todo-form select,  
.todo-form textarea,  
.todo-form .label {  
	font-size:12px;  
	margin-bottom:2px;  
}
.todo-form input,  
.todo-form select,  
.todo-form textarea {  
	width:390px;   
	border: 1px solid #CEE1E8;  
	margin-bottom:10px;  
	padding:4px;  
}
.todo-nowide { width: 270px; } 
.todo-nowide input { width: 200px; }  // member selection popup

.todo-form .datefield {width: 200px; }
.todo-form input:focus,  
.todo-form select:focus,  
.todo-form textarea:focus {  
	border: 1px solid #AFCDD8;  
	background-color: #EBF2F4;  
}
.todo-form textarea {  
	height:80px;  
	resize: none;  
}
.todo-form label {  
	display:block;  
}
.todo-form .required {  
	font-weight:bold;  
	color:#F00;  
}
.todo-form .button,
.dialog-button {  
	width: 80px;  
	background-color:#333;  
	color:#FFF;  
	border:none;  
	float:rightright;  
	margin-bottom:0px;  
	margin-right:2px;  
	background-color:#8FB5C1;  
	border-radius:8px; 
	-moz-border-radius:8px;  
}
.todo-form .button:hover,
.dialog-button {  
	background-color: #A6CFDD;  
}
.todo-form .button:focus,
.dialog-button {  
	background-color: #A6CFDD;  
}
.todo-form .button:active,
.dialog-button {  
	position:relative;  
	top:1px;  
}
.todo-form .button:disabled,
.dialog-button:disabled {  
	background-color:#DDD;
}  


.todo-required { color: red; }

#req-field-desc {  
	font-style:italic;  
}
/* Remove box shadow firefox, chrome and opera put around required fields. It looks rubbish. */  
input:required, textarea:required {  
	-moz-box-shadow:none;  
	-webkit-box-shadow:none;  
	-o-box-shadow:none;  
	box-shadow:none;  
}  
/* Normalize placeholder styles */  
/* chrome, safari */  
::-webkit-input-placeholder {  
	color:#CCC;  
	font-style:italic;  
}  
/* mozilla */  
input:-moz-placeholder, textarea:-moz-placeholder {  
	color:#CCC;  
	font-style:italic;  
}  
/* ie (faux placeholder) */  
input.placeholder-text, textarea.placeholder-text  {  
	color:#CCC;  
	font-style:italic;  
}  
' 
! !

!ToDoList methodsFor: 'adding-removing'!
addTask: aToDoTask
	self tasks add: aToDoTask.
	aToDoTask parent: self! !

!ToDoList methodsFor: 'changes'!
announceChange
	 "with auto cleanup of released application state"
	self announcers keys do: [:app | 
		app isActive ifFalse: 	[self announcers removeKey: app] ]. 
	self announcers associations do: [:assoc |
		assoc value associations do: [:assoc2 |
			assoc2 key "element" isActive
				ifTrue: [assoc2 value "block" value] 
				ifFalse: [assoc value removeKey: assoc2 key "element"] 
			] 
		]! !

!ToDoList methodsFor: 'accessing-other'!
announcers
	"whom to announce todo list changes"
	^self otherAt: #announcers ifAbsentPut: [Dictionary new]! !

!ToDoList methodsFor: 'adding-removing'!
deleteTask: aToDoTask
	self tasks remove: aToDoTask.
	aToDoTask parent: nil! !

!ToDoList methodsFor: 'initialize-release'!
initOther
	other := Dictionary new! !

!ToDoList methodsFor: 'initialize-release'!
initTasks
	tasks := OrderedCollection new! !

!ToDoList methodsFor: 'changes'!
onChangeDo: aBlock on: aWebElement app: aWebApplication
	"register a block to be executed on change of this todo list"
	(self announcers at: aWebApplication ifAbsentPut: Dictionary new)
		at: aWebElement  put: aBlock! !

!ToDoList methodsFor: 'private-other'!
other
	^other! !

!ToDoList methodsFor: 'private-other'!
otherAt: aSymbol
	"other values"
	^self otherAt: aSymbol ifAbsent: [nil]! !

!ToDoList methodsFor: 'private-other'!
otherAt: aSymbol ifAbsent: aBlock
	"other values"
	self other isNil ifTrue: [^aBlock value].
	^self other at: aSymbol ifAbsent: aBlock! !

!ToDoList methodsFor: 'private-other'!
otherAt: aSymbol ifAbsentPut: aBlock
	self other isNil ifTrue: [self initOther].
	^self other at: aSymbol ifAbsent: [self other at: aSymbol put: aBlock value]! !

!ToDoList methodsFor: 'private-other'!
otherAt: aSymbol put: anObject
	self other isNil ifTrue: [self initOther].
	^self other at: aSymbol put: anObject! !

!ToDoList methodsFor: 'accessing'!
owner
	"a person (aWebUser) who owns that todo list"
	^owner! !

!ToDoList methodsFor: 'private'!
owner: aWebUser
	owner := aWebUser! !

!ToDoList methodsFor: 'accessing'!
possibleMembers
	"who can be assigned to task besides owner. All registered users on this site + guest for now"
	^self site securityManager registeredGroup allUsers asSet
		add: self site securityManager guestUser;
		yourself! !

!ToDoList methodsFor: 'accessing'!
possibleMembersSorted
	^SortedCollection
		withAll: self possibleMembers
		sortBlock: [:a :b | a nameSurname < b nameSurname]! !

!ToDoList methodsFor: 'private' stamp: 'janko 7/10/2011 19:34'!
preferedUrl
	^'/', self owner nameSurname trimBlanks, '/todo'! !

!ToDoList methodsFor: 'accessing'!
site
	"a website on which we host that todo list"
	^self owner parent site! !

!ToDoList methodsFor: 'accessing'!
tasks
	tasks isNil ifTrue: [self initTasks].
	^tasks! !

!ToDoList class methodsFor: 'instance creation' stamp: ' 7/7/11 21:32'!
newFor: aWebUser
	
	^super new owner: aWebUser! !

!ToDoListApp methodsFor: 'views-elements'!
actionLinksFor: aTask on: aListElement
	| e |
	e := WebElement new.
	e add: (self completeLinkFor: aTask).
	(e addTextSmall: ' | '; addNilLinkText: 'edit')
		class: #'todo-actionlink';
		onClickPopup: (ToDoTaskWidget newForEdit: aTask) thenUpdate: aListElement.
	(e addTextSmall: ' | '; addLinkTo: '#' png: #buttonDeletePng title: 'Delete this task')
		onClickPopup: 
			(WebDialog newConfirm 
				text: 'Do you really want to delete that task?';
				ifTrue: 
					[self observee deleteTask: aTask.
					aListElement update]).		
	^e! !

!ToDoListApp methodsFor: 'views-elements'!
completeLinkFor: aTask
	"toogle complete status on click. If completed, it is grayed out and named 'uncomplete'"
	| e |
	e := WebElement newSpan.
	aTask isPending ifTrue:
		[(e addNilLinkText: 'complete')
			class: #'todo-actionlink';
			title: 'Click to complete this task';
			onClickDo: 
				[aTask setCompleted.
				e updateWith: aTask] ].
	aTask isCompleted ifTrue:
		[(e addNilLinkText: 'completed')
			class: #'todo-actionlink';
			style: 'color: lightgray';
			title: 'Click to uncomplete it';
			onClickDo: 
				[aTask setPending.
				e updateWith: aTask] ].
	^e! !

!ToDoListApp methodsFor: 'views-elements'!
creatorElementFor: aTask
	^aTask creator == self user 
		ifTrue: ['Me']
		ifFalse: [aTask creator name]! !

!ToDoListApp methodsFor: 'views'!
ensureLibraries
	"for date input in task open/edit popup"
	self style ensureJsAndCssForCalendarInHeader.! !

!ToDoListApp methodsFor: 'views-elements' stamp: 'janko 8/16/2011 16:06'!
logonElement
	| e |
	e := WebElement new.
	self session isLoggedIn  
		ifFalse: 
			[(e addNilLinkText: 'Sign-in')
				onClickPopup: ToDoLoginWidget new ]
		ifTrue: 
			[e addTextSmall: self user nameSurname, ' | '.
			(e addNilLinkText: 'Sign-out')
				onClickDo: 
					[self session logout.
					self page redirectTo: self user todoList] ].
	^e! !

!ToDoListApp methodsFor: 'views-elements'!
openLinkAndUpdate: aTaskElement
	| e |
	e := WebElement new.
	(e addNilLinkText: 'Open new task')
		onClickPopup:  
			(ToDoTaskWidget newForAdd
				onAnswerDo: [:newTask | 	
					self observee addTask: newTask.
					aTaskElement update]).
	^e! !

!ToDoListApp methodsFor: 'views-elements' stamp: 'janko 8/16/2011 16:07'!
taskListElement
	| e |
	e := WebElement newDiv.
	e add: (WebGrid new
		columnNames: #(nil 'Name' 'Deadline' 'By' 'Members' nil);
		columnAspects: #(nil name deadline nil memberNumber nil);
		columnWidth: #(0.05 nil 0.1 0.1 0.1 0.3);
		columnAlign: #(nil nil center center center right);
		column: 4 viewBlock: [:task | self creatorElementFor: task];
		column: 6 addBlock: [:task | self actionLinksFor: task on: e];
		collection: self observee tasks;
		setNumbering;
		rowsOnPage: 20;
		yourself).
	^e! !

!ToDoListApp methodsFor: 'views' stamp: 'janko 8/16/2011 16:14'!
viewMain
	| e taskList |
	self ensureLibraries.
	self title: (self user isGuest ifTrue: ['Guest'] ifFalse: ['My']), ' ToDo list'.
	e := WebElement newDiv class: #'todo-list'. e table width: 1. "100%"
	e cell colspan: 2; addTextH1: self title. e newRow.
	taskList := self taskListElement.
	e cell add: (self openLinkAndUpdate: taskList); addSpace.
	e newCell align: #right; add: self logonElement. 
	e newRow. e cell colspan: 2; add: taskList.
	self add: e.
	self observee onChangeDo: [taskList update] on: taskList app: self. 	"for real-time update of task list"! !

!ToDoLoginWidget methodsFor: 'view' stamp: 'janko 1/26/2012 21:24'!
build
	self username: ''; password: ''.
	self add: self loginElement.! !

!ToDoLoginWidget methodsFor: 'view'!
buttonsElement
	| e |
	e := WebElement new.
	(e addButtonText: 'Sign in') class: #button;
		disableUntilValid;   	"grayed out until all required fields entered and valid"
		onSubmitDo: 
			[self login.
			self page redirectTo: self user todoList];  "redirect to just logged in user's task list"
		onSubmitClose.
	(e addButtonText: 'Cancel') class: #button;
		onSubmitClose.
	^e! !

!ToDoLoginWidget methodsFor: 'view'!
instructionsElement
	| e |
	e := WebElement new.
	e addTextSmall: 'You can login as one of three users: easyworker/easyworker, hardworker/hardworker or lazyworker/lazyworker'.
	^e! !

!ToDoLoginWidget methodsFor: 'actions'!
login
	"both username and password must be valid in advance!!"
	self session loginUserNamed: self username withPassword: self password. 
	self password: ''.! !

!ToDoLoginWidget methodsFor: 'view'!
loginElement
	| e ufield pfield |
	e := WebElement newDiv class: #('todo-form' 'todo-nowide').  
	e table width: 1 "100".
	e cell colspan: 2; addTextH1: 'Sign in'; addBreak.
	e cell add: self instructionsElement; addBreak; addBreak.
	(e cell addText: 'Username: ') class: #label. (e cell addText: '*') class: #required.
	ufield := (e cell addInputFieldAspect: #username for: self)
		required;
		validIfTrue: [:value | value isEmpty or: [self site securityManager existUserNamed: value] ];
		errorText: 'This username does not exist';
		onChangePost.
	e cell add: ufield errorElement.  "which will show error if any"
	(e cell addText: 'Password: ') class: #label. (e cell addText: '*') class: #required.
	pfield := (e cell addInputFieldAspect: #password for: self)
		required;
		validIfTrue: [:value | value isEmpty or: 
			[self site securityManager existUserNamed: self username withPassword: value]] ;
		errorText: 'Password incorrect';
		onChangePost.
	e cell add: pfield errorElement. 
	e newRow. e newCell width: 0.7 "70%"; align: #right; add: self buttonsElement.
	^e! !

!ToDoLoginWidget methodsFor: 'accessing'!
password
	password isNil ifTrue: [^''].
	^password! !

!ToDoLoginWidget methodsFor: 'accessing'!
password: aString
	password := aString! !

!ToDoLoginWidget methodsFor: 'accessing'!
username
	username isNil ifTrue: [^''].
	^username! !

!ToDoLoginWidget methodsFor: 'accessing'!
username: aString
	username := aString! !

!ToDoRedirectApp methodsFor: 'views'!
viewMain
	"just redirect to the Todo list of currently logged-in user. See ToDoListApp for more"
	self redirectTo: self user todoList! !

!ToDoRedirectApp class methodsFor: 'class initialization' stamp: 'janko 7/24/2011 22:59'!
initDefaultAccessRightsOn: anAIDASite
	"all open for now"
	"ToDoRedirectApp initDefaultAccessRightsOn: AIDASite default"
	| smgr |
	smgr := anAIDASite securityManager.
	smgr allowViews: #(main) andUpdates: #(main)
		for: smgr allUsersGroup on: ToDoRedirectApp.
	smgr allowViews: #(main) andUpdates: #(main)
		for: smgr allUsersGroup on: ToDoListApp.! !

!ToDoRedirectApp class methodsFor: 'class initialization' stamp: 'janko 8/16/2011 13:15'!
initSomeToDoMembers
	"few possible participants in advance to choose from"
	"ToDoRedirectApp initSomeToDoMembers"
	| site todoGroup user|
	site := SwazooServer singleton siteNamed: 'aidademo'.
	site isNil ifTrue: [^nil].
	todoGroup := site securityManager groupNamed: 'ToDo'.
	todoGroup isNil ifTrue: 
		[todoGroup := site securityManager addGroup: (WebUserGroup new name: 'ToDo') ].
	(site securityManager userNamed: 'easyworker') isNil ifTrue:
		[user := WebUser new username: 'easyworker'; password: 'easyworker'; 
			name: 'Easy'; surname: 'Worker'; yourself.
		site securityManager addRegisteredUser: user.
		todoGroup addUser: user].
	(site securityManager userNamed: 'hardworker') isNil ifTrue:
		[user := WebUser new username: 'hardworker'; password: 'hardworker'; 
			name: 'Hard'; surname: 'Worker'; yourself.
		site securityManager addRegisteredUser: user.
		todoGroup addUser: user].
	(site securityManager userNamed: 'lazyworker') isNil ifTrue:
		[user := WebUser new username: 'lazyworker'; password: 'lazyworker'; 
			name: 'Lazy'; surname: 'Worker'; yourself.
		site securityManager addRegisteredUser: user.
		todoGroup addUser: user].! !

!ToDoRedirectApp class methodsFor: 'class initialization' stamp: 'janko 7/24/2011 21:01'!
initToDoExample
	"on installing this package register ToDoExampleApp on Url '/todo', on aidademo website if exists"
	"ToDoRedirectApp initToDoExample"
	| site |
	site := SwazooServer singleton siteNamed: 'aidademo'.
	site isNil ifTrue: [^nil].
	site register: ToDoRedirectApp onUrl: '/todo'.
	self initDefaultAccessRightsOn: site.
	self initSomeToDoMembers ! !

!ToDoRedirectApp class methodsFor: 'class initialization'!
initialize
	self initToDoExample! !

!ToDoTask methodsFor: 'changes'!
announceChange
	"notify todo list for a change on one of its tasks"
	self parent notNil ifTrue: [self parent announceChange]! !

!ToDoTask methodsFor: 'accessing'!
creator
	"a person who created and is assigned to this task"
	^self parent owner! !

!ToDoTask methodsFor: 'accessing'!
deadline
	"a date by which the task shoud be completted"
	^deadline! !

!ToDoTask methodsFor: 'accessing'!
deadline: aDate
	deadline := aDate.
	self announceChange! !

!ToDoTask methodsFor: 'accessing'!
description
	description isNil ifTrue: [^''].
	^description! !

!ToDoTask methodsFor: 'accessing'!
description: aString
	description := aString.
	self announceChange! !

!ToDoTask methodsFor: 'testing'!
hasBeenMissed
	self isCompleted not and: [self deadline < Date today]! !

!ToDoTask methodsFor: 'accessing'!
id
	"a sequential number of this task for that user"
	id isNil ifTrue: [self setId].
	^id! !

!ToDoTask methodsFor: 'accessing'!
id: anObject

	id := anObject! !

!ToDoTask methodsFor: 'initialize-release'!
initMembers
	members := Set new! !

!ToDoTask methodsFor: 'initialize-release' stamp: 'gsa 2/20/2013 17:59'!
initialize
	self 
		setPending;
		"deadline: (Date today addDays: 1)"
		"Cuis specific"
		deadline: (Date today + 24 hours)! !

!ToDoTask methodsFor: 'testing'!
isCompleted
	"task is completed"
	^self status = #completed! !

!ToDoTask methodsFor: 'testing'!
isPending
	"task not yet completed"
	^self status = #pending! !

!ToDoTask methodsFor: 'accessing'!
memberNumber
	"number of additional members assigned to that task"
	^self members size! !

!ToDoTask methodsFor: 'accessing'!
members
	"who is assigned to that task, besides the creator"
	members isNil ifTrue: [self initMembers].
	^members! !

!ToDoTask methodsFor: 'accessing'!
membersSorted
	"who is assigned to that task, besides the creator. Sorted by name and surname"
	^SortedCollection
		withAll: self members
		sortBlock: [:a :b | a nameSurname < b nameSurname ]! !

!ToDoTask methodsFor: 'accessing'!
name
	name isNil ifTrue: [^''].
	^name! !

!ToDoTask methodsFor: 'accessing'!
name: aString
	name := aString.
	self announceChange! !

!ToDoTask methodsFor: 'accessing'!
parent
	"a todo list where this task belongs"
	^parent! !

!ToDoTask methodsFor: 'private'!
parent: aToDoList
	parent := aToDoList! !

!ToDoTask methodsFor: 'private'!
preferedUrl
	^self parent preferedUrl, '/', self id asString! !

!ToDoTask methodsFor: 'accessing'!
setCompleted
	status := #completed.
	self announceChange! !

!ToDoTask methodsFor: 'private'!
setId
	id := self parent tasks size + 1.! !

!ToDoTask methodsFor: 'accessing'!
setPending
	status := #pending.
	self announceChange! !

!ToDoTask methodsFor: 'private'!
status
	^status! !

!ToDoTask class methodsFor: 'instance creation' stamp: ' 7/7/11 21:32'!
new
	
	^super basicNew initialize! !

!ToDoTaskWidget methodsFor: 'view' stamp: 'janko 1/26/2012 21:24'!
build
	self inAddMode ifTrue: [self newTask]. 
	self add: self editElement.! !

!ToDoTaskWidget methodsFor: 'view-edit'!
editElement
	| e mmbrs |
	e := WebElement newDiv class: #'todo-form'.  
	e table width: 1 "100". e cell colspan: 2.
	e cell add: self titleElement; addBreak.
	(e cell addText: 'Name: ') class: #label. (e cell addText: '*') class: #required.
	(e cell addInputFieldAspect: #name for: self task size: 20)
		placeHolder: 'Short task name';
		required;
		onChangePost.
	(e cell addText: 'Description: ') class: #label.
	(e cell addTextAreaAspect: #description for: self task size: 20@2)
		placeHolder: 'What to do';
		onChangePost.
	(e cell addText: 'Deadline: ') class: #label; addBreak.
	(e cell addDateInputFieldAspect: #deadline for: self task) 
		class: #datefield;
		onChangePost.
	e newRow. (e cell addText: 'Members: ') class: #label.
	mmbrs := self membersElement.
	(e cell addNilLinkText: 'edit')
		onClickPopup: self membersEditPopup thenUpdate: mmbrs.
	e cell addBreak; add: mmbrs. e newRow. 
	(e cell addText: '*') class: #required. e cell addTextSmall: ' indicates a required field'.
	e newCell width: 0.5 "50%"; align: #right; add: self formButtons.
	^e! !

!ToDoTaskWidget methodsFor: 'view-edit'!
formButtons
	| e |
	e := WebElement new.
	self inAddMode ifTrue: 
		[(e addButtonText: 'Save') class: #button;
			disableUntilValid;   	"grayed out until all required fields entered"
			onSubmitAnswer: self task;
			onSubmitClose.
		(e addButtonText: 'Cancel') class: #button;
			onSubmitClose].
	self inEditMode ifTrue:  "changes are Ajax posted immediatelly, no need to extra Save button" 
		[(e addButtonText: 'Done') class: #button;
			onSubmitClose].
	^e! !

!ToDoTaskWidget methodsFor: 'testing'!
inAddMode
	^self mode = #add! !

!ToDoTaskWidget methodsFor: 'testing'!
inEditMode
	^self mode = #edit! !

!ToDoTaskWidget methodsFor: 'view-edit'!
membersEditPopup
	| e |
	e := WebElement newDiv class: #('todo-form' 'todo-nowide'). e table width: 1. "100%"
	e cell addTextH1: 'Member selection'.
	e cell addTextSmall: 'Select members to assign to that task. Changes are effective immediatelly.'.
	e cell valign: #top; 
		add: (WebGrid new
			columnNames: #(nil 'Name' );
			columnWidth: #(0.15 nil);
			columnAspects: #(nil nameSurname);
			columnFilters: #(nil 10); 
			collection: (self site securityManager groupNamed: 'ToDo') allUsers;
			column: 1 addBlock: [:user | 
				(WebCheckBox newForObject: user from: self task members) 
					onChangePost];
			rowsOnPage: 10; sortOn: 2;
			yourself).
	(e addButtonText: 'Done') 
		class: #button;
		onSubmitClose.
	^e! !

!ToDoTaskWidget methodsFor: 'view-edit'!
membersElement
	| e |
	e := WebElement new.
	self task membersSorted do: [:member |
		e addText: member name.
		member = self task membersSorted last ifFalse: [e addText: ', '] ].
	^e! !

!ToDoTaskWidget methodsFor: 'private'!
mode
	" #add or #edit "
	^mode! !

!ToDoTaskWidget methodsFor: 'private'!
mode: aSymbol
	" #add or #edit "
	mode := aSymbol! !

!ToDoTaskWidget methodsFor: 'accessing'!
newTask
	"open a new task"
	task := ToDoTask new! !

!ToDoTaskWidget methodsFor: 'accessing'!
task
	"a task we are showing or editing with this widget"
	^task! !

!ToDoTaskWidget methodsFor: 'private'!
task: aToDoTask
	"a task we are showing or editing with this widget"
	task := aToDoTask! !

!ToDoTaskWidget methodsFor: 'view-edit'!
titleElement
	^(WebText text: (self inAddMode
		ifTrue: ['Enter the new task']
		ifFalse: ['Edit the task']) )
			header: 1! !

!ToDoTaskWidget class methodsFor: 'instance creation' stamp: 'janko 1/26/2012 21:26'!
newForAdd
	"for adding a new task"
	^super basicNew
		mode: #add;
		initialize "also build"! !

!ToDoTaskWidget class methodsFor: 'instance creation' stamp: 'janko 1/26/2012 21:25'!
newForEdit: aToDoTask
	"for editing existing task"
	^super basicNew
		mode: #edit;
		task: aToDoTask;
		initialize "also build"! !

!WebUser methodsFor: '*AidaToDoExample' stamp: 'janko 8/6/2011 19:43'!
todoList
	"For AidaToDoExample"
	"a collection of todo tasks per day"
	^self otherAt: #ToDoList ifAbsentPut: [ToDoList newFor: self].! !
ToDoRedirectApp initialize!
