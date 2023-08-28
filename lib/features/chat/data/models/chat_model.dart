import 'package:chatapp/features/chat/domain/entities/chat_entities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel extends ChatEntities {
  const ChatModel({
    required DateTime date,
    required String message,
    required String sender,
    required int type,
  }) : super(
          date: date,
          message: message,
          sender: sender,
          type: type,
        );

  factory ChatModel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;

    return ChatModel(
      sender: docData['sender'],
      date: DateTime.parse(docData['date'].toDate().toString()),
      message: docData['message'],
      type: docData['type'],
    );
  }

  @override
  List<Object?> get props => [date, message];
}
