
(function () {
  'use strict';

 app.factory('GoogleTranslate', ['$http','$rootScope','$log', function($http,$rootScope,$log){


            return {
                        translate: translate
                    }


        function translate(langSource, langTarget, text) {
                    
                    
                    if (text.length > 0) {
                    
                        makeRequest(langSource,langTarget,text).then(function(result){
                               return result.data.data.translations[0].translatedText
                        },function(){
                              alert('Error from google translator! Request is not finished!');
                        });
                        
                        /*
                        $.ajax({
                            url: apiurl + encodeURIComponent(text),
                            dataType: 'jsonp',
                            async: false,
                            success: function (data) {
                                if (langSource === langTarget) {
                                    alert(text);
                                } else if (langSource != "") {
                                   //try {
                                        console.log(data.data.translations[0].translatedText);
                                        $('#'+id+'translated').html(data.data.translations[0].translatedText);  
                                        return String(data.data.translations[0].translatedText);
                                        
                                   // }
                                   // catch (e) {
                                        alert('Error occurred while translating the text');
                                   // }
                                }
                            },
                            error: function (x, e) {
                                alert('Error occurred while translating the text');
                                $.unblockUI();
                            }
                        });
                        */


                        


                    }
        }


            function makeRequest(langSource,langTarget, message) {
                var apiurl = "https://www.googleapis.com/language/translate/v2?key=" + local_config.google_translator_key +"&source=" + langSource + "&target=" + langTarget + "&q=";
                apiurl = apiurl + encodeURIComponent(message);
                return $http.get(apiurl);

            };

    }]);


})();

