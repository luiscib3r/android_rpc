import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_repository/sms_repository.dart';

class SmsTester extends StatefulWidget {
  const SmsTester({Key? key}) : super(key: key);

  @override
  State<SmsTester> createState() => _SmsTesterState();

  static PageRoute get route => CupertinoPageRoute(
        builder: (context) => const SmsTester(),
      );

  static void open(BuildContext context) => Navigator.push(context, route);
}

class _SmsTesterState extends State<SmsTester> {
  late final ISmsRepository _repository = context.read();

  final numberController = TextEditingController();
  final textController = TextEditingController();

  Iterable<Message>? messages;

  @override
  void initState() {
    super.initState();
    _repository.getMessages().then(
      (value) {
        setState(() {
          messages = value;
        });
      },
    );
  }

  @override
  void dispose() {
    numberController.dispose();
    textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Tester'),
        elevation: 0,
      ),
      body: Column(
        children: [
          TextField(
            controller: numberController,
            decoration: const InputDecoration(
              label: Text('Number'),
            ),
          ),
          TextField(
            controller: textController,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              label: Text('Text'),
            ),
          ),
          CupertinoButton(
            color: Colors.blue,
            child: const Text('Send'),
            onPressed: () {
              final number = numberController.text;
              final text = textController.text;

              final message = Message(number: number, text: text);

              _repository.sendMessage(message);
            },
          ),
          if (messages != null)
            Expanded(
              child: ListView.builder(
                itemCount: messages!.length,
                itemBuilder: (context, index) {
                  final message = messages!.elementAt(index);

                  return ListTile(
                    title: Text(message.number),
                    subtitle: Text(message.text),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
