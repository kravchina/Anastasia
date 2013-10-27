application.controller('HomeIndexCtrl', function HomeIndexCtrl($scope, apiConnector) {

    var REFRESH_TIME = 60000;

    function getBooks() {
        apiConnector.get('/index/randomBooks')
                    .success(function(data) {
                        $scope.books = data;
                    });
    };

    function getVideos() {
        apiConnector.get('/index/getVideos')
                    .success(function(data) {
                        $scope.videos = data;
                    });
    };

    function getArticles() {
        apiConnector.get('/index/getArticles')
                    .success(function(data) {
                        $scope.articles = data;
                    });
    };

    getBooks();
    getVideos();
    getArticles();

    setInterval(getBooks, REFRESH_TIME);
    setInterval(getVideos, REFRESH_TIME);
    setInterval(getArticles, REFRESH_TIME);
});

