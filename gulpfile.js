'use strict';

var gulp = require('gulp'),
   $gulp = require('gulp-load-plugins')({lazy: false}),
   concat = require('gulp-concat'),
   uglify = require('gulp-uglify');
   var strip = require('gulp-strip-comments');

/*
    <link rel="stylesheet" href="/chatapp/angular.css">
    <script src="/__HTML/js/lib/angular/angular.min.js"></script>
    <script src="/__HTML/js/lib/angular-ui-router/release/angular-ui-router.min.js"></script>
    <script src="/__HTML/js/lib/restangular/dist/restangular.min.js"></script>
    <script src="/__HTML/js/lib/underscore/underscore-min.js"></script>
    <script src="/__HTML/js/lib/angular-cookies/angular-cookies.js"></script>
    <script src="/__HTML/js/lib/angular-websocket/angular-websocket.js"></script>
    <script src="/__HTML/js/lib/sockjs/sockjs.min.js"></script>
    <script src="/__HTML/js/lib/angular-sanitize/angular-sanitize.min.js"></script>
    <script src="/__HTML/js/lib/swfobject/swfobject/swfobject.js"></script>


    <script src="/Media/js/modernizr.js"></script>
    <script src="/Media/js/jquery-1.11.0.min.js"></script>
    <script src="/Media/js/plugins.js"></script>
    <script src="/Media/js/wysiwyg.js"></script>
    <script src="/Media/js/wysiwyg-editor.js"></script>
    <script src="/Media/js/chat.js"></script>
    <script src="/Media/js/jquery.mCustomScrollbar.js"></script>


*/


var chatVendorLib = [
        '../../marriage-brides.com/Media/js/modernizr.js',
        '../../marriage-brides.com/Media/js/jquery-1.11.0.min.js',
        '../../marriage-brides.com/Media/js/plugins.js',
        '../../marriage-brides.com/Media/js/wysiwyg.js',
        '../../marriage-brides.com/Media/js/wysiwyg-editor.js',
        '../../marriage-brides.com/Media/js/chat.js',
        '../../marriage-brides.com/Media/js/jquery.mCustomScrollbar.js',

    ]




var angularChatLib = [
        './www/js/lib/angular/angular.min.js',
        './www/js/lib/angular-ui-router/release/angular-ui-router.min.js',
        './www/js/lib/restangular/dist/restangular.min.js',
        './www/js/lib/underscore/underscore-min.js',
        './www/js/lib/angular-cookies/angular-cookies.js',
        './www/js/lib/angular-websocket/angular-websocket.js',
        './www/js/lib/angular-sanitize/angular-sanitize.min.js',
        './www/js/lib/swfobject/swfobject/swfobject.js',

    ]

/*
     <script src="/chatapp/app.js"></script>
     <script src="/chatapp/controllers/controllers.js"></script>
     <script src="/chatapp/controllers/roomCtrl.js"></script>
     <script src="/chatapp/controllers/onlineCtrl.js"></script>
     <script src="/chatapp/controllers/contactCtrl.js"></script>
     <script src="/chatapp/controllers/videoCtrl.js"></script>
     <script src="/chatapp/controllers/multiInviteCtrl.js"></script>
     <script src="/chatapp/routers.js"></script>
     <script src="/chatapp/services/Auth.js"></script>
     <script src="/chatapp/services/Online.js"></script>
     <script src="/chatapp/services/Video.js"></script>
     <script src="/chatapp/services/Contact.js"></script>
     <script src="/chatapp/services/google-translator.js"></script>
     <script src="/chatapp/services/Room.js"></script>
     <script src="/chatapp/directives/chat-invitation.js"></script>
     <script src="/chatapp/directives/chat-translator.js"></script>
     <script src="/chatapp/services/websocket.js"></script>
     <script src="/chatapp/utils.js"></script>
     <script src="/chatapp/local_config.js"></script>
     <script src="/api/tpa1com/config.js"></script>
*/

var angularScripts = [
        './www/js/app/app.js',
        './www/js/app/controllers/controllers.js',
        './www/js/app/controllers/roomCtrl.js',
        './www/js/app/controllers/onlineCtrl.js',
        './www/js/app/controllers/contactCtrl.js',
        './www/js/app/controllers/videoCtrl.js',
        './www/js/app/controllers/multiInviteCtrl.js',
        './www/js/app/routers.js',
        './www/js/app/services/Auth.js',
        './www/js/app/services/Online.js',
        './www/js/app/services/Video.js',
        './www/js/app/services/Block.js',
        './www/js/app/services/Contact.js',
        './www/js/app/services/google-translator.js',
        './www/js/app/services/Room.js',
        './www/js/app/directives/chat-invitation.js',
        './www/js/app/directives/chat-translator.js',
        './www/js/app/services/websocket.js',
        './www/js/app/utils.js'
    ]


function vendors_javascript(glob, fileName) {
    return gulp.src(glob)
        //.pipe(strip())
        .pipe(concat(fileName, {newLine: ';'}));
        
}


gulp.task('build', ['main']);

gulp.task('main', [
    'angularScripts',
    'chatVendorLib',
    'angularChatLib'
]);



gulp.task('angularScripts', function () {
    return vendors_javascript(angularScripts, 'angular.scripts.min.js')
        .pipe(strip())
        .pipe(gulp.dest('./www/js/build/'));
});



gulp.task('angularChatLib', function () {
    return vendors_javascript(angularChatLib, 'angular.chat.lib.min.js')
        .pipe(strip())
        .pipe(gulp.dest('./www/js/build/'));
        //.pipe(uglify());
});


gulp.task('chatVendorLib', function () {
    return vendors_javascript(chatVendorLib, 'chat.vendor.lib.min.js')
        .pipe(gulp.dest('./www/js/build/'));
});


