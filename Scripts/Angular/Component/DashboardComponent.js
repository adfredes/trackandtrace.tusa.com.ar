(app => {
    app.component('dashBoard', {
        templateUrl: 'dashboard.html',
        controller: ['$mdDialog', '$interval', 'xhrService', controller]
    });

    function controller($mdDialog, $interval, xhrService) {
        let vm = this;

        //vm.$onInit = () => {
        //    console.log("init")
        //    checkData();
        //    $interval(checkData, 500000)
        //}

        vm.$onInit = () => {
            checkData();
            $interval(checkData, 500000)
            vm.unidadesNegocios = [];
            vm.labels = ['Azul', 'Verde', 'Amarillo', 'Rojo'];
            vm.series = [];
            vm.data = [];
            vm.options = {
                legend: {
                    display: true,
                    labels: {
                        fontColor: 'rgb(255, 99, 132)'
                    }
                }
            };
        }

        function checkData() {

            xhrService.Post('wsDashboard.asmx/GetItemsDashboard')
                .then(data => {                  

                    data = JSON.parse('[' + data.split('[')[1].split(']')[0] + ']');
                    
                    vm.unidadesNegocios = [];
                    data.forEach(d => {
                        let unidadNegocio = vm.unidadesNegocios.find(element => element.UnidadNegocio === d.UnidadNegocio);
                        if (!unidadNegocio) {
                            unidadNegocio = {
                                UnidadNegocio: d.UnidadNegocio,
                                Azul: 0,
                                Rojo: 0,
                                Verde: 0,
                                Amarillo: 0,
                                valores: []
                            };
                            for (let dias = -10; dias < 31; dias++) {
                                unidadNegocio.valores.push({
                                    UnidadNegocio: d.UnidadNegocio,
                                    Dias: dias,
                                    Cantidad: 0,
                                    FechaArribo: null,
                                    Legajos: []
                                });
                            }
                            vm.unidadesNegocios.push(unidadNegocio);
                        }

                        switch (true) {
                            case d.Dias < -9:
                                unidadNegocio.Azul += d.Cantidad;
                                unidadNegocio.valores[0].Cantidad = unidadNegocio.valores[0].Cantidad + d.Cantidad;
                                break;
                            case d.Dias >= -9 && d.Dias < 0:
                                unidadNegocio.Azul += d.Cantidad;
                                unidadNegocio.valores[d.Dias + 10].FechaArribo = d.FechaArribo;
                                unidadNegocio.valores[d.Dias + 10].Cantidad = d.Cantidad;
                                break;
                            case d.Dias >= 0 && d.Dias < 6:
                                unidadNegocio.Verde += d.Cantidad;
                                unidadNegocio.valores[d.Dias + 10].FechaArribo = d.FechaArribo;
                                unidadNegocio.valores[d.Dias + 10].Cantidad = d.Cantidad;
                                break;
                            case d.Dias >= 6 && d.Dias < 8:
                                unidadNegocio.Amarillo += d.Cantidad;
                                unidadNegocio.valores[d.Dias + 10].FechaArribo = d.FechaArribo;
                                unidadNegocio.valores[d.Dias + 10].Cantidad = d.Cantidad;
                                break;
                            case d.Dias >= 8 && d.Dias < 30:
                                unidadNegocio.Rojo += d.Cantidad;
                                unidadNegocio.valores[d.Dias + 10].FechaArribo = d.FechaArribo;
                                unidadNegocio.valores[d.Dias + 10].Cantidad = d.Cantidad;
                                break;
                            case d.Dias >= 30:
                                unidadNegocio.Rojo += d.Cantidad;
                                unidadNegocio.valores[40].Cantidad = unidadNegocio.valores[40].Cantidad + d.Cantidad;
                                break;
                        }                       
                    });

                    vm.series = [];
                    vm.data = [];
                    vm.unidadesNegocios.forEach(un => {
                        vm.series.push(un.UnidadNegocio);
                        vm.data.push([un.Azul, un.Verde, un.Amarillo, un.Rojo]);
                    });
                    getItemDetails();
                })
                .catch(err => { });


            let getItemDetails = () => {
                xhrService.Post('wsDashboard.asmx/GetItemsDetailsDashboard')
                    .then(data => {

                        data = JSON.parse('[' + data.split('[')[1].split(']')[0] + ']');
                        //vm.unidadesNegocios = [];         

        

                        data.forEach(d => {
                            let unidadNegocio = vm.unidadesNegocios.find(element => element.UnidadNegocio == d.UnidadNegocio);
                            if (unidadNegocio) {
                                switch (true) {
                                    case d.Dias < -9:
                                        unidadNegocio.valores[0].Legajos.push(d);
                                        break;
                                    case d.Dias >= -9 && d.Dias < 30:
                                        unidadNegocio.valores[d.Dias + 10].Legajos.push(d);
                                        break;
                                    case d.Dias >= 30:
                                        unidadNegocio.valores[40].Legajos.push(d);
                                        break;
                                }
                               
                                
                            }
                        });
                    })
                    .catch(err => { console.dir(err) });
            }

        }


    }

})(window.module);