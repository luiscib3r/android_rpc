import 'dart:io';

import 'package:android_rpc/providers.dart';
import 'package:android_rpc/smstester/smstester.dart';
import 'package:android_rpc_server/android_rpc_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'AndroidRPC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HttpServer? server;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Android RPC'),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: CupertinoButton(
              color: Colors.blue,
              child: const Text('SMS Tester'),
              onPressed: () {
                SmsTester.open(context);
              },
            ),
          ),
          Center(
            child: CupertinoButton(
              color: Colors.red,
              child: const Text('Start server'),
              onPressed: () async {
                final runServer = await AndroidRpcServer.runServer();

                setState(() {
                  server = runServer;
                });
              },
            ),
          ),
          if (server != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                    'Serving at http://${server!.address.host}:${server!.port}'),
              ),
            )
        ],
      ),
    );
  }
}
