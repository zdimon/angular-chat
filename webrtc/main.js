function hasUserMedia() {
return !!(navigator.getUserMedia || navigator.webkitGetUserMedia
|| navigator.mozGetUserMedia || navigator.msGetUserMedia);
}

if (hasUserMedia()) {
navigator.getUserMedia = navigator.getUserMedia ||
navigator.webkitGetUserMedia || navigator.mozGetUserMedia ||
navigator.msGetUserMedia;

var constraints = {
video: {
        mandatory: {
        minWidth: 480,
        minHeight: 320,
        maxWidth: 1024,
        maxHeight: 768
        }
    },
    audio: true
    };



navigator.getUserMedia(constraints, function
(stream) {
var video = document.querySelector('video');
var canvas = document.querySelector('canvas');
video.src = window.URL.createObjectURL(stream);



document.querySelector('#capture').addEventListener('click',
function (event) {

    canvas.width = video.clientWidth;
    canvas.height = video.clientHeight;
    var context = canvas.getContext('2d');
    context.drawImage(video, 0, 0);
    
});

}, function (err) {});
} else {
alert("Sorry, your browser does not support video.");
}





