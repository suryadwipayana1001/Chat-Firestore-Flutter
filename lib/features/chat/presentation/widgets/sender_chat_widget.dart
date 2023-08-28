import 'package:flutter/material.dart';

import '../../data/models/chat_model.dart';

class SenderChatWidget extends StatelessWidget {
  final ChatModel data;
  const SenderChatWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  constraints: BoxConstraints(minHeight: 20.0, minWidth: 50.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                  ),
                  child: Text(data.message),
                ),
                SizedBox(
                  width: 16.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue[900],
                  child: const Text('A'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
