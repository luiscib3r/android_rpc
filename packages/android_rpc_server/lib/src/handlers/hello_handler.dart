import 'dart:async';

import 'package:android_rpc_server/src/utils.dart';
import 'package:shelf/shelf.dart';

FutureOr<Response> helloHandler(Request req) async {
  return Response.ok(
    jsonEncoder.convert({
      'message': 'Hello World!',
    }),
    headers: jsonHeaders,
  );
}
