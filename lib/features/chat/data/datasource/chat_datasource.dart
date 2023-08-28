import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/core.dart';
import '../models/chat_argument.dart';
import '../models/chat_model.dart';

abstract class ChatDataSource {
  Future<bool> sendChat({required ChatArgument data, required String roomId});
}

class ChatDataSourceImplementation implements ChatDataSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  Future<bool> sendChat(
      {required ChatArgument data, required String roomId}) async {
    try {
      await _db
          .collection(primaryCollection)
          .doc(roomId.toString())
          .collection(secondaryCollection)
          .add(data.toMap());
      printSuccess("Sukses Send");
      return true;
    } catch (e) {
      printError("Gagal Send $e");
      return false;
    }
  }
}
