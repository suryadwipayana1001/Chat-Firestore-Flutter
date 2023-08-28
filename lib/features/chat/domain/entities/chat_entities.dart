import 'package:equatable/equatable.dart';

class ChatEntities extends Equatable {
  final DateTime date;
  final String message, sender;
  final int type;

  const ChatEntities({
    required this.date,
    required this.message,
    required this.sender,
    required this.type,
  });

  @override
  List<Object?> get props => [date, message, sender, type];
}
