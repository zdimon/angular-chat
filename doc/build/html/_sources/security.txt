Security
========

WebSocketHandler.check_origin


Override to enable support for allowing alternate origins.

The origin argument is the value of the Origin HTTP header, the url responsible for initiating this request. This method is not called for clients that do not send this header; such requests are always allowed (because all browsers that implement WebSockets support this header, and non-browser clients do not have the same cross-site security concerns).

Should return True to accept the request or False to reject it. By default, rejects all requests with an origin on a host other than this one.

This is a security protection against cross site scripting attacks on browsers, since WebSockets are allowed to bypass the usual same-origin policies and don’t use CORS headers.

To accept all cross-origin traffic (which was the default prior to Tornado 4.0), simply override this method to always return true:

.. code-block:: python

    def check_origin(self, origin):
        return True

To allow connections from any subdomain of your site, you might do something like:

.. code-block:: python

    def check_origin(self, origin):
        parsed_origin = urllib.parse.urlparse(origin)
        return parsed_origin.netloc.endswith(".mydomain.com")



