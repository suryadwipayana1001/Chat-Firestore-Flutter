import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasource/chat_datasource.dart';
import '../models/chat_argument.dart';

class ChatRepositoryImplementation implements ChatRepository {
  ChatDataSource dataSource;

  ChatRepositoryImplementation({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, bool>> sendChat(
      {required ChatArgument message, required roomId}) async {
    try {
      final response = await dataSource.sendChat(data: message, roomId: roomId);
      return Right(response);
    } catch (e) {
      printWarning(e);
      return const Left(ServerFailure());
    }
  }
}
