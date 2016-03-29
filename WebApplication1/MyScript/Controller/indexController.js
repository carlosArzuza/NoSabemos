app.controller('indexController', function ($scope,$http) {

    var uri = "http://localhost:49372";
    $scope.cerrarsesion = function () {
        $http.post(uri + 'api/Security');
    }

});