import 'package:flutter/material.dart';

import '../../data/models/chat_model.dart';

class ReceiveChatWidget extends StatelessWidget {
  final ChatModel data;
  const ReceiveChatWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber[900],
                  child: const Text('B'),
                ),
                SizedBox(width: 16.0),
                Container(
                  padding: EdgeInsets.all(5.0),
                  constraints: BoxConstraints(minHeight: 20.0, minWidth: 50.0),
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                  ),
                  child: Text(data.message),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
