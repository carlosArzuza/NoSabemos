var app;
(function () {
    app = angular.module("myApp", ["ui.bootstrap", 'ngRoute', "ngTable"]);

    app.factory("XLSXReaderService", ['$q', '$rootScope',
    function ($q, $rootScope) {
        var service = function (data) {
            angular.extend(this, data);
        }

        service.readFile = function (file, readCells, toJSON) {
            var deferred = $q.defer();

            XLSXReader(file, readCells, toJSON, function (data) {
                $rootScope.$apply(function () {
                    deferred.resolve(data);
                    console.log(data.sheets);
                });
            });

            return deferred.promise;
        }


        return service;
    }
    ]);


    app.config(['$routeProvider', '$locationProvider',
        function AppConfig($routeProvider, $locationProvider) {
            $routeProvider
                 .when("/home", {
                     templateUrl: 'home.html'
                 })
                .when('/DatosBasicos/Configuracion', {
                    templateUrl: 'DatosBasicos/Configuracion.html',
                    controller: 'ConfiguracionController'
                })
                .when('/DatosBasicos/Confiproc', {
                    templateUrl: 'DatosBasicos/Confiprocompetitivo.html',
                    controller: 'confiprocompetitivoController'
                })
                 .when('/DatosBasicos/Amparos', {
                     templateUrl: 'DatosBasicos/Polizas.html',
                     controller: 'AmparosController'
                 })
                 .when('/DatosBasicos/Aseguradoras', {
                     templateUrl: 'DatosBasicos/Aseguradoras.html',
                     controller: 'AseguradorasController'
                 })
                .when('/DatosBasicos/ProjectManager', {
                    templateUrl: 'DatosBasicos/ProjectManager.html',
                    controller: 'ProManagerController'
                })
                .when('/Proyectos/Proyectos', {
                    templateUrl: 'Proyectos/Proyectos/Proyectos.html',
                    controller: 'ProyectosController'
                })
                 .when('/Proyecto/Detalleproyec', {
                     templateUrl: 'Proyectos/Proyectos/Detalle_Proyec.html',
                     controller: 'ProyectosController'
                 })
                .when('/Proyectos/ProCompetitivo', {
                    templateUrl: 'Proyectos/ProcesoCompetitivo/ProCompetitivo.html',
                    controller: 'ProCompetitivoController'
                })
                .when('/DetalleCompetitivo', {
                    templateUrl: 'Proyectos/ProcesoCompetitivo/Detalle_Procompetitivo.html',
                })
                .when('/DatosBasicos/RegistroVendors', {
                    templateUrl: 'Proyectos/ProcesoCompetitivo/RegistroAspirante.html',
                    controller: 'AspiranteController'
                })
                .when('/OFM/REGOFM', {
                    templateUrl: 'OFM/GestionOFM.html',
                    controller: "Ofertamercantilontroller"

                })
                .when('/OFM/OP', {
                    templateUrl: 'OFM/OP/Ordencompra.html',
                    controller: 'ordencompraController'
                })
                .when('/Notificaciones', {
                    templateUrl: 'Notificaciones/Notificaciones.html',
                    controller: "NotificacionesController"
                })
                .when('/Historial', {
                    templateUrl: 'Historial/Historial.html',
                })
                .otherwise({
                    redirectTo: "/home"
                });;;

        }]);
})();