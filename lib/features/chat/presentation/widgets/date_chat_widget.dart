import 'package:flutter/material.dart';

import '../../../../core/static/style.dart';

class DateChatSepratorWidget extends StatelessWidget {
  final DateTime date;
  const DateChatSepratorWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          date.toString(),
          style: chatDateTextStyle,
        ),
      ),
    );
  }
}
