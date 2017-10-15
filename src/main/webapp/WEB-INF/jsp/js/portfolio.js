var app = angular.module("Portfolio", []);
app.controller("Portfolio", function($scope, $http, $window) 
{
	getLoggedInUserInfo();
	getAllSubjects();
	
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
	
	function getAllSubjects() 
	{
		$http
		({
			method : 'GET',
			url : 'https://1-dot-regal-tract-153809.appspot.com/quiz/getSubjects',
			withCredentials : "true",
			headers : 
			{
				'Accept' : 'application/json',
				'Access-Control-Allow-Origin' : '*'
			}
		}).then(function successCallback(response) 
			{
				$scope.subjects = response.data;
				$scope.subjectString = $scope.subjects[0].subjectName;
				$scope.subdetails($scope.subjectString);
			}, function errorCallback(response) 
			{
				console.log(response.statusText);
			});
	}
	
	$scope.subdetails = function(sub)
	{
		for(var i=0; i<$scope.subjects.length; i++)
		{
			if($scope.subjects[i].subjectName == sub)
			{
				$scope.subjectTotalMarks = $scope.subjects[i].subjectTotalMarks;
				$scope.subjectPassingMarks = $scope.subjects[i].subjectPassingMarks;
				$scope.subjectTimeInMinutes = $scope.subjects[i].subjectTimeInMinutes;
 			}
		}
		saveSubject();
	}
	
	/*This method saves subject selected by user*/
	function saveSubject() 
	{
		$http
		({
			method : 'POST',
			url : 'https://1-dot-regal-tract-153809.appspot.com/selectedsubject',
			data : $scope.subjectString,
			withCredentials : "true",
			headers : 
			{
				'Accept' : 'application/json',
				'Access-Control-Allow-Origin' : '*'
			}
		}).then(function successCallback(response) 
		{
			console.log("Subject saved");
		}, 	function errorCallback(response) 
		{
			console.log(response.statusText);
		});
	}

});

$(document).ready(function () {
	  var navListItems = $('div.setup-panel div a'),
	          allWells = $('.setup-content'),
	          allNextBtn = $('.nextBtn');

	  allWells.hide();

	  navListItems.click(function (e) {
	      e.preventDefault();
	      var $target = $($(this).attr('href')),
	              $item = $(this);

	      if (!$item.hasClass('disabled')) {
	          navListItems.removeClass('btn-primary').addClass('btn-default');
	          $item.addClass('btn-primary');
	          allWells.hide();
	          $target.show();
	          $target.find('input:eq(0)').focus();
	      }
	  });

	  allNextBtn.click(function(){
	      var curStep = $(this).closest(".setup-content"),
	          curStepBtn = curStep.attr("id"),
	          nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
	          curInputs = curStep.find("input[type='text'],input[type='url']"),
	          isValid = true;

	      $(".form-group").removeClass("has-error");
	      for(var i=0; i<curInputs.length; i++){
	          if (!curInputs[i].validity.valid){
	              isValid = false;
	              $(curInputs[i]).closest(".form-group").addClass("has-error");
	          }
	      }

	      if (isValid)
	          nextStepWizard.removeAttr('disabled').trigger('click');
	  });

	  $('div.setup-panel div a.btn-primary').trigger('click');
	});


