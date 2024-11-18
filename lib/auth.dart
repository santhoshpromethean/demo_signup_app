import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // User? get loggedUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Future<void> signInWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   await _firebaseAuth.signInWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );
  // }
  //
  // Future<void> createUserWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   await _firebaseAuth.createUserWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );
  // }

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) onVerified,
    required Function(String verificationId) onCodeSent,
    required Function(FirebaseAuthException) onError,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
        onVerified(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        onError(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> signInWithOTP({
    required String verificationId,
    required String otp,
  }) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
