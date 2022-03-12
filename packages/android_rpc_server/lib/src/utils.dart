import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

final jsonEncoder = JsonUtf8Encoder(' ');

final jsonHeaders = {
  HttpHeaders.contentTypeHeader: 'application/json',
  HttpHeaders.cacheControlHeader: 'public, max-age=604800',
};

Future<int> getUnusedPort() async {
  final socket = await ServerSocket.bind(InternetAddress.anyIPv4, 0);
  final port = socket.port;
  socket.close();
  return port;
}

Future<Map<String, dynamic>> reqJsonBody(Request req) async {
  final content = await req.readAsString();

  return const JsonDecoder().convert(content);
}
