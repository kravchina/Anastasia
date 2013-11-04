application.directive("panel", function(){
  return {
    restrict: 'E',
    transclude: true,
    scope: {
      title: "@"
    },
    // template: "{{title}}"
    template: "<div class='panel-content'><div class='panel-header'>{{title}}</div><div ng-transclude></div></div>"
  }
})