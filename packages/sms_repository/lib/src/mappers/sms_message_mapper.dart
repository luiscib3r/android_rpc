import 'package:sms_repository/sms_repository.dart';
import 'package:telephony/telephony.dart';

Message smsMessage2Message(SmsMessage sms) {
  return Message(
    number: sms.address ?? '',
    text: sms.body ?? '',
  );
}
