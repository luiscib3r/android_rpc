import 'package:sms_repository/src/data/data.dart';
import 'package:sms_repository/src/models/message.dart';
import 'package:sms_repository/src/mappers/mappers.dart';
import 'package:telephony/telephony.dart';

/// Use telephony package to send sms
class TelephonyDatasource implements ISmsDatasource {
  final telephony = Telephony.instance;

  @override
  Future<void> sendSms({
    required String number,
    required String text,
  }) async {
    await telephony.sendSms(to: number, message: text);
  }

  @override
  Future<Iterable<Message>> getMessages() async {
    final messages = await telephony.getInboxSms();

    return messages.map((e) => smsMessage2Message(e));
  }
}
