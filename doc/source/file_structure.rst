File structure
==============

.. uml::

    @startsalt
    {
    {T
        + <&folder>djapp
        ++ <&folder>chat
        ++ <&folder>utils
        ++ <&folder>templates
        ++ <&folder>djapp
        ++ <&folder>static
        ++ <&file>manage.py
        + <&folder>ws
        ++ <&folder>brukva
        ++ <&file> socketserver.py
        ++ <&file> processor.py
        + <&folder>www
        + <&file> bower.json
        + <&file> requirements.txt
        + <&file> test.sh
        + <&file> test_ws.sh
        + <&file> ws.sh
        + <&file> .bowerrc

    }
    }
    @endsalt
