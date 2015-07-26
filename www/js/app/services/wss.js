var transports = ['websocket', 'xhr-streaming' ,'iframe-eventsource', 'iframe-htmlfile' , 'xhr-polling', 'iframe-xhr-polling', 'jsonp-polling'];
var conn = new SockJS('http://localhost:8888/ws', transports);





conn.onmessage = function(e) {

    var obj = JSON.parse(e.data);

    }

   
       

conn.onclose = function() {
    console.log('Disconnected.');
    conn = null;
}
conn.onopen = function() {
    console.log('Connected.');

}


