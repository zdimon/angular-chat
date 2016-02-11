
(function () {
  'use strict';

 app.factory('GoogleTranslate', ['$http','$rootScope','$log','$q', function($http,$rootScope,$log, $q){


            return {
                        translate: translate,
                        save_translate: save_translate
                    }


        function translate(langSource, langTarget, text) {
                    var deferredObject = $q.defer();
                    
                    if (text.length > 0) {
                    
                        makeRequest(langSource,langTarget,text).then(function(result){
                               deferredObject.resolve(result.data.data.translations[0].translatedText);
                       
                        },function(errorMsg){
                              deferredObject.reject('Error from google translator! Request is not finished!');
                        });

                    }
                    return deferredObject.promise;
        }


        function save_translate(message,translation) {
            
            var url = utils.prepare_url(apiconf.api.save_translation.url,{'[app_name]':local_config.app_name});
            var data = {"message_id": message.message.id, "translation": translation}
            $.ajax({
              type: "POST",
              url: url,
              data: data
            });
        }


            function makeRequest(langSource,langTarget, message) {
                var apiurl = "https://www.googleapis.com/language/translate/v2?key=" + local_config.google_translator_key +"&source=" + langSource + "&target=" + langTarget + "&q=";
                apiurl = apiurl + encodeURIComponent(message);
                return $http.get(apiurl);

            };

    }]);


})();

