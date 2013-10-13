
application.controller('NotificationCtrl', function NotificationCtrl($scope, notificationDispatcher) {
    $scope.notifications = [];

    notificationDispatcher.successReceive(function (notification) {
        $scope.notifications.push({
            type: 'success',
            message: notification.message
        });
    });

    notificationDispatcher.infoReceive(function (notification) {
        $scope.notifications.push({
            type: 'info',
            message: notification.message
        });
    });

    notificationDispatcher.warningReceive(function (notification) {
        $scope.notifications.push({
            type: 'warning',
            message: notification.message
        });
    });

    notificationDispatcher.dangerReceive(function (notification) {
        $scope.notifications.push({
            type: 'danger',
            message: notification.message
        });
    });
})