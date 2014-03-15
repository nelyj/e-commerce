appCtrl = angular.module('appCtrl',[])


appCtrl.controller 'HomeCtrl', ['$scope', '$http', ($scope, $http) ->
	$scope.pageClass = 'page-home'

	$http.get("products.json").success (data) ->
		$scope.products = data
]

appCtrl.controller 'ShowCtrl', ['$scope','$routeParams', '$http', ($scope,$routeParams, $http) ->
	$scope.pageClass = 'page-show'

	$http.get('/products/'+$routeParams.productId+'.json').success (data) ->
		$scope.product = data
]
