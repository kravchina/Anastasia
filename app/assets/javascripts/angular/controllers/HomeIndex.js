application.controller('HomeIndexCtrl', function HomeIndexCtrl($scope, apiConnector) {

    apiConnector
        .get('/index/getBooks')
        .success(function(data){
            $scope.books = data;
        });

    apiConnector
        .get('/index/getVideos')
        .success(function(data){
            $scope.videos = data;
        });

    apiConnector
        .get('/index/getArticles')
        .success(function(data){
            $scope.articles = data;
        });


})
  