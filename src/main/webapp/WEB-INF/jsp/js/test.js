var app = angular.module("OnlineQuiz", []);

app.controller("OnlineQuiz", function($scope, $http, $window) 
{
	/*Global variable*/
	$scope.questions = []; // Stores questions
	$scope.loggedInUser = []; // info of logged in user
	$scope.subjectName = 'CERTIFICATION IN HARDWARE NETWORKING';
	$scope.answerMap = []; //This map stores question no and answers given by user
	
	/*Startup Funtions*/
	getLoggedInUserInfo();
	getQuestions(); 
	quizAnalysis();
	
	var UID = {
			_current: 0,
			getNew: function(){
				this._current++;
				return this._current;
			}
		};
	
	HTMLElement.prototype.pseudoStyle = function(element,prop,value){
		var _this = this;
		var _sheetId = "pseudoStyles";
		var _head = document.head || document.getElementsByTagName('head')[0];
		var _sheet = document.getElementById(_sheetId) || document.createElement('style');
		_sheet.id = _sheetId;
		var className = "pseudoStyle" + UID.getNew();
		
		_this.className +=  " "+className; 
		
		_sheet.innerHTML += "\n."+className+":"+element+"{"+prop+":"+value+"}";
		_head.appendChild(_sheet);
		return this;
	};

	
	$scope.optsel = function(btn, answer)
	{
		var no = $(btn.currentTarget).attr('class').split(' ')[1].indexOf('b');
		var queno = $(btn.currentTarget).attr('class').split(' ')[1].substring(0, no);
		
		listopt = ["A","B","C","D"];
		
		for (var i = 0; i < listopt.length; i++) 
		{
			document.getElementsByClassName("span-option "+queno+"spn"+listopt[i])[0].style.background = '#3F729B';
			document.getElementsByClassName("option "+queno+"btn"+listopt[i])[0].pseudoStyle("before","border-bottom-color","#3F729B");
			document.getElementsByClassName("option "+queno+"btn"+listopt[i])[0].pseudoStyle("before","border-top-color","#3F729B");
			document.getElementsByClassName("option "+queno+"btn"+listopt[i])[0].pseudoStyle("after","border-left-color","#3F729B");
		}
		
		document.getElementsByClassName($(btn.target).attr('class'))[0].style.background = '#33b5e5';
		document.getElementsByClassName($(btn.currentTarget).attr('class'))[0].pseudoStyle("before","border-bottom-color","#33b5e5");
		document.getElementsByClassName($(btn.currentTarget).attr('class'))[0].pseudoStyle("before","border-top-color","#33b5e5");
		document.getElementsByClassName($(btn.currentTarget).attr('class'))[0].pseudoStyle("after","border-left-color","#33b5e5");
		
		$scope.answerMap[queno] = answer;
		console.log("li"+queno);
		document.getElementById("li"+queno).childNodes[0].style.backgroundColor = '#00C851';
		document.getElementById("li"+queno).childNodes[0].style.color = 'white';
	}
	
	$scope.saveResult = function()
	{
		var count = 0;
		for(var i=0; i<$scope.questions.length; i++)
		{
			var answer = $scope.answerMap[i+1];
			if($scope.questions[i].answer == '1')
			{	
				var realanswer = $scope.questions[i].optionA;
				if(answer == realanswer)
				count++;
			}
			if($scope.questions[i].answer == '2')
			{	
				var realanswer = $scope.questions[i].optionB;
				if(answer == realanswer)
				count++;
			}
			if($scope.questions[i].answer == '3')
			{	
				var realanswer = $scope.questions[i].optionC;
				if(answer == realanswer)
				count++;
			}
			if($scope.questions[i].answer == '4')
			{	
				var realanswer = $scope.questions[i].optionD;
				if(answer == realanswer)
				count++;
			}
		}
		
		$http
		({
			method : 'POST',
			url : 'https://1-dot-regal-tract-153809.appspot.com/saveMarks',
			data : count,
			withCredentials : "true",
			headers : 
			{
				'Accept' : 'application/json',
				'Access-Control-Allow-Origin' : '*'
			}
		}).then(function successCallback(response) 
		{
			$window.location.href = 'result';
		}, 	function errorCallback(response) 
		{
			console.log(response.statusText);
		});
	}
	
	function getLoggedInUserInfo() 
	{
		$http
		({
			method : 'GET',
			url : 'https://1-dot-regal-tract-153809.appspot.com/quiz/loggedInUser',
			withCredentials : "true",
			headers : 
			{
				'Accept' : 'application/json',
				'Access-Control-Allow-Origin' : '*'
			}
		}).then(function successCallback(response) 
			{
				$scope.loggedInUser = response.data
			}, function errorCallback(response) 
			{
				console.log(response.statusText);
			});
	}
	
	/*This funtions takes subject name as input and return Questions*/
	function getQuestions() 
   	{
		$http(
			{
			    method : 'GET',
			    url : 'https://1-dot-regal-tract-153809.appspot.com/quiz/getQuestions',
			    withCredentials : "true",
			    headers : {
				'Accept' : 'application/json',
				'Access-Control-Allow-Origin' : '*'
			 }}).then( function successCallback(response) {
				 $scope.questions = response.data;
				 $scope.startTime = $scope.questions[0].subject.subjectTimeInMinutes;
				 startTimer();
				 for(var i=0; i<$scope.questions.length; i++)
				{
					$scope.answerMap.push("");
				}
			 }, function errorCallback(response) {
			     console.log(response.statusText);
			});
	 }
	
	/*This function draws graph to shoq quiz analysis*/ 
	 function quizAnalysis()
	 {
		 google.charts.load("current", {packages:["corechart"]});
	     google.charts.setOnLoadCallback(drawChart);
	     function drawChart() 
	     {
	        var data = google.visualization.arrayToDataTable
	        ([
	        	['People Appeared', 'People Cleared Quiz'],
	        	['Appeared', 35],
	        	['Cleared', 21],
	        	['Not Cleared', 14],
	        ]);

	        var options = 
	        {
	        		title: 'Quiz Analysis',
	        		is3D: true,
	        		colors: ['#33b5e5', '#00C851', '#ff4444']
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
	        chart.draw(data, options);
	     }
	 }
	 
	 /*This function is to start timer of quiz*/
	 function startTimer() 
	 {
		 var minutes = $scope.startTime; /*starting no. of minutes*/
		 var target_date = new Date().getTime() + ((minutes * 60 ) * 1000); // set the countdown date
		 var time_limit = ((minutes * 60 ) * 1000);
		 //set actual timer
		 setTimeout
		 (
		 		function() 
		 		{
		 			alert( 'done' );
		 		}, time_limit );

		 	var days, hours, minutes, seconds; // variables for time units

		 	var countdown = document.getElementById("tiles"); // get tag element

		 	getCountdown();

		 	setInterval(function () { getCountdown(); }, 1000);

		 	function getCountdown(){
		 	// find the amount of "seconds" between now and target
		 	var current_date = new Date().getTime();
		 	var seconds_left = (target_date - current_date) / 1000;
		   
		 	if ( seconds_left >= 0 ) 
		 	{
		 		if ( (seconds_left * 1000 ) < ( time_limit / 2 ) )  
		 		{
		 			$( '#tiles' ).removeClass('color-full');
		 			$( '#tiles' ).addClass('color-half');
		 		} 
		 		if ( (seconds_left * 1000 ) < ( time_limit / 4 ) )  
		 		{
		 			$( '#tiles' ).removeClass('color-half');
		 			$( '#tiles' ).addClass('color-empty');
		 		}
		   
		 		days = pad( parseInt(seconds_left / 86400) );
		 		seconds_left = seconds_left % 86400;
		 		 
		 		hours = pad( parseInt(seconds_left / 3600) );
		 		seconds_left = seconds_left % 3600;
		 		  
		 		minutes = pad( parseInt(seconds_left / 60) );
		 		seconds = pad( parseInt( seconds_left % 60 ) );

		 		// format countdown string + set tag value
		 		countdown.innerHTML = "<h3 class='timer'>" + minutes + ":" + seconds + "</h3>"; 
		 	}
		 }

		 function pad(n) 
		 {
		 	return (n < 10 ? '0' : '') + n;
		 }
   
	 }
});