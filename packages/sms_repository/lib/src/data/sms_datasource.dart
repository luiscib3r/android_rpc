import 'package:sms_repository/src/models/models.dart';

abstract class ISmsDatasource {
  Future<Iterable<Message>> getMessages();

  Future<void> sendSms({
    required String number,
    required String text,
  });
}
