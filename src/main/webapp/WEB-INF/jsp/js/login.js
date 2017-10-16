var app = angular.module("Login", []);

app.controller("Login", function($scope, $http, $window, $location) {

	/*This is user object which will be saved once user successfully logged in to application*/
	$scope.user= {};

	/*This method saves user once he successfully logged into application*/
	function saveUser() 
	{
		$http
		({
			method : 'POST',
			url : $location.protocol()+'://'+$location.host()+':'+$location.port()+'/Online_Quiz/loggedInUser',
			data : angular.toJson($scope.user),
			withCredentials : "true",
			headers : 
			{
				'Accept' : 'application/json',
				'Access-Control-Allow-Origin' : '*'
			}
		}).then(function successCallback(response) 
		{
			document.getElementById("loginForm").submit();
			
		}, 	function errorCallback(response) 
		{
			console.log(response.statusText);
		});
	}

	/*Facebook login*/
	$scope.fbLogin = function() 
	{
		FB.init
		({
			appId 	: '1063477887111184', // application id
			status 	: true, // check login status
			cookie 	: true, // enable cookies to allow the server to access the session
			xfbml 	: true  // parse XFBML
		});

		FB.getLoginStatus(function(response) 
		{
			if (response.status == 'connected') 
			{
				getCurrentUserInfo(response)
			} 
			else 
			{
				FB.login(function(response) 
				{
					if (response.authResponse) 
					{
						getCurrentUserInfo(response)
					} 
					else 
					{
						console.log('Auth cancelled.')
					}
				});
			}

		});

		function getCurrentUserInfo() 
		{
			FB.api('/me?fields=name,email,picture', function(userInfo) 
			{
				$scope.user.username = userInfo.name;
				$scope.user.fullname = userInfo.name;
				$scope.user.emailId = userInfo.email;
				$scope.user.designation = "Software Engineer";
				$scope.user.profilePhoto = userInfo.picture.data.url;
				saveUser();
			});
		}
	}
});