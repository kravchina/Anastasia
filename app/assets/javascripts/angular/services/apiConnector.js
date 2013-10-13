application.factory('apiConnector', function ($http, notificationDispatcher) {

        var request = function (method, url, entity, parameters) {

        var response = {};

        response._successFn = function (data, status, headers, config) { };

        response.success = function (fn) { this._successFn = fn; };

        response._errorFn = function (data, status, header, config) { };

        response.error = function (fn) { this._errorFn = fn; };

        $http({
            method: method,
            url: '/api' + url,
            params: parameters,
            data: entity,
            headers: { 'Content-Type': 'application/json' }
        })
            .success(function (data, status, headers, config) {
                response._successFn(data, status, headers, config);
            })
            .error(function (data, status, headers, config) {
                notificationDispatcher.danger({ message: 'An error has occurred. Please try again later' });

                response._errorFn(data, status, headers, config);
            });

        return response;
    };

    return {
        get: function (url, parameters) {
            return request('GET', url, null, parameters);
        },

        post: function (url, entity) {
            return request('POST', url, entity, null);
        },

        put: function (url, entity) {
            return request('PUT', url, entity, null);
        },

        remove: function (url, entity) {
            return request('DELETE', url, entity, null);
        }
    };
});