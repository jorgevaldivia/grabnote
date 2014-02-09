grabnote.directive('gnRailsForm', ['csrf', function(csrf) {
  return {
    link: function(scope, elem, attrs) {
      scope.csrf = csrf.token;
      scope.action = attrs.action;
    }
  };
}]);