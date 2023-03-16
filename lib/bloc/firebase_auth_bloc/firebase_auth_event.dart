

import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthEvent{}
class CheckAuthStatus extends FirebaseAuthEvent {}

class FirbasePhoneAuth extends FirebaseAuthEvent {
  final String phoneNumber;

  FirbasePhoneAuth(this.phoneNumber);
  
}

class VerificationCodeSentEvent extends FirebaseAuthEvent {
  final String verificationId;

  VerificationCodeSentEvent(this.verificationId);
  
}


class FirbaseSmsCodeAuth extends FirebaseAuthEvent {
  final String verificationId;
  final String code;

  FirbaseSmsCodeAuth(this.verificationId, this.code);
}

class VerificationCompletedEvent extends FirebaseAuthEvent {
   final PhoneAuthCredential credential;

  VerificationCompletedEvent(this.credential);
  
}








