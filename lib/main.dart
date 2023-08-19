import 'package:firebase_chat/cubit/fetch_conversation_message_cubit/index.dart';
import 'package:firebase_chat/cubit/firebase_auth_cubit/index.dart';
import 'package:firebase_chat/resources/conversation_service.dart';
import 'package:firebase_chat/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FirebaseAuthBloc>(
          create: (context) => FirebaseAuthBloc(),
        ),
        BlocProvider<FetchConversationCubit>(
          create: (context) => FetchConversationCubit(
              conversationService: ConversationService()),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen()),
    );
  }
}
