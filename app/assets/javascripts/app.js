

var application = angular.module('application', ['ui.router']);

application.config(function($stateProvider, $routeProvider, $urlRouterProvider){
    $urlRouterProvider.otherwise("/index");

    $stateProvider
        .state('index', {
            url: "/index",
            views: {
                "contentView": {
                    templateUrl: "/templates/index/content.html",
                    controller: "HomeIndexCtrl"
                },
                "sidebarView": {
                    templateUrl: "/templates/index/sidebar.html",
                    controller: "SideBarCtrl"
                }
            }
        });
});