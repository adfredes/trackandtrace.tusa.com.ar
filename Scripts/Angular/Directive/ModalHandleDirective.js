(app => {

    app.directive('modalHandle', ['modalComponentService', function (modalComponentService) {
        return {
            restrict: 'A',
            link: function (scope, elm, attrs) {
                
                elm.on('openmodalangular', $event =>                     
                    modalComponentService.openModal($event, $event.detail.name, $event.detail.value)
                );
                


                
            }
        };
    }]);


})(window.module);

        