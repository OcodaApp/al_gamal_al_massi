import 'package:firebase_auth/firebase_auth.dart';
import 'package:either_dart/either.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<Either<String, UserCredential>> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      print("e.code");
      print(e.code);
      String error = '';
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          error = 'Email already used. Go to login page.';
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          error = 'Wrong email/password';
          break;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          error = 'No user found with this email.';
          break;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          error = 'User disabled.';
          break;
        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          error = 'Too many requests to log into this account.';
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          error = 'Server error, please try again later.';
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          error = 'Email address is invalid.';
          break;
        case "invalid-credential":
          error = 'Invalid Credentials';
          break;
        default:
          error = 'Login failed. Please try again.';
      }
      return Left(error);
    } catch (e) {
      return const Left("UnKnown Error");
    }
  }

  Future<Either<String, UserCredential>> register({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      String error = '';
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          error = 'Email already used. Go to login page.';
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          error = 'Wrong email/password';
          break;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          error = 'No user found with this email.';
          break;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          error = 'User disabled.';
          break;
        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          error = 'Too many requests to log into this account.';
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          error = 'Server error, please try again later.';
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          error = 'Email address is invalid.';
          break;
        default:
          error = 'Login failed. Please try again.';
      }
      return Left(error);
    } catch (e) {
      return const Left("UnKnown Error");
    }
  }

  Future<void> uploadUserIdAndEmailToFireStore({
    required UserCredential credentials,
    required String userName,
  }) async {
    try {
      await firebaseFirestore
          .collection("users")
          .doc(credentials.user?.uid)
          .set({
        "email": credentials.user?.email,
        "userId": credentials.user?.uid,
        "userName": userName,
      });
    } catch (e) {
      rethrow;
    }
  }
}
