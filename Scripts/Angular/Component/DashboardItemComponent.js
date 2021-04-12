(app => {

    app.component('dashboardItem', {
        templateUrl: 'dashboarditemcomponent.html',
        controller: ['xhrService', '$mdDialog', controller],
        bindings: {
            item: '<?'
        }
    });

    function controller(xhrService, $mdDialog) {
        let vm = this;

        vm.openModal = (ev) => {
            function DialogController($scope, $mdDialog) {
                $scope.item = vm.item;
                $scope.hide = function () {
                    $mdDialog.hide();
                };
                $scope.cancel = function () {
                    $mdDialog.hide();
                };
                $scope.answer = function () {
                    $mdDialog.hide();
                };

                $scope.openModalOperacion = (ev, legajo) => {
                    function DialogController($scope, $mdDialog) {
                        $scope.despacho = legajo.Despacho;
                        $scope.hide = function () {
                            $mdDialog.hide();
                        };
                        $scope.cancel = function () {
                            $mdDialog.hide();
                        };
                        $scope.answer = function () {
                            $mdDialog.hide();
                        };
                    }

                    $mdDialog.show({
                        //parent: parentEl,
                        templateUrl: 'dashboarddespachomodal.html',
                        controller: ['$scope', '$mdDialog', DialogController],
                        targetEvent: ev,
                        parent: angular.element(document.body),
                        clickOutsideToClose: true,
                        multiple: true,
                        locals: {
                            despacho: legajo.Despacho
                        },
                        fullscreen: false
                    });
                    //ctt_detalle2.aspx?psp=20001IC05002776M

                }

                $scope.openModalCarpeta = (ev, legajo) => {
                    function DialogController($scope, $mdDialog) {
                        $scope.referencia = legajo.Identificador;
                        $scope.id = legajo.Id;
                        $scope.hide = function () {
                            $mdDialog.hide();
                        };
                        $scope.cancel = function () {
                            $mdDialog.hide();
                        };
                        $scope.answer = function () {
                            $mdDialog.hide();
                        };
                    }

                    $mdDialog.show({
                        //parent: parentEl,
                        templateUrl: 'dashboardcarpetamodal.html',
                        controller: ['$scope', '$mdDialog', DialogController],
                        targetEvent: ev,
                        parent: angular.element(document.body),
                        clickOutsideToClose: true,
                        multiple: true,
                        locals: {
                            referencia: legajo.Identificador,
                            id: legajo.Id
                        },
                        fullscreen: false
                    });
                    //ctt_detalle2.aspx?psp=20001IC05002776M

                }
            }

            $mdDialog.show({
                //parent: parentEl,
                templateUrl: 'dashboardmodal.html',
                controller: ['$scope', '$mdDialog', DialogController],
                targetEvent: ev,
                parent: angular.element(document.body),
                clickOutsideToClose: true,
                multiple: true,
                locals: {
                    item: vm.item
                },
                fullscreen: false
            });


        };


    }
})(window.module);