application.controller("CategoryNavigatorCtrl", function($scope, apiConnector, $compile) {

    this.holder = undefined;
    this.dropDowns = [];

    this.loadCategory = function(onComplete, categoryId) {
        var request = "/category/getCategories";

        if (categoryId != undefined)
          request += "?id=" + categoryId; 

        apiConnector.get(request).success(onComplete);
    };

    this.selectCategory = function(categoryId, scope)
    {
        this.addCategoryDropDown(categoryId, scope);
    };

    this.addCategoryDropDown = function(categoryId, scope) {

        var templateHTML = categoryId != undefined ? '<category category="' + categoryId + '"></category>' 
                                                   : '<category></category>';
        
        console.log(this.holder);
        var $this = this;
        $compile(templateHTML)(scope, function(clonedElement, scope) {
            var domElement = $this.holder.append(clonedElement);
            clonedElement.hide();
        });
    }

    this.removeCategoryDropDown = function(categoryId) {
        for (var i = 0; i < this.dropDowns.length; i++) {
            var temp = this.dropDowns[i];
            if (temp.id == categoryId)
            {
                i++;
                while (this.dropDowns.length > i)
                {
                    temp = this.dropDowns[i];
                    temp.element.fadeOut(800, function() {
                        this.remove();
                    });

                    this.dropDowns.splice(i, 1);
                }                
            }
        }
    }
});

application.directive('categorynavigator', function() {
    return {
        restrict: 'E',
        replace: true,
        controller: 'CategoryNavigatorCtrl',
        link: function(scope, element, attrs, categoryCtrl) {
            categoryCtrl.holder = element;
            categoryCtrl.addCategoryDropDown(undefined, scope);
        }
    }
});

application.directive('category', function() {
    return {
        restrict: 'E',
        require: '^categorynavigator',
        replace: true,
        scope: {
            category: '='
        },
        link: function(scope, element, attrs, categoryCtrl) {
            var _element = element;

            categoryCtrl.dropDowns.push({id:scope.category, element:element})

            scope.childrenCategories = [];

            scope.openDropDown = function() {
            }

            scope.selectCategory = function(category) {
                categoryCtrl.removeCategoryDropDown(scope.category);
                categoryCtrl.selectCategory(category.id, scope);

                scope.selected = category;
            }

            categoryCtrl.loadCategory(function(data) {
                scope.childrenCategories = data;
                
            }, scope.category);
        },
        templateUrl: 'templates/directives/category.html'
    }
});