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
            brightness: Brightness.dark,
            primaryColor: Colors.lightBlue[800],
            scaffoldBackgroundColor: const Color(0xFFFFFFFF), // White
            colorScheme: const ColorScheme(
              primary: Color(0xFFFFFFFF),
              // White
              onPrimary: Color(0xFF0D0D0D),
              // Cod Gray
              secondary: Color(0xFF0F30C9),
              // Purple Heart
              onSecondary: Color(0xFFFFFFFF),
              // White
              tertiary: Color(0xFF009246),
              // Chateau Green
              onTertiary: Color(0xFF526BEC),
              // Expertises blue
              error: Color(0xFFD9042B),
              // Scarlet
              onError: Color(0xFFFFFFFF),
              // White
              background: Color(0xFFFFFFFF),
              // White
              onBackground: Color(0xFF0D0D0D),
              // Cod Gray
              shadow: Color(0xFF72767A),
              // Rolling Stone
              outline: Color(0xFFF0F0F0),
              // Seashell
              surface: Color(0xFFFF7152),
              // orange
              onSurface: Color(0xFFE7ECFF),
              // Cod Gray
              scrim: Color(0xFFA6A6A6),
              // Silver Chalice
              surfaceTint: Color(0xFF000000),
              // Black
              brightness: Brightness.light,
            ),
            fontFamily: "inter",
            textTheme: const TextTheme(
              displayLarge:
                  TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              // title text
              titleLarge: TextStyle(
                fontSize: 20,
                height: 24 / 20,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
                color: Colors.black,
              ),
              titleMedium: TextStyle(
                fontSize: 18,
                height: 24 / 18,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
                color: Colors.black,
              ),
              titleSmall: TextStyle(
                fontSize: 16,
                height: 22 / 16,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
                color: Colors.black,
              ),

              // body text
              bodyMedium: TextStyle(
                fontSize: 13,
                height: 18 / 13,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.3,
                color: Color(0xFF72767A),
              ),
              bodyLarge: TextStyle(
                fontSize: 14,
                height: 20 / 14,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.3,
                color: Colors.black,
              ),
            ),
          ),
          home: SplashScreen()),
    );
  }
}
