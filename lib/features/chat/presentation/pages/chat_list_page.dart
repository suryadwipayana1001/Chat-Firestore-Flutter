import 'package:chatapp/core/core.dart';
import 'package:chatapp/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List _lisName = [
    "Luffy",
    "Zoro",
    "Nami",
    "Usop",
    "Sanji",
    "Robin",
    "Choper",
    "Franky",
    "Brook",
    "Jinbei"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat List"),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      idRoomChat: index.toString(),
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(child: Text('A')),
                  title: Text(_lisName[index]),
                  subtitle: Text('Supporting text'),
                ),
              ),
            );
          },
          itemCount: _lisName.length,
          //item count jumlah chat dari api
        ),
      ),
    );
  }
}
