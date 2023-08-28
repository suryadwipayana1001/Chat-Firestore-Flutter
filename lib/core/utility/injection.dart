import 'package:chatapp/features/chat/data/datasource/chat_datasource.dart';
import 'package:chatapp/features/chat/data/repositories/chat_repository_implementation.dart';
import 'package:chatapp/features/chat/domain/repositories/chat_repository.dart';
import 'package:chatapp/features/chat/presentation/providers/chat_provider.dart';
import 'package:get_it/get_it.dart';

import '../../features/chat/domain/usecase/send_chat.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //provider
  locator.registerFactory(
    () => ChatProvider(sendChat: locator<SendChat>()),
  );
  // usecase
  locator.registerLazySingleton<SendChat>(() => SendChat(locator()));
  //repository
  locator.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImplementation(
      dataSource: locator(),
    ),
  );
  //datasource
  locator.registerLazySingleton<ChatDataSource>(
      () => ChatDataSourceImplementation());
}
