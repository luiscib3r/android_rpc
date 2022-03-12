import 'package:riverpod/riverpod.dart';
import 'package:sms_repository/sms_repository.dart';

final container = ProviderContainer();

final smsDatasourcePod = Provider<ISmsDatasource>(
  (ref) => TelephonyDatasource(),
);

final smsRepositoryPod = Provider<ISmsRepository>(
  (ref) => SmsRepository(
    smsDatasource: ref.read(smsDatasourcePod),
  ),
);
