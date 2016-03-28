app.controller('Ofertamercantilontroller', function
    ($scope, ProcompetitivoServices, OfertamercantilServices, AseguradoraService, AmparosService) {

    $scope.Amparos = []; //Listado de Objetos
    $scope.Aseguradoras = [];

    $scope.visibilidadOff = false
    $scope.visibilidadOn = true

    $scope.ON = true
    $scope.OFF = false

    $scope.OFM = {};//Objeto de OFM actual
    $scope.OFMS = []//Listado de Objeto OFM 

    $scope.Proceso = {};//Objeto actual
    $scope.Procesos = [];//Listado de Objetos

    var Polizas = [];///Vector de Polizas creadas

    $scope.filteredOMercantil = []
  , $scope.currentPageOM = 1
  , $scope.numPerPageOM = 10
  , $scope.maxSize = 6;

    initialize();

    $scope.CurrentDate = new Date();//Fecha actual

    loadRecord();
    getAmparos();
    getAseguradoras();
    var archivos = [];


    $scope.Limpiar = function () {
        $scope.Poliza.NO_POLIZA = "";
        $scope.Poliza.FECHA_INI_POL = "";
        $scope.Poliza.COD_POLIZA = "";
        $scope.Poliza.FECHA_FINAL_POL = "";
        $scope.Poliza.ASEGURADORA = "";
        $scope.Poliza.VALOR_POLIZA = "";
        $scope.Poliza.TIPO_POLIZA = "";
        $scope.Poliza.VALOR_ASEGURADO = "";
    }

   
    function getAmparos() {
        var result = AmparosService.getALL();
        result.then(function (dato) {
            $scope.Amparos = dato.data;
            console.log($scope.Amparos);

        },
        function (errorpl) {
            console.log(errorpl)
        });
    }


    function getAseguradoras() {
        var result = AseguradoraService.getALL();
        result.then(function (dato) {
            $scope.Aseguradoras = dato.data;
            console.log($scope.Aseguradoras);

        },
        function (errorpl) {
            console.log(errorpl)
        });
    }



    function initialize() {
        $scope.Proceso = {};
        loadRecordProcoesos();
        $scope.Proceso.ID_COMPETITIVO = "";
        ///objeto Polizas
        $scope.Poliza = {};
        $scope.Poliza.NO_POLIZA = "";
        $scope.Poliza.FECHA_INI_POL = "";
        $scope.Poliza.COD_POLIZA = "";
        $scope.Poliza.FECHA_FINAL_POL = "";
        $scope.Poliza.ASEGURADORA = "";
        $scope.Poliza.VALOR_POLIZA = "";
        $scope.Poliza.TIPO_POLIZA = "";
        $scope.Poliza.VALOR_ASEGURADO = "";
        $scope.Poliza.NOMBRE_ASG = "";
        $scope.Poliza.NOMBRE_AMP = "";

        ///Objeto oferta mercantil
        $scope.OFM.DETALLE_PS = "";
        $scope.OFM = {};
        $scope.OFM.N_OFM = "";
        $scope.OFM.FECHA_SUSCRIP_OFM = "";
        $scope.OFM.FECHA_INIC_OFM = "";
        $scope.OFM.FECHA_FINAL_OFM = "";
        $scope.OFM.VIGENCIA = "";
        $scope.OFM.TITULO_OFM = "";
        $scope.OFM.CONTRATISTA = "";
        $scope.OFM.OBJETO_OFM = "";
        $scope.OFM.LUGRA_EJECUCION_OFM = "";
        $scope.OFM.TIPO_MONEDA = "";
        $scope.OFM.VALOR_ESTIMAO_OFM = "";
        $scope.OFM.VALOR_REAL_OFM = "";
        $scope.OFM.NO_PO = "";
        $scope.OFM.PROC_OFM = "";
        $scope.OFM.VENDOR = "";
    }

    $scope.numPagesOM = function () {
        return Math.ceil($scope.OFMS.length / $scope.numPerPageOM);
    };

    function loadRecordProcoesos() {
        var promiseGet = ProcompetitivoServices.getprocesoAP(); //The Method Call from service
        promiseGet.then(function (pl) {
            $scope.Procesos = pl.data;
        },
           function (errorPl) {
               console.log('Error al cargar los datos almacenados', errorPl);
           });
    }


    function loadRecord() {
        var promiseGet = OfertamercantilServices.getAll(); //The Method Call from service
        promiseGet.then(function (pl) {
            $scope.OFMS = pl.data;

            $scope.$watch('currentPageOM + numPerPageOM', function () {
                var begin = (($scope.currentPageOM - 1) * $scope.numPerPageOM)
                , end = begin + $scope.numPerPageOM;

                $scope.filteredOMercantil = $scope.OFMS.slice(begin, end);
            });
        },
           function (errorPl) {
               console.log('Error al cargar los datos almacenados', errorPl);
           });
    }


    function loadRecordsAspirantes(id) {
        $scope.AspirantesPros = "";
        var promiseGet = ProcompetitivoServices.get(id); //The Method Call from service
        promiseGet.then(function (pl) {
            $scope.AspirantesPros = pl.data;
            console.log("aspir " + $scope.AspirantesPros)
        },
        function (errorPl) {
            console.log('Error al cargar los datos almacenados', errorPl);
        });
    }


    //asigno el nombre del Aseguradora seleccionado 
    $scope.ChangeAseguradora = function () {
        for (var i = 0; i < $scope.Aseguradoras.length; i++) {
            if ($scope.Aseguradoras[i].NOMBRE_ASG == $scope.Poliza.NOMBRE_ASG)
            {
                $scope.Poliza.ASEGURADORA = $scope.Aseguradoras[i].NIT_ASG;
            }
        }
    }

    $scope.ChangeAmparo = function () {
        for (var i = 0; i < $scope.Amparos.length; i++) {
            if ($scope.Amparos[i].NOMBRE_AMP == $scope.Poliza.NOMBRE_AMP) {
                $scope.Poliza.TIPO_POLIZA = $scope.Amparos[i].ID_AMP;
            }
        }
    }

    ///Cargar poliza al array 
    $scope.CargarPoliza = function () {
        Polizas.push($scope.Poliza);
        console.log(Polizas)
        document.getElementById("lispoliza").innerHTML = "";
        var item = "<table class='table table-striped'>";
        for (var i = 0; i < Polizas.length; i++) {
            item += "<tr>";
            item += "<td>" + i + "</td>";
            item += "<td>" + Polizas[i].COD_POLIZA + "</td>";
            item += "<td>" + Polizas[i].FECHA_INI_POL + "</td>";
            item += "<td>" + Polizas[i].FECHA_FINAL_POL + "</td>";
            item += "<td>" + Polizas[i].NOMBRE_ASG + "</td>";
            item += "<td>" + Polizas[i].VALOR_POLIZA + "</td>";
            item += "<td >" + Polizas[i].NOMBRE_AMP + "</td>";
            item += "<td style='text-align: center;'>" + Polizas[i].VALOR_ASEGURADO + "</td>";
            item += "<td></td>";
            item += "<td style='text-align: center'><a href='javasrcritp:;' title='Eliminar Poliza' onclick='angular.element(this).scope().RemoverPoliza(" + i + ");'><i class='fa fa-trash' style='font-size:20px;color:#ED5565;padding:7px;'></i></a></td>";
            item += "</tr>";
        }
        item += "</table>";
        $("#lispoliza").append(item);
        $scope.Poliza = {};

    }

    //Remover elemeto seleccionado del array Polizas
    $scope.RemoverPoliza = function (i) {
        Polizas.splice(i, 1);
        document.getElementById("lispoliza").innerHTML = "";
        var item = "<table class='table table-striped'>";
        console.log(Polizas)
        for (var i = 0; i < Polizas.length; i++) {
            item += "<tr>";
            item += "<td>" + i + "</td>";
            item += "<td>" + Polizas[i].COD_POLIZA + "</td>";
            item += "<td>" + Polizas[i].FECHA_INI_POL + "</td>";
            item += "<td>" + Polizas[i].FECHA_FINAL_POL + "</td>";
            item += "<td>" + Polizas[i].NOMBRE_ASG + "</td>";
            item += "<td>" + Polizas[i].VALOR_POLIZA + "</td>";
            item += "<td style='text-alin:center;'>" + Polizas[i].NOMBRE_AMP + "</td>";
            item += "<td>" + Polizas[i].VALOR_ASEGURADO + "</td>";
            item += "<td></td>";
            item += "<td style='text-align: center'><a href='javasrcritp:;' title='Eliminar Poliza' onclick='angular.element(this).scope().RemoverPoliza(" + i + ");'><i class='fa fa-trash' style='font-size:20px;color:#ED5565;'></i></a></td>";
            item += "</tr>";
        }
        item += "</table>";
        $("#lispoliza").append(item);
    }

    ///Visualizar y cargar archivos a array
    $scope.visualizar = function () {
        document.getElementById("lista").innerHTML = "";
        var files = document.getElementById('files').files;

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
        item += "<th>Tipo</th>";
        item += "<th>Acciones</th>";
        item += "</tr>";
        item += "</thead>";
        //cargando tabla
        for (i = 0; i < archivos.length; i++) {
            item += "<tr>";
            item += "<td>" + parseInt(i + 1) + ".</td>";
            item += "<td>" + archivos[i].file.name + "</td>";
            item += "<td style='font-size:12px'>" + (archivos[i].file.size / (1024 * 1024)).toFixed(2) + " MG</td>";
            item += "<td style='font-size:12px;'>";
            item += "<select class='form-control'>";
            item += "<option></option>";
            item += "<option>Polizas</option>";
            item += "<option>Oferta Mercantil</option>";
            item += "</select>";
            item += "</td>";
            item += '</td>';
            item += '<td>';
            item += '<a href="javasrcritp:;" title="Remover archivo" onclick="angular.element(this).scope().removerArchivo(' + i + ');"><i class="fa fa-trash" style="font-size:20px;color:#ED5565;margin-left:20px"></i></a>';
            item += '</td>';
            item += "</tr>";
        }
        $("#lista").append(item);
        item += '</table>';


    }

    $scope.removerArchivo = function (i) {
        archivos.splice(i, 1);
        document.getElementById("lista").innerHTML = "";
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
            item += "<td style='font-size:12px;'>";
            item += "<select class='form-control'>";
            item += "<option></option>";
            item += "<option>Polizas</option>";
            item += "</select>";
            item += "</td>";
            item += '</td>';
            item += '<td>';
            item += '<a href="javasrcritp:;" title="Remover archivo" onclick="angular.element(this).scope().removerArchivo(' + i + ');"><i class="fa fa-trash" style="font-size:20px;color:#ED5565;margin-left:20px"></i></a>';
            item += '</td>';
            item += "</tr>";
        }
        $("#lista").append(item);
        item += '</table>';
    }

    $scope.Modal = function () { $("#modalprocesos").modal('show'); }

    $scope.Cargar = function () {
        $scope.AspirantesPro = this.AspirantesPro;
        $scope.OFM.CONTRATISTA = $scope.AspirantesPro.ASPIRANTE_ID;
        $scope.OFM.VENDOR = $scope.AspirantesPro.NOM_RAZONSOCIAL;
        console.log($scope.AspirantesPro);
        $scope.OFM.FECHA_FINAL_OFM = "";
        $scope.OFM.VIGENCIA = "";
        $scope.OFM.DETALLE_PS = "";
        $scope.OFM.FECHA_INIC_OFM = "";
        $scope.Proceso = this.Proceso;
        $("#modalprocesos").modal('hide');
        localStorage.setItem("ID_COMPETITIVO", $scope.Proceso.ID_COMPETITIVO);
        $scope.OFM.DETALLE_PS = $scope.Proceso.DETALLE_PS;
        $scope.OFM.FECHA_INIC_OFM = $scope.Proceso.FECHA_INICIO;
        $scope.OFM.VALOR_ESTIMAO_OFM = $scope.Proceso.PRESUPUESTO;
        console.log($scope.Proceso)
        ///calculamos fecha de finalizacion
        var result = new Date($scope.OFM.FECHA_INIC_OFM);
        result.setDate(result.getDate() + $scope.Proceso.TIEMPO_EJECUCION);
        
        ///$scope.OFM.FECHA_FINAL_OFM = ('0' + (result.getDate())).slice(-2) + "/" + ('0' + (result.getMonth() + 1)).slice(-2) + "/" + result.getFullYear();

        $scope.OFM.FECHA_FINAL_OFM = ('0' + (result.getMonth() + 1)).slice(-2) + "/" + ('0' + (result.getDate())).slice(-2) + "/" + result.getFullYear();
        $scope.OFM.VIGENCIA = $scope.Proceso.TIEMPO_EJECUCION;

    }


    ///Metodo para agregar OFM
    $scope.Add = function () {

        $scope.YearAct = $scope.CurrentDate.getFullYear();
        $scope.MesAct = ('0' + ($scope.CurrentDate.getMonth() + 1)).slice(-2);
        $scope.DiaAct = ('0' + $scope.CurrentDate.getDate()).slice(-2);


        var OFM = {}
        var OP = {}
        ID_COMPETITIVO = localStorage.getItem("ID_COMPETITIVO");
        OFM.N_OFM = $scope.OFM.N_OFM;;
        OFM.FECHA_INIC_OFM = $scope.OFM.FECHA_INIC_OFM;
        OFM.FECHA_FINAL_OFM = $scope.OFM.FECHA_FINAL_OFM;
        OFM.VIGENCIA = $scope.OFM.VIGENCIA;
        OFM.TITULO_OFM = $scope.OFM.TITULO_OFM;
        OFM.CONTRATISTA = $scope.OFM.CONTRATISTA;
        OFM.OBJETO_OFM = $scope.OFM.OBJETO_OFM;
        OFM.FECHA_SUSCRIP_OFM = $scope.MesAct + "/" + $scope.DiaAct + "/" + $scope.YearAct;
        OFM.LUGRA_EJECUCION_OFM = $scope.OFM.LUGRA_EJECUCION_OFM;
        OFM.TIPO_MONEDA = $scope.OFM.TIPO_MONEDA;
        OFM.VALOR_ESTIMAO_OFM = $scope.OFM.VALOR_ESTIMAO_OFM;
        OFM.VALOR_REAL_OFM = $scope.OFM.VALOR_REAL_OFM;
        OP.NUMERO_PO = $scope.OFM.NO_PO;
        OFM.PROC_OFM = ID_COMPETITIVO;
        console.log(Polizas)
        var dto = {
            'ofm': OFM,
            'pl': Polizas,
            'po': OP
        };
        if (Polizas.length === 0) {
            swal({
                title: "Mensaje de confirmación",
                text: "¿Esta seguro que desea realizar el registro sin haber cargado polizas de soporte?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Si",
                cancelButtonText: "No",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function (isConfirm) {
                if (isConfirm) {
                    var promiseGet = OfertamercantilServices.post(dto); //The Method Call from service

                    promiseGet.then(function (pl) {
                        if (pl.data === 2) {
                            swal("Mensaje de Notificacion", "A ocurrido un error existe una oferta mercantil con el mismo No de contrato.!", "error");
                        }
                        else {
                            swal("Mensaje de Notificacion", " se ha realizado el registro de manera exítosa.", "success");
                            loadRecord();
                            Polizas = [];
                            archivos = [];
                            $scope.Ocultar();
                            initialize();

                        }

                    },
                       function (errorPl) {
                           console.log('Error al cargar los datos almacenados', errorPl);
                       });

                }
                else {
                    swal("Mensaje de Notificacion", "El proceso de registro no se ha confirmado", "error");
                }
            });
        }
        else {
            var promiseGet = OfertamercantilServices.post(dto); //The Method Call from service
            promiseGet.then(function (pl) {
                if (pl.data === 2) {
                    swal("Mensaje de Notificacion", "A ocurrido un error existe una oferta mercantil con el mismo No de contrato.!", "error");
                }
                else {
                    swal("Mensaje de Notificacion", " se ha realizado el registro de manera exítosa.", "success");
                    loadRecord();
                    $scope.Mostrar();
                }

            },
               function (errorPl) {
                   console.log('Error al cargar los datos almacenados', errorPl);
               });
        }
        console.log(dto);

    }

    $scope.configuracion = function () {
        var OFM = {};
        $scope.OFM.FECHA_FINAL_OFM = "";
        $scope.OFM.VIGENCIA = "";
        $scope.OFM.DETALLE_PS = "";
        $scope.Proceso = this.Proceso;
        $("#modalprocesos").modal('hide');
        localStorage.setItem("ID_COMPETITIVO", $scope.Proceso.ID_COMPETITIVO);
        $scope.OFM.DETALLE_PS = $scope.Proceso.DETALLE_PS;
        OFM.FECHA_INIC_OFM = $scope.OFM.FECHA_INIC_OFM;
        console.log(OFM.FECHA_INIC_OFM)

        ///calculamos fecha de finalizacion
        var result = new Date(OFM.FECHA_INIC_OFM);
        result.setDate(result.getDate() + $scope.Proceso.TIEMPO_EJECUCION);

        $scope.OFM.FECHA_FINAL_OFM = ('0' + (result.getMonth() + 1)).slice(-2) + "/" + ('0' + (result.getDate())).slice(-2) + "/" + result.getFullYear();

        $scope.OFM.VIGENCIA = $scope.Proceso.TIEMPO_EJECUCION;
    }

    $scope.detalle = function () {
        $scope.Proceso = this.Proceso;
        loadRecordsAspirantes($scope.Proceso.ID_COMPETITIVO);

        console.log("id c " + $scope.Proceso.ID_COMPETITIVO);
        $scope.ON = false
        $scope.OFF = true
    }

    $scope.Mostrar = function () {
        $scope.visibilidadOff = true
        $scope.visibilidadOn = false

    }

    $scope.Ocultar = function () {
        $scope.visibilidadOff = false
        $scope.visibilidadOn = true

    }

    $scope.Atras = function () {
        $scope.ON = true
        $scope.OFF = false
    }
});