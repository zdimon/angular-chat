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
            str = str.replace('[server]',local_config.signal_server)
            str = str.replace('[app_name]',local_config.app_name)
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

function init_wisiwig()
{

 // Featured editor
    $('.cTextDiv').each( function(index, element)
    {
     
        $(element).wysiwyg({
            classes: 'some-more-classes',
            // 'selection'|'top'|'top-selection'|'bottom'|'bottom-selection'
            toolbar: 'top-selection',
            buttons: {
                smilies: {
                    title: 'Smilies',
                    image: '\uf118', // <img src="path/to/image.png" width="16" height="16" alt="" />
                    popup: function( $popup, $button ) {
                            var list_smilies = [
                                    '<img src="Media/smiley/afraid.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/amorous.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/angel.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/angry.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/bored.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/cold.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/confused.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/cross.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/crying.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/devil.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/disappointed.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/dont-know.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/drool.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/embarrassed.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/excited.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/excruciating.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/eyeroll.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/happy.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/hot.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/hug-left.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/hug-right.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/hungry.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/invincible.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/kiss.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/lying.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/meeting.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/nerdy.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/neutral.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/party.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/pirate.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/pissed-off.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/question.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/sad.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/shame.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/shocked.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/shut-mouth.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/sick.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/silent.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/sleeping.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/sleepy.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/stressed.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/thinking.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/tongue.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/uhm-yeah.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/wink.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/working.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/bathing.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/beer.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/boy.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/camera.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/chilli.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/cigarette.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/cinema.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/coffee.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/girl.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/console.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/grumpy.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/in_love.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/internet.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/lamp.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/mobile.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/mrgreen.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/musical-note.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/music.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/phone.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/plate.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/restroom.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/rose.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/search.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/shopping.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/star.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/studying.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/suit.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/surfing.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/thunder.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/tv.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/typing.png" width="16" height="16" alt="" />',
                                    '<img src="Media/smiley/writing.png" width="16" height="16" alt="" />'
                            ];
                            var $smilies = $('<div/>').addClass('wysiwyg-plugin-smilies')
                                                      .attr('unselectable','on');
                            $.each( list_smilies, function(index,smiley) {
                                if( index != 0 )
                                    $smilies.append(' ');
                                var $image = $(smiley).attr('unselectable','on');
                                // Append smiley
                                var imagehtml = ' '+$('<div/>').append($image.clone()).html()+' ';
                                $image
                                    .css({ cursor: 'pointer' })
                                    .click(function(event) {
                                        $(element).wysiwyg('shell').insertHTML(imagehtml); // .closePopup(); - do not close the popup
                                    })
                                    .appendTo( $smilies );
                            });
                            var $container = $(element).wysiwyg('container');
                            $smilies.css({ maxWidth: parseInt($container.width()*0.95)+'px' });
                            $popup.append( $smilies );
                            // Smilies do not close on click, so force the popup-position to cover the toolbar
                            var $toolbar = $button.parents( '.wysiwyg-toolbar' );
                            if( ! $toolbar.length ) // selection toolbar?
                                return ;
                            return { // this prevents applying default position
                                left: parseInt( ($toolbar.outerWidth() - $popup.outerWidth()) / 2 ),
                                top: $toolbar.hasClass('wysiwyg-toolbar-bottom') ? ($container.outerHeight() - parseInt($button.outerHeight()/4)) : (parseInt($button.outerHeight()/4) - $popup.height())
                            };
                           },
                    //showstatic: true,    // wanted on the toolbar
                    showselection: index == 2 ? true : false    // wanted on selection
                },
               
                bold: {
                    title: 'Bold (Ctrl+B)',
                    image: '\uf032', // <img src="path/to/image.png" width="16" height="16" alt="" />
                    hotkey: 'b'
                },
                italic: {
                    title: 'Italic (Ctrl+I)',
                    image: '\uf033', // <img src="path/to/image.png" width="16" height="16" alt="" />
                    hotkey: 'i'
                },
              
                forecolor: {
                    title: 'Text color',
                    image: '\uf1fc' // <img src="path/to/image.png" width="16" height="16" alt="" />
                },
                highlight: {
                    title: 'Background color',
                    image: '\uf043' // <img src="path/to/image.png" width="16" height="16" alt="" />
                },
                
            },
            // Submit-Button
            submit: {
                title: 'Submit',
                image: '\uf00c' // <img src="path/to/image.png" width="16" height="16" alt="" />
            },
            // Other properties
            selectImage: 'Click or drop image',
            placeholderUrl: 'www.example.com',
            placeholderEmbed: '<embed/>',
            maxImageSize: [600,200],
            onKeyDown: function( key, character, shiftKey, altKey, ctrlKey, metaKey ) {
                            // E.g.: submit form on enter-key:
                            //if( (key == 10 || key == 13) && !shiftKey && !altKey && !ctrlKey && !metaKey ) {
                            //    submit_form();
                            //    return false; // swallow enter
                            //}
                        },
            onKeyPress: function( key, character, shiftKey, altKey, ctrlKey, metaKey ) {
                        },
            onKeyUp: function( key, character, shiftKey, altKey, ctrlKey, metaKey ) {
                        },
            onAutocomplete: function( typed, key, character, shiftKey, altKey, ctrlKey, metaKey ) {
                            if( typed.indexOf('@') == 0 ) // startswith '@'
                            {
                                var usernames = [
                                        'Evelyn',
                                        'Harry',
                                        'Amelia',
                                        'Oliver',
                                        'Isabelle',
                                        'Eddie',
                                        'Editha',
                                        'Jacob',
                                        'Emily',
                                        'George',
                                        'Edison'
                                    ];
                                var $list = $('<div/>').addClass('wysiwyg-plugin-list')
                                                       .attr('unselectable','on');
                                $.each( usernames, function( index, username ) {
                                    if( username.toLowerCase().indexOf(typed.substring(1).toLowerCase()) !== 0 ) // don't count first character '@'
                                        return;
                                    var $link = $('<a/>').attr('href','#')
                                                        .text( username )
                                                        .click(function(event) {
                                                            var url = 'http://example.com/user/' + username,
                                                                html = '<a href="' + url + '">@' + username + '</a> ';
                                                            var editor = $(element).wysiwyg('shell');
                                                            // Expand selection and set inject HTML
                                                            editor.expandSelection( typed.length, 0 ).insertHTML( html );
                                                            editor.closePopup().getElement().focus();
                                                            // prevent link-href-#
                                                            event.stopPropagation();
                                                            event.preventDefault();
                                                            return false;
                                                        });
                                    $list.append( $link );
                                });
                                if( $list.children().length )
                                {
                                    if( key == 13 )
                                    {
                                        $list.children(':first').click();
                                        return false; // swallow enter
                                    }
                                    // Show popup
                                    else if( character || key == 8 )
                                        return $list;
                                }
                            }
                        },
            onImageUpload: function( insert_image ) {
                            
                            // Example client script (without upload-progressbar):
                            var iframe_name = 'legacy-uploader-' + Math.random().toString(36).substring(2);
                            $('<iframe>').attr('name',iframe_name)
                                         .load(function() {
                                            // <iframe> is ready - we will find the URL in the iframe-body
                                            var iframe = this;
                                            var iframedoc = iframe.contentDocument ? iframe.contentDocument :
                                                           (iframe.contentWindow ? iframe.contentWindow.document : iframe.document);
                                            var iframebody = iframedoc.getElementsByTagName('body')[0];
                                            var image_url = iframebody.innerHTML;
                                            insert_image( image_url );
                                            $(iframe).remove();
                                         })
                                         .appendTo(document.body);
                            var $input = $(this);
                            $input.attr('name','upload-filename')
                                  .parents('form')
                                  .attr('action','/script.php') // accessing cross domain <iframes> could be difficult
                                  .attr('method','POST')
                                  .attr('enctype','multipart/form-data')
                                  .attr('target',iframe_name)
                                  .submit();
                        },
            forceImageUpload: false,    // upload images even if File-API is present
            videoFromUrl: function( url ) {
                // Contributions are welcome :-)

                // youtube - http://stackoverflow.com/questions/3392993/php-regex-to-get-youtube-video-id
                var youtube_match = url.match( /^(?:http(?:s)?:\/\/)?(?:[a-z0-9.]+\.)?(?:youtu\.be|youtube\.com)\/(?:(?:watch)?\?(?:.*&)?v(?:i)?=|(?:embed|v|vi|user)\/)([^\?&\"'>]+)/ );
                if( youtube_match && youtube_match[1].length == 11 )
                    return '<iframe src="//www.youtube.com/embed/' + youtube_match[1] + '" width="640" height="360" frameborder="0" allowfullscreen></iframe>';

                // vimeo - http://embedresponsively.com/
                var vimeo_match = url.match( /^(?:http(?:s)?:\/\/)?(?:[a-z0-9.]+\.)?vimeo\.com\/([0-9]+)$/ );
                if( vimeo_match )
                    return '<iframe src="//player.vimeo.com/video/' + vimeo_match[1] + '" width="640" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>';

                // dailymotion - http://embedresponsively.com/
                var dailymotion_match = url.match( /^(?:http(?:s)?:\/\/)?(?:[a-z0-9.]+\.)?dailymotion\.com\/video\/([0-9a-z]+)$/ );
                if( dailymotion_match )
                    return '<iframe src="//www.dailymotion.com/embed/video/' + dailymotion_match[1] + '" width="640" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>';

                // undefined -> create '<video/>' tag
            }
        })
        .change(function() {
            if( typeof console != 'undefined' )
                ;//console.log( 'change' );
        })
        .focus(function() {
            if( typeof console != 'undefined' )
                ;//console.log( 'focus' );
        })
        .blur(function() {
            if( typeof console != 'undefined' )
                ;//console.log( 'blur' );
        });
    });


    var isNODE;

    function getCaretPosition(editableDiv) {
        var caretPos = 0,
            sel, range;
        if (window.getSelection) {
            sel = window.getSelection();
            if ( !! sel.anchorNode) {
                isNODE = sel.baseNode;
            }
            if (sel.rangeCount) {
                range = sel.getRangeAt(0);
                if (range.commonAncestorContainer.parentNode == editableDiv) {
                    caretPos = range.endOffset;
                }
            }
        } else if (document.selection && document.selection.createRange) {
            range = document.selection.createRange();
            if (range.parentElement() == editableDiv) {
                var tempEl = document.createElement("span");
                editableDiv.insertBefore(tempEl, editableDiv.firstChild);
                var tempRange = range.duplicate();
                tempRange.moveToElementText(tempEl);
                tempRange.setEndPoint("EndToEnd", range);
                caretPos = tempRange.html.length;
            }
        }
        return caretPos;
    }

$('#chat_content').find(".cTextDiv").keyup(function(event) {
    
    if (event.keyCode == 13) {
        $('#chat_content').find(".message_block .send").click();
    }
});



}






    
