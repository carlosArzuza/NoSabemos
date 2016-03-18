app.controller('AseguradorasController', function ($scope, AseguradoraService) {

    $scope.Aseguradora = {}; //Objeto Actual
    $scope.Aseguradoras = []; //Listado de Objetos

    var lisAseguradoras=[];
    var lisaseguradoras=[];
    Inicialize();
    getAseguradoras();

    function Inicialize() {
        $scope.Aseguradora = {}; //Objeto Actual
        $scope.Aseguradora.NIT_ASG = "";
        $scope.Aseguradora.NOMBRE_ASG = "";
    }

    $scope.Limpiar = function () {
        $scope.Aseguradora = {};
        getAseguradoras();
    }

    function getAseguradoras() {
        var result = AseguradoraService.getALL();
        result.then(function (dato)
        {
            $scope.Aseguradoras = dato.data;
            console.log($scope.Aseguradoras);

        },
        function (errorpl) {
            console.log(errorpl)
        });
    }


    $scope.Add = function () {
        var aseguradora = {};
        $("#guaradar").attr("disabled", true);
        aseguradora.NOMBRE_ASG = $scope.Aseguradora.NOMBRE_ASG;
        aseguradora.NIT_ASG= $scope.Aseguradora.NIT_ASG;
        aseguradora.ESTADO_ASG = 0;

        var result = AseguradoraService.post(aseguradora);
        result.then(function () {
            setTimeout(function () {
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "progressBar": false,
                    "preventDuplicates": false,
                    "positionClass": "toast-bottom-full-width",
                    "onclick": null,
                    "showDuration": "400",
                    "hideDuration": "1000",
                    "timeOut": "7000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.success("Se realizado el registro de manera exitosa.", "Notificaciones");

            }, 1100);
            getAseguradoras();
            $("#guaradar").attr("disabled", false);
            $("#myModal4").modal("hide");
        },
        function (errorpl) {
            console.log(errorpl)
        });


    };

    //Function Para Actualizar
    $scope.update = function (id) {
        var aseguradora = {};
        aseguradora.NOMBRE_ASG = $scope.Aseguradora.NOMBRE_ASG;
        aseguradora.NIT_ASG = $scope.Aseguradora.NIT_ASG;
        aseguradora.ESTADO_ASG = 0;
        var promisePost = AseguradoraService.put(id, aseguradora);
        promisePost.then(function (d) {
            setTimeout(function () {
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "progressBar": false,
                    "preventDuplicates": false,
                    "positionClass": "toast-bottom-full-width",
                    "onclick": null,
                    "showDuration": "400",
                    "hideDuration": "1000",
                    "timeOut": "7000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.success("Datos actualizados de manera exitosa.", "Sistema de Notificaciones");

            }, 1200);
            $('#ModalEditar').modal('hide');
            getAseguradoras();
        }, function (err) {
            alert("Some Error Occured " + JSON.stringify(err));
        });
    };

    $scope.Detalle = function () {
        $scope.Aseguradora = this.Aseguradora;
        console.log($scope.Aseguradora);
        $("#ModalEditar").modal("show");
    }

});