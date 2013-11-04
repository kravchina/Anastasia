

var application = angular.module('application', ['ui.router']);

application.config(function($stateProvider, $routeProvider, $urlRouterProvider){
    $urlRouterProvider.otherwise("/home");

    $stateProvider
        .state('index', {
            templateUrl: "/templates/index/home.html",
            controller: "HomeCtrl"
        })
        .state('index.home', {
            url: "/home",
            views: {
                "contentView": {
                    templateUrl: "/templates/index/content.html",
                    controller: "HomeContentCtrl"
                }
            }
        })
        .state('index.search', {
            url : '/search/category/{category}/language/{language}/level/{level}',
            views : {
                "contentView": {
                    templateUrl: "/templates/index/content.html",
                    controller: "HomeContentCtrl"
                }
            }
        })
        .state('index.video', {
            url : '/video/:id',
            views : {
                "contentView": {
                    templateUrl: "/templates/video/video.html",
                    controller: "VideoCtrl"
                }
            }
        });
});