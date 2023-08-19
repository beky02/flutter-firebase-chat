import 'package:firebase_chat/cubit/fetch_conversation_message_cubit/index.dart';
import 'package:firebase_chat/cubit/firebase_auth_cubit/index.dart';
import 'package:firebase_chat/screens/login_screen/login_screen.dart';
import 'package:firebase_chat/screens/otp_screen/otp_screen.dart';
import 'package:firebase_chat/screens/conversation_list_screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //SharedPreferences sp;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FirebaseAuthBloc>(context).checkAuthStatus();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
    //    sp = await SharedPreferences.getInstance()
    //         ..setString('token', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEsImV4cCI6MTYxOTk1MDAyNX0.MqWxEFAw3qfhcXnu0zydU_zUBl5sfCkfHRG5pi9saCs");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FirebaseAuthBloc, FirebaseAuthState>(
        listener: (context, state) {
          print("listener --------");
          print(state);
          if (state is SuccessfulFirebaseAuthState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BlocProvider<FetchConversationMessageCubit>(
                    child: ChatScreen(),
                    create: (context) => FetchConversationMessageCubit(),
                  ),
                ));
          }

          if (state is SuccessfulSignInState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BlocProvider<FetchConversationMessageCubit>(
                    child: ChatScreen(),
                    create: (context) => FetchConversationMessageCubit(),
                  ),
                ));
          }
        },
        builder: (cotext, state) {
          print("builder --------");
          print(state);
          if (state is CodeSentFirebaseAuthState) {
            return OtpScreen(
              verificationId: state.verificationId,
            );
          }

          return LoginScreen();
        },
      ),
    );
  }
}
