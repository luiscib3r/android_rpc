import 'dart:async';
import 'dart:io';
import 'package:android_rpc_server/src/dependencies.dart';
import 'package:android_rpc_server/src/mappers/mappers.dart';
import 'package:android_rpc_server/src/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:shelf/shelf.dart';

FutureOr<Response> postMessage(Request req) async {
  try {
    final body = await reqJsonBody(req);

    final _repository = container.read(smsRepositoryPod);

    final message = json2Message(body);

    await _repository.sendMessage(message);

    return Response.ok(
      jsonEncoder.convert(body),
      headers: jsonHeaders,
    );
  } catch (e) {
    debugPrint(e.toString());
    return Response(
      HttpStatus.unprocessableEntity,
      body: e.toString(),
    );
  }
}
