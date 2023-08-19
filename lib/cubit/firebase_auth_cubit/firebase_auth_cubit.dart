part of firebase_auth_cubit;

class FirebaseAuthBloc extends Cubit<FirebaseAuthState> {
  FirebaseAuthBloc() : super(InitialFirebaseAuthState());

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> checkAuthStatus() async {
    var currentUser = auth.currentUser;
    print(currentUser);
    await Future.delayed(Duration(seconds: 2));
    if (currentUser != null) {
      emit(SuccessfulSignInState());
    } else
      emit(NotSignInState());
  }

  Future<void> signInWithPhoneNumber({required String phoneNumber}) async {
    auth.verifyPhoneNumber(
        phoneNumber: '+251' + phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (exception) {},
        codeSent: (verificationId, forceResendingToken) {
          // emit(VerificationCodeSentEvent(verificationId));
          emit(CodeSentFirebaseAuthState(verificationId));
        },
        codeAutoRetrievalTimeout: (timeout) {});
  }

  Future<void> verifyOTP(
      {required String verificationId, required String code}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);
    try {
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      emit(SuccessfulFirebaseAuthState(userCredential));
    } catch (e) {}
  }
}
