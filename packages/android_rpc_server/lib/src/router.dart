import 'package:android_rpc_server/src/handlers/handlers.dart';
import 'package:shelf_router/shelf_router.dart';

final router = Router()
  ..get('/hello', helloHandler)
  ..get('/messages', getMessages)
  ..post('/message', postMessage);
