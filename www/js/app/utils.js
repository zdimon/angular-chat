utils = {
 
        parse_str: function parse_str(pars,str){
            
            for (var key in pars) {
                var f = str.replace(key,pars[key]);
            }
            return f;

        },

        prepare_url: function prepare_url(str,lst){
            for (var key in lst) {
                str = str.replace(key,lst[key])
            }
            str = str.replace('[server]',apiconf.config.signal_server)
            str = str.replace('[app_name]',apiconf.config.app_name)
            url = 'http://'+str
            return url


        }

 
}

function scroolldown(){

    var scrH = 0;

    $('#chat_content').find('.live_write').each(function(index, el) {
        scrH = scrH + $(this).outerHeight(true);
    });

    $('#chat_content').find('.ms_bar').stop().animate({
        scrollTop: scrH
    }, 3);

    $('#chat_content').find('.ms_bar').mCustomScrollbar("scrollTo", 'bottom');
        

    
}
