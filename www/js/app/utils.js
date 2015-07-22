utils = {
 
        parse_str: function parse_str(pars,str){
            
            for (var key in pars) {
                var f = str.replace(key,pars[key]);
            }
            return f;

        },

        prepare_url: function prepare_url(str){
            str = str.replace('[server]',apiconf.config.signal_server)
            str = str.replace('[app_name]',apiconf.config.app_name)
            url = 'http://'+str
            return url

        }

 
}
