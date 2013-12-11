application.controller('HomeContentCtrl', function HomeContentCtrl($scope, apiConnector, $stateParams) {

    console.log($stateParams);

    this.categories = [null];

    var REFRESH_TIME = 60000;
    var treeDataSource = new CategoriesDataSource(apiConnector, categoryLoaded);

    function categoryLoaded(data) {
        console.log(data);
    }

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
/*
    setInterval(getBooks, REFRESH_TIME);
    setInterval(getVideos, REFRESH_TIME);
    setInterval(getArticles, REFRESH_TIME);*/
});

