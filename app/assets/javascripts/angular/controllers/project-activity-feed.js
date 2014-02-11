grabnote.controller('ProjectActivityFeed',
  ['$scope', '$http', '$interval', '$location', 'user',
  function($scope, $http, $interval, $location, user) {

    this.newComment = '';
    this.activities = [];
    this.currentUser = user;

    var self = this;
    var poller;

    var startPoller = function() {
      poller = $interval(self.refresh, 5000);
    };
    var stopPoller = function() {
      $interval.cancel(poller);
      poller = null;
    };

    this.refresh = function() {
      $http.get($location.absUrl() + '.json').then(function(project) {
        self.activities =
          self.activities.concat(project.data.activities.slice(self.activities.length));
        if (!poller) {
          startPoller();
        }
      });
    };

    this.addComment = function() {
      $http.post($scope.action + '.json', {
        project_comment: {
          body: this.newComment
        }
      }).then(function() {
        self.newComment = '';
        stopPoller();
        self.refresh();
      });
    };

    this.isComment = function(activity) {
      return activity.trackable_type.contains('Comment');
    };

    this.refresh();
}]);