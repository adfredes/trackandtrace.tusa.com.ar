(app => {

    app.service('xhrService', ['$http', '$q', controller]);
    function controller($http, $q) {
        let vm = this;

        vm.Get = (_url) => {
            return executeHttp(
                $http({
                    method: 'GET',
                    url: _url,
                    headers: { 'Content-Type': "application/json; charset=utf-8" }
                })
            );
        };

        vm.GetHTML = (_url) => {
            return executeHttp(
                $http({
                    method: 'GET',
                    url: _url,
                    datatype: 'html'
                })
            );
        };

        vm.Post = (_url, data) => {
            return executeHttp(
                $http({
                    method: 'Post',
                    url: _url,
                    data: JSON.stringify(data),
                    datatype: 'json'
                })
            );
        };

        vm.Put = (_url, data) => {
            return executeHttp(
                $http({
                    method: 'PUT',
                    url: _url,
                    data: JSON.stringify(data),
                    datatype: 'json'
                })
            );
        };

        vm.Delete = (_url) => {
            return executeHttp(
                $http({
                    method: 'DELETE',
                    url: _url
                })
            );
        };

        let executeHttp = (http) => {
            let defered = $q.defer();
            let promise = defered.promise;
            http.then(
                function (response) { defered.resolve(response.data); },
                function (err) { defered.reject(err); }
            );
            return promise;
        }

    }

})(window.module);