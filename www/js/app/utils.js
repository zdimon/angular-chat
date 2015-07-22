utils = {
 
        parse_str: function parse_str(pars,str){
            
            for (var key in pars) {
                var f = str.replace(key,pars[key]);
            }
            return f;

        },

        prepare_url: function prepare_url(str){
            return 'http://'+
                    str.replace('[server]',apiconf.config.signal_server)
                    +'/'+apiconf.config.app_name;

        }

 
}
