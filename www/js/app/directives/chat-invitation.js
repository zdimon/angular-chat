app.directive('chatInvitation', function() {
    var directive = {};

    directive.restrict = 'E'; /* restrict this directive to elements */

    directive.template = '<div class="but_invite_block"><p class="show">on</p><a class="but_invite" href="#"><span></span></a><p class="">off</p></div>'

    directive.link = function($scope, element, attrs) {
            attrs.$observe('chat_invitation', function(value) {
                //element.find('figcaption').text(value)
                   alert('Checked!');   
                })

                element.click(function() {

                    element.find('a').toggleClass('off');
                    element.find('figcaption')
                    $scope.$apply(function() {
                        $scope.chat_invitation = !$scope.chat_invitation
                    })
                })

            }



    return directive;
});
