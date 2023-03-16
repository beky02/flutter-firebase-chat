import 'package:firebase_chat/bloc/chat_bloc/chat_bloc.dart';
import 'package:firebase_chat/bloc/firebase_auth_bloc/firebase_auth_bloc.dart';
import 'package:firebase_chat/bloc/firebase_auth_bloc/firebase_auth_event.dart';
import 'package:firebase_chat/bloc/firebase_auth_bloc/firebase_auth_state.dart';
import 'package:firebase_chat/screens/auth/login_screen.dart';
import 'package:firebase_chat/screens/auth/otp_screen.dart';
import 'package:firebase_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  //SharedPreferences sp;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FirebaseAuthBloc>(context).add(CheckAuthStatus());
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
    //    sp = await SharedPreferences.getInstance()
    //         ..setString('token', "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEsImV4cCI6MTYxOTk1MDAyNX0.MqWxEFAw3qfhcXnu0zydU_zUBl5sfCkfHRG5pi9saCs");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FirebaseAuthBloc, FirebaseAuthState>(
        listener: (context, state) async {
          if (state is SuccessfulFirebaseAuthState) {
            //print('token');
            // print(state.credential.additionalUserInfo.isNewUser);
            // String token = await state.credential.user.getIdToken();
            //print(token);

            // BlocProvider.of<FirebaseAuthBloc>(context).add(SignInEvent(token));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<ChatBloc>(
                    child: ChatScreen(),
                    create: (context) => ChatBloc(),
                  ),
                ));
          }

          if (state is SuccessfulSignInState) {
            // setState(() {
            //   UserModel.userModel = state.userModel;
            // });
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<ChatBloc>(
                    child: ChatScreen(),
                    create: (context) => ChatBloc(),
                  ),
                ));
          }
          // if (state is NotSignInState) {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => BlocProvider<FirebaseAuthBloc>(
          //           child: LoginScreen(),
          //           create: (context) => FirebaseAuthBloc(),
          //         ),
          //       ));
          // }
        },
        builder: (cotext, state) {
          print(state);
          if (state is NotSignInState) {
            return LoginScreen();
          }
          if (state is CodeSentFirebaseAuthState) {
            return OtpScreen(
              verificationId: state.verificationId,
            );
          }

          return Container(
            child: Center(child: Text("This is Chat")),
          );
        },
      ),
    );
  }
}
