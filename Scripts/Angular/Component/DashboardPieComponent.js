(app => {
    app.component('dashboardPie', {
        bindings: {
            items: '<?', chartTitle: '@'
        },
        template: `<div  style="width:50px; height:100%; float:left;"><canvas class="chart chart-pie"
                                chart-data="$ctrl.items" chart-labels="$ctrl.labels"
                                chart-options="$ctrl.options"
                                chart-colors="$ctrl.colors"
                                ng-click="$ctrl.openModal($event)">
                            </canvas></div>`,
        controller: ['$mdDialog', controller]
    });

    function controller($mdDialog) {
        let vm = this;
        vm.options = {
            tooltips: { enabled: false }
        };
        vm.labels = ["Azul","Verde", "Amarillo", "Rojo"];
        vm.colors = ['#0069D9','#6bb16b', '#ffc107', '#dc3545'];

        vm.openModal = (ev) => {
            function DialogController($scope, $mdDialog) {
                $scope.items = vm.items;
                $scope.options = {
                    tooltips: { enabled: true },
                    legend: { display: true }
                };
                $scope.labels = vm.labels;
                $scope.colors = vm.colors;
                $scope.modalTitle = vm.chartTitle;
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
                templateUrl: 'dashboardPieModal.html',
                controller: ['$scope', '$mdDialog', DialogController],
                targetEvent: ev,
                parent: angular.element(document.body),
                clickOutsideToClose: true,
                locals: {
                    items: vm.items,
                    labels: vm.labels,
                    colors: vm.colors,
                    modalTitle: vm.chartTitle
                },
                fullscreen: false
            });


        };
    }
})(window.module);