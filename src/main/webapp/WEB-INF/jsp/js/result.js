var __slice = [].slice;

(function($, window) {
  var Starrr;

  Starrr = (function() {
    Starrr.prototype.defaults = {
      rating: void 0,
      numStars: 5,
      change: function(e, value) {}
    };

    function Starrr($el, options) {
      var i, _, _ref,
        _this = this;

      this.options = $.extend({}, this.defaults, options);
      this.$el = $el;
      _ref = this.defaults;
      for (i in _ref) {
        _ = _ref[i];
        if (this.$el.data(i) != null) {
          this.options[i] = this.$el.data(i);
        }
      }
      this.createStars();
      this.syncRating();
      this.$el.on('mouseover.starrr', 'span', function(e) {
        return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('mouseout.starrr', function() {
        return _this.syncRating();
      });
      this.$el.on('click.starrr', 'span', function(e) {
        return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('starrr:change', this.options.change);
    }

    Starrr.prototype.createStars = function() {
      var _i, _ref, _results;

      _results = [];
      for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
        _results.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"));
      }
      return _results;
    };

    Starrr.prototype.setRating = function(rating) {
      if (this.options.rating === rating) {
        rating = void 0;
      }
      this.options.rating = rating;
      this.syncRating();
      return this.$el.trigger('starrr:change', rating);
    };

    Starrr.prototype.syncRating = function(rating) {
      var i, _i, _j, _ref;

      rating || (rating = this.options.rating);
      if (rating) {
        for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
        }
      }
      if (rating && rating < 5) {
        for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
        }
      }
      if (!rating) {
        return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
      }
    };

    return Starrr;

  })();
  return $.fn.extend({
    starrr: function() {
      var args, option;

      option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return this.each(function() {
        var data;

        data = $(this).data('star-rating');
        if (!data) {
          $(this).data('star-rating', (data = new Starrr($(this), option)));
        }
        if (typeof option === 'string') {
          return data[option].apply(data, args);
        }
      });
    }
  });
})(window.jQuery, window);

$(function() {
  return $(".starrr").starrr();
});

$( document ).ready(function() {
      
  $('#stars').on('starrr:change', function(e, value){
	  alert(value);
  });
  
  $('#stars-existing').on('starrr:change', function(e, value){
	  alert(value);
  });
});

var app = angular.module("result", []);

app.controller("result", function($scope, $http, $window, $location) 
{
	getResult();

	function getResult() 
   	{
		$http(
			{
			    method : 'GET',
			    url : $location.protocol()+'://'+$location.host()+':'+$location.port()+'/Online_Quiz/quiz/getResult',
			    withCredentials : "true",
			    headers : {
				'Accept' : 'application/json',
				'Access-Control-Allow-Origin' : '*'
			 }}).then( function successCallback(response) {
				 $scope.result = response.data;
				 if($scope.result.status == "Cleared")
				 {
					 $scope.msg1 = "Congratulations "+$scope.result.user.fullname+"! ";
					 $scope.msg2 = "You have cleared Brain Booster quiz successfully.";
					 $scope.btnclass = "Green";
					 $scope.emoticon = "data:image/jpeg;base64,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";
				 }
				 else
				 {
					 $scope.msg1 = "Sorry "+$scope.result.user.fullname+"! ";
					 $scope.msg2 = "You failed to clear Brain Booster quiz, you can reappear anytime."
					 $scope.btnclass = "Red";
					 $scope.emoticon = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAooIGJR5lDQaGpr8D7-ydj6ZUolpj-fsbRIEqCE5_zZMPcjbdWw"
				 }
				 
			 }, function errorCallback(response) {
			     console.log(response.statusText);
			});
	 }
	
}); 