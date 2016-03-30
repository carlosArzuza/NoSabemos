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
    }

    function loadRecordPolizas() {
        var promiseGet = NotificacionesServices.getAllPolizas(); //The Method Call from service
        promiseGet.then(function (pl) {
            $scope.Polizas = pl.data;

            var miArray = new Array($scope.Polizas.length);
            console.log($scope.Polizas.length);
            /*
            for (i = 0; i < $scope.Polizas.length; i++) {
                fecha = new Date();
                day = fecha.getDate();
                month = fecha.getMonth() + 1;
                year = fecha.getFullYear();

                var hoy = new Date(month + " " + day + " " + year);

                fecha = new Date($scope.Polizas[i].FECHA_FINAL_POL);

                dif = fecha.getTime() - hoy.getTime();
                $scope.dias = Math.floor(dif / (1000 * 60 * 60 * 24));
                console.log($scope.dias);



                miArray[i] = $scope.dias;

                if (miArray[i] <= 30) {
                    console.log("entro")
                    $scope.myStyle = { 'color': 'blue' }
                }
            }
            */
            console.log(miArray);

            angular.forEach($scope.Polizas, function (item, dato) {
                fecha = new Date();
                day = fecha.getDate();
                month = fecha.getMonth() + 1;
                year = fecha.getFullYear();
                
                var hoy = new Date(month + " " + day + " " + year);

                fecha = new Date(item.FECHA_FINAL_POL);

                dif = fecha.getTime() - hoy.getTime();
                $scope.dias = Math.floor(dif / (1000 * 60 * 60 * 24));
                console.log($scope.dias);
                
            });
            //console.log($scope.Polizas);
        },
           function (errorPl) {
               console.log('Error al cargar los datos almacenados', errorPl);
           });
    }


});