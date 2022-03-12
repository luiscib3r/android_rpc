# AndroidRPC

## Notas iniciales

Después iré mejorando esto, la idea es ejecutar acciones en el móvil a través de una API. De momento he implementado una API REST usando shelf, posteriormente se implementará una API gRPC.

Acciones que puede ejecutar actualmente:

* Obtener lista de sms almacenados en el móvil.
* Enviar sms

Ah, la documentación: Le das al botón de start server (el que sale en rojo), eso levanta un servidor en un puerto aleatorio escuchando por todas las IP que tenga el móvil, los endpoint son `GET /messages` devuelve todos los sms que tienes en el movil, `POST /message` con `body` `{"number": "555555", "text": "Tu texto"}` eso envia un sms al numero 555555 con el texto `Tu texto`.

Si quieres que siempre levante en el mismo puerto le pasas el parámetro `port` a la función `runServer` está por ahí en el `main.dart`. 

Es una app sencilla ya luego se va mejorando de momento resuelve el problema de mandar sms de forma remota.

## Initial Notes

Later I will improve this, the idea is to execute actions on the mobile through an API. At the moment I have implemented a REST API using shelf, later a gRPC API will be implemented.

Actions you can currently run:

* Get list of sms stored in the phone.
* Send SMS

Ah, the documentation: You hit the start server button (the one that appears in red), that starts a server on a random port listening for all the IPs that the mobile has, the endpoints are `GET /messages` it returns all the sms that you have on your mobile, `POST /message` with `body` `{"number": "555555", "text": "Your text"}` that sends an sms to the number 555555 with the text `Your text`.

If you want it to always run on the same port you pass the `port` parameter to the `runServer` function, it's somewhere in the `main.dart`.

It is a simple app and then it improves at the moment it solves the problem of sending sms remotely.
