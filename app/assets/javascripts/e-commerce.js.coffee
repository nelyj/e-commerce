//= require angular
//= require angular-resource
//= require angular-route
//= require angular-animate
//= require_tree ./angular/controllers
//= require_tree ./angular/services

app = angular.module('E-commerce', ['ngRoute','ngAnimate', 'EffectsService','appCtrl'])


app.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) -> 

	$routeProvider

	.when('/',
		templateUrl: '../assets/index.html',
		controller: 'HomeCtrl'
	).when('/productos/:productId',
		templateUrl: '../assets/show.html',
		controller: 'ShowCtrl'
	).otherwise redirectTo: '/'

	#$locationProvider.html5Mode(true);
]


