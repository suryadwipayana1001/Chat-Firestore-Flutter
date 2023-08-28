import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/chat_argument.dart';
import '../../data/models/chat_model.dart';

abstract class ChatRepository {
  Future<Either<Failure, bool>> sendChat(
      {required ChatArgument message, required roomId});
}
