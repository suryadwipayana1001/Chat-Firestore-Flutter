import 'package:cloud_firestore/cloud_firestore.dart';

class ChatArgument {
  final int type;
  final String message;
  final Timestamp date;
  final bool isRead;
  final String idUSer;

  ChatArgument({
    this.type = 1,
    required this.date,
    required this.message,
    this.isRead = false,
    required this.idUSer,
  });

  Map<String, dynamic> toMap() => {
        'message': message,
        'date': date,
        'type': type,
        'sender': idUSer,
        'isRead': isRead,
      };
}
