
application.factory('notificationDispatcher', function () {
    var dispatcher = {};

    dispatcher._successFn = function() {};
    dispatcher._infoFn = function() {};
    dispatcher._warningFn = function() {};
    dispatcher._dangerFn = function() {};

    return {
        success: function (notification) {
            dispatcher._successFn(notification);
        },

        successReceive: function (fn) {
            dispatcher._successFn = fn;
        },

        info: function (notification) {
            dispatcher._infoFn(notification);
        },

        infoReceive: function (fn) {
            dispatcher._infoFn = fn;
        },

        warning: function (notification) {
            dispatcher._warningFn(notification);
        },

        warningReceive: function (fn) {
            dispatcher._warningFn = fn;
        },

        danger: function (notification) {
            dispatcher._dangerFn(notification);
        },

        dangerReceive: function (fn) {
            dispatcher._dangerFn = fn;
        }
    };
});
