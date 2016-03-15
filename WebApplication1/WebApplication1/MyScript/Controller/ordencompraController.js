app.controller('ordencompraController', function ($scope,OfertamercantilServices, XLSXReaderService) {

    $scope.ON = true
    $scope.OFF = false

    $scope.OFM = {};//Objeto de OFM actual
    $scope.OFMS = []//Listado de Objeto OFM 

    $scope.Order = {};//Objeto de OFM actual
    $scope.Orders = []//Listado de Objeto OFM 


    function inicialize() {
        $scope.Order.NO_OFM = "";
        $scope.Order.NUMERO_PO = ";"
    }

    $scope.total = $scope.Cantidad * $scope.Punidad;

    $scope.invoice = [];

    $scope.invoice = {
        items: [{
            qty: 10,
            description: 'item',
            cost: 9.95}]
    };

    $scope.addItem = function() {
        $scope.invoice.push({
            qty: 1,
            description: '',
            cost: 0
        });
    },

    $scope.removeItem = function(index) {
        $scope.invoice.splice(index, 1);
    },

    $scope.total = function() {
        var total = 0;
        angular.forEach($scope.invoice, function (invoices) {
            total += invoices.Cantidad * invoices.ValorUnitario;
        })

        return total;
    }

    loadRecord();

    function loadRecord() {
        var promiseGet = OfertamercantilServices.getAll(); //The Method Call from service
        promiseGet.then(function (pl) {
            $scope.OFMS = pl.data;
        },
           function (errorPl) {
               console.log('Error al cargar los datos almacenados', errorPl);
       });
    }

    $scope.getOrder = function (id) {
        var promiseGet = OfertamercantilServices.getAllorder(id); //The Method Call from service
        promiseGet.then(function (pl) {
            $scope.Orders = pl.data;
        },
           function (errorPl) {
               console.log('Error al cargar los datos almacenados', errorPl);
           });
    }

    $scope.Atras = function () {
        $scope.ON = true
        $scope.OFF = false
    }


    $scope.detalle = function () {
        $scope.OFM = this.OFM;
        $scope.ON = false
        $scope.OFF = true
        $scope.getOrder($scope.OFM.N_OFM);
        console.log($scope.OFM)
        localStorage.setItem("NO_OFM", $scope.OFM.N_OFM);
    }

    $scope.Modal = function () {
        $scope.Order = this.Order;
        $("#modalprocesos").modal("show");
    }

    $scope.Cargar = function () {
        $scope.Order = this.Order;
        $scope.Order.NUMERO_PO = $scope.Order.NUMERO_PO;
        $scope.Order.NO_OFM = localStorage.getItem("NO_OFM");
        $("#modalprocesos").modal("hide");
    }


    $scope.showPreview = false;
    $scope.showJSONPreview = true;
    $scope.json_string = "";

    $scope.fileChanged = function (files) {
        $scope.isProcessing = true;
        $scope.sheets = [];
        $scope.excelFile = files[0];
        XLSXReaderService.readFile($scope.excelFile, $scope.showPreview, $scope.showJSONPreview).then(function (xlsxData) {
            $scope.sheets = xlsxData.sheets;
            $scope.isProcessing = false;
            // mi ediciones
            var file_name = document.getElementById("uploadBtn").value;
            console.log("Excel " + $scope.sheets["Orden"]);
        });
    };

    $scope.mensajeError = "Debe seleccionar una hoja valida."
    $scope.mensajeSuccess = "Se han cargado los datos de manera exitosa."

    function Notificacion(mensaje, Accion) {
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
            if (Accion == "error") {
                toastr.error(mensaje, "SAC-Notificaciones");
            } else {
                toastr.success(mensaje, "SAC-Notificaciones");
            }

        }, 1100);
    }

    $scope.EnviarLista = function () {
        // reiniciamos siempre el modal
        try {
            if ($scope.sheets !== undefined) {
                var obj2 = $scope.sheets[$scope.sheet];
                var obj = [];
                if ($scope.sheet == "Orden") {
                    for (var j = 0; j < obj2.length; j++) {
                        if (obj2[j].Producto !== "" && obj2[j].Producto !== null && obj2[j].Producto !== undefined) {
                            obj.push(obj2[j]);
                        }
                    }
                    Notificacion($scope.mensajeSuccess, "success")
                    $scope.invoice = obj;
                } else {

                    Notificacion($scope.mensajeError, "error")
                }


            } else {
                toastr.error("Ha ocurrido un Error.", "SAC-Notificaciones");
            }
        } catch (Exepcion) {
            Notificacion($scope.mensajeError, "error")
        }
    };



});