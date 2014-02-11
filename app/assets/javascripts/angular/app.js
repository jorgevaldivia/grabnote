var grabnote = angular.module('grabnote', ['ui.bootstrap', 'ngAnimate']);

grabnote.factory('csrf', ['$window', function($window) {
  var param = $('meta[name=csrf-param]').attr('content');
  var token = $('meta[name=csrf-token]').attr('content');
  return {
    param: param,
    token: token
  };
}]);

grabnote.factory('user', ['$window', function($window) {
  return angular.copy($window.currentUser);
}]);

grabnote.config(['$httpProvider', function($httpProvider) {
  $httpProvider.interceptors.push(['$q', 'csrf', function($q, csrf) {
    return {
      'request': function(config) {
        config.headers['X-CSRF-TOKEN'] = csrf.token;
        return config || $q.when(config);
      }
    };
  }]);
}]);