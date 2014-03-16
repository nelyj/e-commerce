appCtrl = angular.module('appCtrl',[])


appCtrl.controller 'HomeCtrl', ['$scope', '$http', ($scope, $http) ->
	$scope.pageClass = 'page-home'

	$http.get("products.json").success (data) ->
		$scope.products = data
]

appCtrl.controller 'ShowCtrl', ['$scope','$routeParams', '$http', ($scope,$routeParams, $http) ->
	$scope.pageClass = 'page-show'

	$scope.click_agregar = ->
		console.log "Agregar al carro"

	$http.get('/products/'+$routeParams.productId+'.json').success (data) ->
		$scope.product = data[0]

]
