import 'package:sms_repository/src/data/data.dart';
import 'package:sms_repository/src/models/models.dart';

abstract class ISmsRepository {
  Future<Iterable<Message>> getMessages();

  Future<void> sendMessage(Message message);
}

class SmsRepository implements ISmsRepository {
  SmsRepository({
    required this.smsDatasource,
  });

  final ISmsDatasource smsDatasource;

  @override
  Future<Iterable<Message>> getMessages() async {
    return smsDatasource.getMessages();
  }

  @override
  Future<void> sendMessage(Message message) async {
    await smsDatasource.sendSms(
      number: message.number,
      text: message.text,
    );
  }
}
