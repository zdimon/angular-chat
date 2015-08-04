app.directive('chatTranslate', function() {
    var directive = {};

    directive.restrict = 'E'; /* restrict this directive to elements */

    directive.template = '<div class="but_invite_block"><p class="show">Translator</p><a class="but_invite off" href="#"><span></span></a></div>'

    directive.link = function($scope, element, attrs) {


                element.click(function() {

                    element.find('a').toggleClass('off');

                    $scope.$apply(function() {
                        $scope.chat_translate = !$scope.chat_translate
                    })
                })

            }



    return directive;
});
