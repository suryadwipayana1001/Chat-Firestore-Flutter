import 'package:chatapp/features/chat/presentation/pages/chat_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/core.dart';
import 'features/chat/presentation/pages/chat_page.dart';
import 'features/chat/presentation/providers/chat_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  try {
    await Firebase.initializeApp();
    runApp(MyApp());
  } catch (e) {
    printError(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChatProvider>(
          create: (_) => ChatProvider(sendChat: locator()),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chat Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ChatListPage(),
        );
      },
    );
  }
}
