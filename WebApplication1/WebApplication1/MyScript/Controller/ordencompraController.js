app.controller('ordencompraController', function ($scope, OfertamercantilServices, XLSXReaderService,AspiranteServices,ContactosServices,OrdencompraServices) {

    $scope.ON = true
    $scope.OFF = false

    $scope.Contacto = {};
    $scope.Contactos = [];

    $scope.OFM = {};//Objeto de OFM actual
    $scope.OFMS = []//Listado de Objeto OFM 

    $scope.Order = {};//Objeto de OFM actual
    $scope.Orders = []//Listado de Objeto OFM 
    var EJECUTADO = 0;
    function inicialize() {
    
        $scope.Order.NO_OFM = "";
        $scope.Order.NUMERO_PO = "";
        $scope.Order.EJECUTADO = "";
        $scope.Order.DISPONIBLE = "";
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

    var Ejecutado = function (ofm) {
        var promiseGet = OrdencompraServices.getEjecutado(ofm); //The Method Call from service
        promiseGet.then(function (pl) {
            angular.forEach(pl.data, function (item, i) {
                EJECUTADO = (parseFloat(EJECUTADO) + parseFloat(item.TOTAL_PO));
            });
            $scope.Order.EJECUTADO = EJECUTADO;
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
        $scope.Order.VALOR_ESTIMAO_OFM = $scope.OFM.VALOR_ESTIMAO_OFM;
        $scope.Order.TIPO_MONEDA = $scope.OFM.TIPO_MONEDA;
        localStorage.setItem("PADRE", $scope.OFM.CONTRATISTA);
        localStorage.setItem("MONEDA", $scope.Order.TIPO_MONEDA);
        Listcontactos($scope.OFM.CONTRATISTA);
        Ejecutado($scope.Order.NO_OFM);
        $scope.Order.DISPONIBLE =parseFloat($scope.Order.VALOR_ESTIMAO_OFM) - parseFloat(EJECUTADO);

        $("#modalprocesos").modal("hide");
    }

    $scope.contacto = {};

    $scope.showPreview = false;
    $scope.showJSONPreview = true;
    $scope.json_string = "";

    $scope.mensajeError = "Debe seleccionar una hoja valida.";
    $scope.mensajeErrorHoja = 'No existe una hoja llamada \"Orden\" en el libro seleccionado';
    $scope.mensajeSuccess = "Se han cargado los datos de manera exitosa.";

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

    var Listcontactos = function (aspirantes) {

        var promiseGet = AspiranteServices.getAllContactos(aspirantes); //The Method Call from service
        promiseGet.then(function (pl) {
            $scope.Contactos = pl.data;
            console.log($scope.Contactos);
        },
           function (errorPl) {
               console.log('Error al cargar los datos almacenados', errorPl);
        });
        
    }

    $scope.Addcontac = function () {
        var contac = {};
        contac =
        {
            'contacto': $scope.contacto,
            'padre': localStorage.getItem("PADRE"),
        };
        console.log(contac)
        var promise = ContactosServices.post(contac); //The Method Call from service
        promise.then(function (pl) {
            var result = pl.data;
            if (result === 0)
            {
                Notificacion("se ha eccedido el numero maximo de contactos permintidos", "error")
            }
            else
            {
                if (result === 1) {
                    Notificacion("Contacto creado de manera exitosa", "success");
                    Listcontactos(localStorage.getItem("PADRE"));
                }
            }
        },
           function (errorPl) {
            console.log('Error al cargar los datos almacenados', errorPl);
           });
    }

    $scope.fileChanged = function (files) {
        $scope.isProcessing = true;
        $scope.sheets = [];
        $scope.excelFile = files[0];
        XLSXReaderService.readFile($scope.excelFile, $scope.showPreview, $scope.showJSONPreview).then(function (xlsxData) {
            $scope.sheets = xlsxData.sheets;
            if ($scope.sheets["Orden"] === undefined) {
                Notificacion($scope.mensajeErrorHoja, "error");
                $scope.btnG = false;
            } else {
                $scope.btnG = true;
                $scope.isProcessing = false;
                // mi ediciones
                var file_name = document.getElementById("uploadBtn").value;
                console.log("Excel " + $scope.sheets["Orden"]);
            }
            
        });
    };

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