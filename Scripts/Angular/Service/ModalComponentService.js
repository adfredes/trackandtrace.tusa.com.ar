(app => {

    app.service("modalComponentService", ['$rootScope', '$mdDialog', modalComponentServiceController]);

    function modalComponentServiceController($rootScope, $mdDialog) {
        var $this = this;
        
        $this.openModal = (ev, name, value)=>{
            let url, title, w75, fullScreen;
            switch (name) {
                case 'DespachoModal':                        
                    title = "Despacho " + value;
                    url = 'ctt_detalle2.aspx?psp=' + value;      
                    w75 = true;  
                    fullScreen = false;
                    break;        
                case 'DespachoItemModal': 
                    title = "Detalle Item";
                    url = 'ctt_items-operacion.aspx?psp=' + value;                                        
                    w75 = true;
                    fullScreen = false;
                    break;    
                case 'DespachoArchivosModal': 
                    title = "Archivos Despacho " + value;
                    url = 'ctt_archivos.html#' + value;    
                    fullScreen = true;
                    break;    
                case 'VisorArchivosModal': 
                    title = "Archivo";
                    url = value;                                        
                    w75 = true;
                    fullScreen = true;
                    ev = document;
                    break;       
                case 'FacturaDespachoModal':
//                    let vFactura = value.split('-')
//                    let factura = `${vFactura[3]}${vFactura[0]}${vFactura[1]}-${vFactura[2]}`;
//                    title = "Factura " + factura;
                    title = 'Factura';
                    //url = 'factura.aspx?psp=' + value;                                        
                    url = value;
                    w75 = true;
                    fullScreen = true;
                    ev = document;
                    break;      
                case 'SimiModal':                        
                    title = "Simi " + value;
                    url = 'ctt_detalle_djai.aspx?psp=' + value;                                        
                    w75 = true;
                    fullScreen = false;
                    break;   
                case 'SfwXmlModal':
                    title = "Reference Code " + value;
                    url = 'sfw_archivos.aspx?ref=' + value;                                        
                    w75 = true;
                    fullScreen = false;
                    break;   
                case 'FacturaReciboModal':                        
                    title = "Factura/Recibo ";
                    url = value;                                        
                    w75 = true;
                    fullScreen = false;
                    break;                                          
                case 'FFModal':                        
                    title = value.title;
                    url = value.value;                                        
                    w75 = true;
                    fullScreen = false;
                    break;                                          
            }           
            openModalView(ev, title, url, w75, fullScreen);
        
        }
                
               
        
        openModalView = (ev, title, url, w75, fullScreen) => {            
            console.log(url);
            let tempscope = $rootScope.$new();
            tempscope.url = url;
            tempscope.titulo = title;
            tempscope.w75 = w75;
//            tempscope.turnoID = turnoID;
//            tempscope.tile = 'TITULO';


            function DialogController($scope, $mdDialog) {
                //$scope.pacienteId = $event.originalEvent.detail.valor;

                $scope.hide = function () {
                    $mdDialog.hide();
                };
                $scope.cancel = function () {                    
                    $mdDialog.cancel();
                };
                $scope.answer = function (answer) {
                    $mdDialog.hide(answer);
                };
            }            

            $mdDialog.show({
                parent: angular.element(document.body),//parent: angular.element(document.body),
                templateUrl: 'modalview.html',
                controller: ['$scope', '$mdDialog', DialogController],
                clickOutsideToClose: true,
                targetEvent: ev,
                fullscreen: false,
                //autoWrap: false,
                scope: tempscope,
                multiple: true
                //preserveScope: true                        
            })
                .then(answer => {
                    success(answer);
                })
                .catch(() => { });
        };
        
        
    }

})(window.module);

        