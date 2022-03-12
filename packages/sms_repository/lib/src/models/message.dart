import 'package:equatable/equatable.dart';

class Message extends Equatable {
  const Message({
    required this.number,
    required this.text,
  });

  final String number;
  final String text;

  @override
  List<Object?> get props => [
        number,
        text,
      ];
}
