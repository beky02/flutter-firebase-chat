import 'package:firebase_chat/cubit/firebase_auth_cubit/index.dart';
import 'package:firebase_chat/screens/login_screen/login_screen.dart';
import 'package:firebase_chat/screens/otp_screen/otp_screen.dart';
import 'package:firebase_chat/screens/conversation_list_screen/conversation_list_screen.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FirebaseAuthBloc, FirebaseAuthState>(
        listener: (context, state) {
          if (state is SuccessfulSignInState ||
              state is SuccessfulFirebaseAuthState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(),
              ),
            );
          }
        },
        builder: (cotext, state) {
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
