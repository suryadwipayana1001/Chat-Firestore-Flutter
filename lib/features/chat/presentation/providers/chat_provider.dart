import 'package:chatapp/core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../data/models/chat_argument.dart';
import '../../domain/usecase/send_chat.dart';
import 'chat_state.dart';

class ChatProvider with ChangeNotifier {
  final SendChat sendChat;
  ChatProvider({
    required this.sendChat,
  });
  //Initial
  TextEditingController _messageController = TextEditingController();
  //id user yang login
  String _meId = "1";
  //id lawan chat
  String _youId = "2";

  //Getter
  TextEditingController get messageController => _messageController;
  String get meId => _meId;
  String get youId => _youId;

  Stream<ChatState> sendMesssage(idRoomChat) async* {
    //parameter id nanti di hapus pas di pradiyum
    yield ChatLoading();
    ChatArgument data = ChatArgument(
        date: Timestamp.now(),
        message: _messageController.text,
        idUSer: meId,
        isRead: false);
    //romId diisi _meId dan _youId
    final result = await sendChat!.call(message: data, roomId: idRoomChat);
    yield* result.fold(
      (l) async* {
        printError("error provider $l");
        yield ChatFailure(failure: l);
      },
      (r) async* {
        yield ChatSended(data: r);
      },
    );
  }
}
