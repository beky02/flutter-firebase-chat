part of firebase_auth_cubit;

abstract class FirebaseAuthState {}

class SuccessfulSignInState extends FirebaseAuthState {}

class NotSignInState extends FirebaseAuthState {}

class SuccessfulFirebaseAuthState extends FirebaseAuthState {
  final UserCredential credential;

  SuccessfulFirebaseAuthState(this.credential);
}

class InitialFirebaseAuthState extends FirebaseAuthState {}

class CodeSentFirebaseAuthState extends FirebaseAuthState {
  final String verificationId;

  CodeSentFirebaseAuthState(this.verificationId);
}
