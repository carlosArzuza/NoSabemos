app.controller('NotificacionesController', function ($scope, NotificacionesServices) {
    $scope.Poliza = {}; //Objeto Actual
    $scope.Polizas = []; //Listado de Objetos

    inicialice();

    loadRecordPolizas();

    function inicialice() {
        $scope.Poliza = {};
        $scope.Poliza.NO_POLIZAS = "";
        $scope.Poliza.COD_POLIZA = "";
        $scope.Poliza.FECHA_INI_POL = "";
        $scope.Poliza.FECHA_FINAL_POL = "";
        $scope.Poliza.ASEGURADORA = "";
        $scope.Poliza.VALOR_POLIZA = "";
        $scope.Poliza.TIPO_POLIZA = "";
        $scope.Poliza.VALOR_ASEGURADO = "";
        $scope.Poliza.OFERTAMERCANTIL = "";
        $scope.Poliza.Notificacion = "";
    }

    function loadRecordPolizas() {
        var promiseGet = NotificacionesServices.getAllPolizas(); //The Method Call from service
        promiseGet.then(function (pl) {
            $scope.Polizas = pl.data;

            angular.forEach($scope.Polizas, function (item, dato) {

                function restaFechas(f1, f2) {
                    var aFecha1 = f1.split('/');
                    var aFecha2 = f2.split('/');
                    var fFecha1 = Date.UTC(aFecha1[2], aFecha1[1] - 1, aFecha1[0]);
                    var fFecha2 = Date.UTC(aFecha2[2], aFecha2[1] - 1, aFecha2[0]);
                    console.log("fFecha1 " + fFecha1)
                    console.log("fFecha2 " + fFecha2)
                    var dif = fFecha2 - fFecha1;
                    var dias = Math.floor(dif / (1000 * 60 * 60 * 24));
                    return dias;
                }

                fecha = new Date();
                day = fecha.getDate();
                month = fecha.getMonth() + 1;
                year = fecha.getFullYear();

                console.log("Fecha actual: " + day + "/" + month + "/" + year);

                var f1 = day + "/" + month + "/" + year;
                var f2 = item.FECHA_FINAL_POL;
                //var f2 = '28/3/2016';

                console.log("fecha " + f2);
                console.log("resta " + restaFechas(f1, f2));
                
            });
            //console.log($scope.Polizas);
        },
           function (errorPl) {
               console.log('Error al cargar los datos almacenados', errorPl);
           });
    }

    fecha = new Date();
    day = fecha.getDate();
    month = fecha.getMonth() + 1;
    year = fecha.getFullYear();

    var d = new Date(month + " " + day + " " + year);


    console.log(d)

    
    /*
    function restar(days) {
        
        fecha = new Date();
        day = fecha.getDate();
        month = fecha.getMonth() + 1;
        year = fecha.getFullYear();

        console.log("Fecha actual: " + day + "/" + month + "/" + year);


        tiempo = fecha.getTime();
        milisegundos = parseInt(days * 24 * 60 * 60 * 1000);
        total = fecha.setTime(tiempo + milisegundos);
        day = fecha.getDate();
        month = fecha.getMonth() + 1;
        year = fecha.getFullYear();

        console.log("Fecha modificada: " + day + "/" + month + "/" + year);

    }
    restar(-45);*/

});