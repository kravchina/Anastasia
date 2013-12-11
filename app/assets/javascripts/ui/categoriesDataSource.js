var CategoriesDataSource = function(api, calegoryLoaded) {
    this._api = api;
    this._categoryLoaded = calegoryLoaded;
};

CategoriesDataSource.prototype.data = function(options, callback) {
    this.getCategories(options.id, function(data) {
        this._categoryLoaded(data);
        
        callback({
            data: data
        });
    });
};

CategoriesDataSource.prototype.getCategories = function(categoryId, onComplete) {
    var request = "/category/getCategories";

    if (categoryId != undefined)
        request += "?id=" + categoryId;

    this._api.get(request)
        .success(function(data) {
            var length = data.length,
                elemets = [];

            for (var i = 0; i < length; i++) {
                elemets.push({
                    name: data[i].name,
                    type: 'folder',
                    id: data[i].id
                });
            }

            onComplete(elemets);
        });
};