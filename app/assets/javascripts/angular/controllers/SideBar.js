application.controller("SideBarCtrl", function SideBarCtrl($scope, apiConnector) { 
  var treeDataSource = new DataSource(apiConnector);
  $('#MyTree').tree({dataSource: treeDataSource});
});

var DataSource = function(api) {
  this._api = api;
};

DataSource.prototype = {
  data: function(options, callback) {
    this.getCategories(options.id, function(data) {
            callback({data:data});
         });
  },

  getCategories: function(categoryId, onComplete) {
    var request = "/category/getCategories";

    if (categoryId != undefined)
      request += "?id=" + categoryId;

    this._api.get(request)
             .success(function(data) {
                var length = data.length,
                    elemets = [];

                for (var i = 0; i < length; i++) {
                  elemets.push({name:data[i].name, type:'folder', id:data[i].id});
                }

                onComplete(elemets);
             });
  }
};