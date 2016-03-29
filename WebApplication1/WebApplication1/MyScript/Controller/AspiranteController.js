app.controller('AspiranteController', function ($scope, AspiranteServices, XLSXReaderService) {
    $scope.Asp = {}; //Objeto Actual
    $scope.Aspirantes = []; //Listado de Objetos
    $scope.editMode = false; // Modo de Edición
    
    var vendor;

    $scope.ON = true
    $scope.OFF = false

    $scope.filteredVendors = []
  , $scope.currentPage = 1
  , $scope.numPerPage = 8
  , $scope.maxSize = 6;

    $scope.Mostrar = function () {
        $scope.ON = false
        $scope.OFF = true
    }

    $scope.Ocultar = function () {
        $scope.ON = true
        $scope.OFF = false
    }

    archivos = [];
    
    var file;

    inicialice();

    loadRecords();

    $scope.Limpiar = function () {
        $scope.Asp = {};
    }

    $scope.numPages = function () {
        return Math.ceil($scope.Aspirantes.length / $scope.numPerPage);
    };

    function loadRecords() {
        var promiseGet = AspiranteServices.getAll(); //The Method Call from service
        promiseGet.then(function (pl) {
            $scope.Aspirantes = pl.data;
            $scope.$watch('currentPage + numPerPage', function () {
                var begin = (($scope.currentPage - 1) * $scope.numPerPage)
                , end = begin + $scope.numPerPage;

                $scope.filteredVendors = $scope.Aspirantes.slice(begin, end);
            });

        },
        function (errorPl) {
            $log.error('Error al cargar los datos almacenados', errorPl);
        });
    }

    function inicialice() {
        $("#loading").hide();
        $scope.Asp.VENDORID = "";
        $scope.Asp.EMPRESA = "";
        $scope.Asp.CORREO = "";
        $scope.Asp.DIRECCION = "";
        $scope.Asp.CUIDAD = "";
        $scope.Asp.DEPARTAMENTO = "";
        $scope.Asp.TELEFONO = "";
        $scope.Asp.CONTACTO_1 = "";
        $scope.Asp.CONTACTO_2 = "";
        $scope.Asp.CONTACTO_3 = "";
        $scope.Asp.CONTACTO_4 = "";
    }
    
    $scope.Add = function () {
        var aspirante = {};

        aspirante.VENDORID = $scope.Asp.VENDORID;
        aspirante.EMPRESA = $scope.Asp.EMPRESA;
        aspirante.CORREO = $scope.Asp.CORREO;
        aspirante.DIRECCION = $scope.Asp.DIRECCION;
        aspirante.CIUDAD = $scope.Asp.CIUDAD;
        aspirante.DEPARTAMENTO = $scope.Asp.DEPARTAMENTO;
        aspirante.TELEFONO = $scope.Asp.TELEFONO;
        
        var result = AspiranteServices.post(aspirante);
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
                toastr.success("Se realizado el registro de manera exitosa.", "SAC-Notificaciones");

            }, 1100);
            loadRecords();
        },
        function (errorpl) {
            console.log(errorpl)
        });
    };

    $scope.Edit = function () {
        $scope.Asp = this.Asp;
        $scope.editMode = true;
        $('#ModalEditar').modal('show');
    }

    //Function Para Actualizar
    $scope.update = function () {
        var aspirante = {};

        aspirante.ASPIRANTE_ID = $scope.Asp.ASPIRANTE_ID;
        aspirante.NIT = $scope.Asp.NIT;
        aspirante.EMPRESA = $scope.Asp.EMPRESA;
        aspirante.CORREO = $scope.Asp.CORREO;
        aspirante.DIRECCION = $scope.Asp.DIRECCION;
        aspirante.CIUDAD = $scope.Asp.CIUDAD;
        aspirante.DEPARTAMENTO = $scope.Asp.DEPARTAMENTO;
        aspirante.TELEFONO = $scope.Asp.TELEFONO;

        var promisePost = AspiranteServices.put(aspirante.ASPIRANTE_ID, aspirante);
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
                toastr.success("Datos actualizados de manera exitosa.", "SAC-Notificaciones");

            }, 1200);
            $('#ModalEditar').modal('hide');
            loadRecords();
        }, function (err) {
            alert("Some Error Occured " + JSON.stringify(err));
        });
    };
        
    $scope.visualizar = function () {
        document.getElementById("lista").innerHTML = "";
        var files = document.getElementById('files').files;
        //var archivos = new FormData();
        //var item = "";
        for (i = 0; i < files.length; i++) {
            file = files[i];
            archivos.push({ 'id': i, 'file': file });
        }
        var item = "<table class='table table-striped'>";
        item += "<thead>";
        item += "<tr>";
        item += "<th></th>";
        item += "<th>Nombre de archivo</th>";
        item += "<th>Tamaño</th>";
        item += "<th>Acciones</th>";
        item += "</tr>";
        item += "</thead>";
        //cargando tabla
        for (i = 0; i < archivos.length; i++) {
            item += "<tr>";
            item += "<td>" + parseInt(i + 1) + ".</td>";
            item += "<td>" + archivos[i].file.name + "</td>";
            item += "<td style='font-size:12px'>" + (archivos[i].file.size / (1024 * 1024)).toFixed(2) + " MG</td>";
            item += '</td>';
            item += '<td>';
            item += '<a href="javasrcritp:;" title="Remover archivo" onclick="angular.element(this).scope().Removeritem(' + i + ');"><i class="fa fa-trash" style="font-size:20px;color:#ED5565;margin-left:20px"></i></a>';
            item += '</td>';
            item += "</tr>";
        }
        $("#lista").append(item);
        item += '</table>';


    }

    $scope.Cargartodo = function () {
        alert('aa')
        var files = $("#files").get(0).files;
        var data = new FormData();
        for (i = 0; i < files.length; i++) {
            data.append("file" + i, files[i]);
        }
        
        $.ajax({
            type: "POST",
            url: "/api/listap",
            contentType: false,
            processData: false,
            data: data,
            success: function (result) {
                if (result) {
                    console.log('Archivos subidos correctamente');
                } else {
                    alert(result)
                }
            }
        });
        
    }

    $scope.cancel = function () {
        console.log($scope.editMode);
        if (!$scope.editMode) {
            inicialice();
        }
        $('#ModalEditar').modal('hide');
        $scope.editMode = false;
        inicialice();
    };

    $scope.showPreview = false;
    $scope.showJSONPreview = true;
    $scope.json_string = "";

    $scope.mensajeError = "Debe seleccionar una hoja valida.";

    $scope.mensajeErrorHoja = 'No existe una hoja llamada \"Vendors\" en el libro seleccionado';

    $scope.mensajeSuccess = "Se ha realizado el registro de manera exitosa.";

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

    $scope.btnG = false;


    $scope.fileChanged = function (files) {
        $("#loading").show();
        $scope.isProcessing = true;
        $scope.sheets = [];
        $scope.excelFile = files[0];

        XLSXReaderService.readFile($scope.excelFile, $scope.showPreview, $scope.showJSONPreview).then(function (xlsxData) {

            $scope.sheets = xlsxData.sheets;
            if ($scope.sheets["Vendors"] === undefined) {
                Notificacion($scope.mensajeErrorHoja, "error");
                $scope.btnG = false;
            }else {
                $scope.btnG = true;
            }
            $scope.isProcessing = false;
            // mi ediciones
            var file_name = document.getElementById("uploadBtn").value;
            vendor = JSON.stringify($scope.sheets["Vendors"]);
            $("#loading").hide();
        });
    };

    $scope.EnviarLista = function () {
        
        $("#guardar").attr('disabled', true)
        $("#loading").show();
        console.log(vendor)
        AspiranteServices.post(vendor).then(function () {
            loadRecords();
            Notificacion($scope.mensajeSuccess, "success");
            $("#loading").hide();
            $("#guardar").hide();},
             function (errorpl) {console.log(errorpl)});          
    };

    
    

});