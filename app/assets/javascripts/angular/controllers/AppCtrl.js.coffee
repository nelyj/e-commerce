appCtrl = angular.module('appCtrl',[])


appCtrl.controller 'HomeCtrl', ['$scope', '$http','localStorageService', ($scope, $http, localStorageService) ->
	$scope.pageClass = 'page-home'

	if localStorageService.get('total_item')?
		numero_show = parseInt(localStorageService.get('total_item'), 10)
		$scope.carro_de_compras = numero_show
	else
		$scope.carro_de_compras = 0

	if $scope.carro_de_compras <= 0
		localStorageService.add('clase_productos','')
		localStorageService.add('existe_producto','hideProduct')
		$scope.showProductos = localStorageService.get('clase_productos')
		$scope.existeProductos = localStorageService.get('existe_producto')
	else 
		localStorageService.add('clase_productos','hideProduct')
		localStorageService.add('existe_producto','')
		$scope.showProductos = localStorageService.get('clase_productos')
		$scope.existeProductos = localStorageService.get('existe_producto')


	$http.get("products.json").success (data) ->
		$scope.products = data
]

appCtrl.controller 'ShowCtrl', ['$scope','$routeParams', '$http', '$location','$rootScope','localStorageService', ($scope,$routeParams, $http, $location,$rootScope,localStorageService) ->
	$scope.items = []

	$scope.pageClass = 'page-show'
	$rootScope.showProductos = ""
	if localStorageService.get('total_item')?
		numero_show = parseInt(localStorageService.get('total_item'), 10)
		$scope.carro_de_compras = numero_show
	else
		$scope.carro_de_compras = 0


	if $scope.carro_de_compras <= 0
			localStorageService.add('clase_productos','')
			localStorageService.add('existe_producto','hideProduct')
			$scope.showProductos = localStorageService.get('clase_productos')
			$scope.existeProductos = localStorageService.get('existe_producto')
		else 
			localStorageService.add('clase_productos','hideProduct')
			localStorageService.add('existe_producto','')
			$scope.showProductos = localStorageService.get('clase_productos')
			$scope.existeProductos = localStorageService.get('existe_producto')

	$scope.click_agregar = ->

		if localStorageService.get('total_item')?
			$scope.aux = localStorageService.get('items')
			$scope.aux.push
				name: $scope.product.name
				description: $scope.product.description
				precio: $scope.product.precio

			localStorageService.add('items', $scope.aux)
			numero = parseInt(localStorageService.get('total_item'), 10)
			$scope.carro_de_compras = numero + 1
			localStorageService.add('total_item', $scope.carro_de_compras)
			console.log localStorageService.get('items')

		else
			$scope.aux = []
			$scope.aux.push
				name: $scope.product.name
				description: $scope.product.description
				precio: $scope.product.precio

			localStorageService.add('total_item', 1)
			localStorageService.add('items', $scope.aux)
			console.log localStorageService.get('items')
			
	
		if $scope.carro_de_compras <= 0
			localStorageService.add('clase_productos','')
			localStorageService.add('existe_producto','hideProduct')
			$scope.showProductos = localStorageService.get('clase_productos')
			$scope.existeProductos = localStorageService.get('existe_producto')
		else 
			localStorageService.add('clase_productos','hideProduct')
			localStorageService.add('existe_producto','')
			$scope.showProductos = localStorageService.get('clase_productos')
			$scope.existeProductos = localStorageService.get('existe_producto')


		if valor 
			$scope.activo = ""
			valor  = false
		else
			$scope.activo = "showUl"
			valor  = true


	$scope.continuar_navegando = ->
			$scope.activo = ""
			valor  = true
			return


	$scope.go = (path) ->
  	$location.path path
  	return

  $scope.add_item = ->
  	$scope.items.push
  		name: $scope.product.name
  		description: $scope.product.description
  		precio: $scope.product.precio


	$http.get('/products/'+$routeParams.productId+'.json').success (data) ->
		$scope.product = data[0]

]
