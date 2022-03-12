import 'dart:async';
import 'dart:io';

import 'package:android_rpc_server/src/handlers/handlers.dart';
import 'package:android_rpc_server/src/router.dart';
import 'package:android_rpc_server/src/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

class AndroidRpcServer {
  static final _cascade = Cascade()
      // Static Handler
      .add(staticHandler)
      // Router
      .add(router);

  static Future<HttpServer> runServer({int? port}) async {
    final runPort = port ?? await getUnusedPort();

    final server = await serve(
      logRequests().addHandler(_cascade.handler),
      InternetAddress.anyIPv4,
      runPort,
    );

    server.autoCompress = true;

    debugPrint('Serving at http://${server.address.host}:${server.port}');

    return server;
  }
}
