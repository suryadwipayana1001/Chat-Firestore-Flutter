import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/chat_argument.dart';
import '../repositories/chat_repository.dart';

abstract class SendChatUseCase<Type> {
  Future<Either<Failure, bool>> call(
      {required ChatArgument message, required roomId});
}

class SendChat implements SendChatUseCase<Type> {
  ChatRepository repository;

  SendChat(this.repository);

  @override
  Future<Either<Failure, bool>> call(
      {required ChatArgument message, required roomId}) async {
    return await repository.sendChat(message: message, roomId: roomId);
  }
}
