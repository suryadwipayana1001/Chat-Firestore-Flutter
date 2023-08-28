import 'package:chatapp/features/chat/presentation/providers/chat_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import '../../../../core/core.dart';
import '../../data/models/chat_model.dart';
import '../widgets/date_chat_widget.dart';
import '../widgets/receive_chat_widget.dart';
import '../widgets/sender_chat_widget.dart';
import '../widgets/chat_field_widget.dart';

class ChatPage extends StatefulWidget {
  String idRoomChat;
  ChatPage({super.key, required this.idRoomChat});
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late Stream<QuerySnapshot> _chatStream;
  final _fireBase = FirebaseFirestore.instance;
  final GroupedItemScrollController _itemScrollController =
      GroupedItemScrollController();
  @override
  void initState() {
    super.initState();
    final provider = context.read<ChatProvider>();
    final check =
        _fireBase.collection(primaryCollection).doc(widget.idRoomChat);
    check.get().then(
      (doc) {
        if (!doc.exists) {
          check.set({});
        }
      },
    );
    //load chat id room dan berdasarkan type == 1
    _chatStream = _fireBase
        .collection(primaryCollection)
        .doc(widget.idRoomChat)
        .collection(secondaryCollection)
        .where("type", whereIn: [1]).snapshots();
    //read all chat
    _fireBase
        .collection(primaryCollection)
        .doc(2.toString())
        .collection(secondaryCollection)
        .where("isRead", isEqualTo: false)
        .where("sender", isEqualTo: provider.meId)
        .get()
        .then((query) {
      for (var doc in query.docs) {
        doc.reference.update({"isRead": true});
      }
    });
  }

  // store the raw item to model
  List<ChatModel> rawDataToModel(List<QueryDocumentSnapshot>? data) {
    return data
            ?.map((DocumentSnapshot doc) => ChatModel.fromDocument(doc))
            .toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("Chat"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _chatStream,
                      builder: (context, snapshot) {
                        List<ChatModel> chatList =
                            rawDataToModel(snapshot.data?.docs);
                        if (snapshot.hasError) {
                          printError("Gagal load chat");
                          return const Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          printWarning("Loading chat");
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        printSuccess("Berhasil load chat");
                        return StickyGroupedListView<ChatModel, DateTime>(
                          shrinkWrap: true,
                          itemScrollController: _itemScrollController,
                          order: StickyGroupedListOrder.DESC,
                          physics: const BouncingScrollPhysics(),
                          elements: chatList,
                          groupComparator: (DateTime value1, DateTime value2) {
                            return value2.compareTo(value1);
                          },
                          itemComparator: (element1, element2) {
                            return element2.date.compareTo(element1.date);
                          },
                          groupSeparatorBuilder: (element) {
                            return DateChatSepratorWidget(date: element.date);
                          },
                          groupBy: (element) {
                            return DateTime(element.date.year,
                                element.date.month, element.date.day);
                          },
                          itemBuilder: (context, data) {
                            return Column(
                              children: [
                                data.sender == provider.meId
                                    ? SenderChatWidget(
                                        data: data,
                                      )
                                    : ReceiveChatWidget(
                                        data: data,
                                      ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              ChatFieldWidget(
                idRoomChat: widget.idRoomChat,
              ),
            ],
          ),
        ),
      );
    });
  }
}
