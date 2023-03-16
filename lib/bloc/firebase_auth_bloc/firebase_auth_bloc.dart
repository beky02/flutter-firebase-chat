import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/bloc/firebase_auth_bloc/firebase_auth_event.dart';
import 'package:firebase_chat/bloc/firebase_auth_bloc/firebase_auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  FirebaseAuthBloc() : super(InitialFirebaseAuthState());

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Stream<FirebaseAuthState> mapEventToState(FirebaseAuthEvent event) async* {
    if (event is CheckAuthStatus) {
      var currentUser = auth.currentUser;
      print(currentUser);

      if (currentUser != null) {
        yield SuccessfulSignInState();
      } else
        yield NotSignInState();
    }

    if (event is FirbasePhoneAuth) {
      auth.verifyPhoneNumber(
          phoneNumber: '+251' + event.phoneNumber,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (exception) {
            print("verificationFailed");
            print(exception);
          },
          codeSent: (verificationId, forceResendingToken) {
            print("codeSent");
            print(verificationId);
            add(VerificationCodeSentEvent(verificationId));
          },
          codeAutoRetrievalTimeout: (timeout) {});
    }

    if (event is VerificationCodeSentEvent) {
      print("VerificationCodeSentEvent");
      yield CodeSentFirebaseAuthState(event.verificationId);
    }
    if (event is FirbaseSmsCodeAuth) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: event.verificationId, smsCode: event.code);
      add(VerificationCompletedEvent(credential));
    }
    if (event is VerificationCompletedEvent) {
      try {
        UserCredential userCredential =
            await auth.signInWithCredential(event.credential);
        yield SuccessfulFirebaseAuthState(userCredential);
      } catch (e) {}
    }
  }
}
