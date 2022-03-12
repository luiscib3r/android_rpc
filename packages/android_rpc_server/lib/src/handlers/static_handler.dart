import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:mime/mime.dart';
import 'package:shelf/shelf.dart';

FutureOr<Response> staticHandler(Request req) async {
  var fileName = req.url.path;

  if (fileName.isEmpty) {
    fileName = 'index.html';
  }

  try {
    final data = await rootBundle.load(
      'packages/android_rpc_server/static/$fileName',
    );

    final mimeType = lookupMimeType(fileName);

    return Response.ok(
      data.buffer.asUint8List(),
      headers: {
        HttpHeaders.contentTypeHeader: mimeType ?? '',
      },
    );
  } catch (e) {
    debugPrint(e.toString());
    return Response.notFound('Not found');
  }
}
