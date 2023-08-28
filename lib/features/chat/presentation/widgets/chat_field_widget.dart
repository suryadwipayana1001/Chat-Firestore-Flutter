import 'package:chatapp/core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/chat_argument.dart';
import '../../data/models/chat_model.dart';
import '../providers/chat_provider.dart';
import '../providers/chat_state.dart';

class ChatFieldWidget extends StatefulWidget {
  String idRoomChat;
  ChatFieldWidget({super.key, required this.idRoomChat});

  @override
  State<ChatFieldWidget> createState() => _ChatFieldWidgetState();
}

class _ChatFieldWidgetState extends State<ChatFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, provider, _) {
      return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, -1),
          ),
        ]),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: provider.messageController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: 'Masukkan teks...',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                ChatArgument data = ChatArgument(
                    date: Timestamp.now(),
                    message: provider.messageController.text,
                    isRead: false,
                    idUSer: provider.meId);
                provider.sendMesssage(widget.idRoomChat).listen((state) {
                  switch (state.runtimeType) {
                    case ChatSended:
                      FocusManager.instance.primaryFocus?.unfocus();
                      provider.messageController.clear();
                      break;
                    case ChatFailure:
                      printError("cannot send chat");
                      break;
                    default:
                  }
                });
              },
              icon: Icon(Icons.send),
            ),
          ],
        ),
      );
    });
  }
}
