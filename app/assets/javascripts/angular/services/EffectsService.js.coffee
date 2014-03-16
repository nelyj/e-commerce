effectService = angular.module('EffectsService',[])

effectService.directive "scroll", ($window) ->
  (scope, element, attrs) ->
    angular.element($window).bind "scroll", ->
      if @pageYOffset >= 10
        scope.boolChangeClass = true
      else
        scope.boolChangeClass = false
      scope.$apply()
      return

    return
