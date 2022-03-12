import 'package:provider/provider.dart';
import 'package:sms_repository/sms_repository.dart';

final providers = [
  // Sms Datasource
  Provider<ISmsDatasource>(
    create: (context) => TelephonyDatasource(),
  ),
  // Sms Repository
  Provider<ISmsRepository>(
    create: (context) => SmsRepository(
      smsDatasource: context.read(),
    ),
  ),
];
