import 'dart:async';

import 'package:android_rpc_server/src/dependencies.dart';
import 'package:android_rpc_server/src/mappers/mappers.dart';
import 'package:android_rpc_server/src/utils.dart';
import 'package:shelf/shelf.dart';

FutureOr<Response> getMessages(Request req) async {
  final _repository = container.read(smsRepositoryPod);

  final messages = await _repository.getMessages();

  return Response.ok(
    jsonEncoder.convert(messages.map((e) => message2Json(e)).toList()),
    headers: jsonHeaders,
  );
}
