import 'package:sms_repository/sms_repository.dart';

Map<String, dynamic> message2Json(Message message) => {
      'number': message.number,
      'text': message.text,
    };

Message json2Message(Map<String, dynamic> json) => Message(
      number: json['number'] as String,
      text: json['text'] as String,
    );
